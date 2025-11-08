# フィーチャーファースト アーキテクチャガイド

## 概要

このFlutterモバイルアプリケーションは**フィーチャーファーストアーキテクチャパターン**に従い、技術的なレイヤーではなくビジネス機能を中心としてコードを整理しています。このアプローチにより、関連する機能を一箇所にまとめることで、保守性、拡張性、およびチームの協力体制が向上します。

## ディレクトリ構造

```
lib/
├── main.dart                   # アプリケーションのエントリーポイント
├── core/                       # 共有アプリケーション基盤
│   ├── app/                    # アプリ画面レベルの設定
│   │   ├── app.dart            # メインアプリ設定
│   │   ├── components/         # 再利用可能なUIコンポーネント
│   │   ├── hooks/              # flutter_hooks のカスタムフック
│   │   └── themes/             # アプリテーマ設定
│   ├── service/                # 外部サービス連携
│   │   ├── algolia/
│   │   └── firebase/
│   └── utils/                  # ユーティリティ関数
│       └── flavor.dart
└── features/                   # フィーチャーモジュール
    ├── auth/                   
    │   ├── components/         # 認証専用UIコンポーネント
    │   ├── models/             # 認証データモデル
    │   ├── providers/          # 状態
    │   ├── pages/              # 認証画面ページ
    │   └── repositories/       # 認証データレイヤー
    └── spot/
```

## アーキテクチャの原則

### 1. フィーチャーの分離
各フィーチャーは以下の要素で自己完結しています：
- **Components**: フィーチャー固有のUIウィジェット
- **Models**: データ構造とビジネスロジック
- **Pages**: 画面実装
- **Repositories**: データアクセスとビジネスロジックレイヤー

### 2. Coreの分離
`core/`ディレクトリには共有インフラストラクチャが含まれます：
- **App**: アプリケーション全体の設定とセットアップ
- **Service**: 外部サービス統合（Firebase、Algoliaなど）
- **Utils**: ユーティリティ関数とヘルパー

ビジネスロジック（フィーチャーに入れるべきもの）を置いてはいけない。

### 3. 依存関係の流れ
```
Features → Core        - 許可
Core → Features        - 禁止
Feature A → Feature B  - 積極的に推奨する
```

## 実装ガイドライン

### 新しいフィーチャーの追加
1. `lib/features/[feature_name]/`の下に新しいディレクトリを作成
2. 標準的なサブディレクトリを含める：
   ```
   features/[feature_name]/
   ├── components/
   ├── models/
   ├── pages/
   └── repositories/
   ```

### フィーチャー構造の詳細

#### Components
- フィーチャー固有のUIウィジェット
- フィーチャー内で再利用可能であるべき
- フィーチャーのモデルとリポジトリに依存可能

#### Models
- データ転送オブジェクト（DTO）
- ビジネスロジックエンティティ
- バリデーションロジック
- 状態管理モデル

#### Pages
- 画面実装
- ナビゲーションロジック
- ページレベルの状態管理
- コンポーネントとリポジトリ間の調整

#### Repositories
- データアクセスレイヤー
- API呼び出しとデータ変換
- キャッシュロジック
- ビジネスロジック実装

### Coreガイドライン

#### Appディレクトリ
- アプリケーション初期化
- グローバル設定
- フィーチャー間で再利用可能なコンポーネント
- アプリ全体のフックとユーティリティ
- テーマ設定

#### Serviceディレクトリ
- 外部サービス設定
- サードパーティ統合
- APIクライアント
- サービス抽象化

## Future でインスタンスを取得する Service クラス
外部パッケージのインスタンスを Future で取得する Service クラスの実装パターン。

### Service クラスの実装
```dart
@riverpod
SomeService someService(Ref ref) {
  return throw UnimplementedError(
    'SomeService.initialize() を実行して '
    'someServiceProvider を override してください',
  );
}

class SomeService {
  SomeService(this._instance);

  static Future<SomeService> initialize() async {
    return SomeService(await SomeExternalPackage.getInstance());
  }

  final SomeExternalInstance _instance;

  // インスタンスへの直接アクセス
  SomeExternalInstance get instance => _instance;

  // プロパティへの同期アクセス
  String get someProperty => _instance.someProperty;
}
```

### main.dart での初期化
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late final SomeService someService;

  await Future.wait([
    Future(() async {
      someService = await SomeService.initialize();
    }),
  ]);

  final container = ProviderContainer(
    overrides: [
      someServiceProvider.overrideWithValue(someService),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}
```
#### Utilsディレクトリ
- ヘルパー関数
- 定数
- 拡張機能
- 設定ユーティリティ

## このアーキテクチャの利点

1. **モジュール性**: フィーチャーは自己完結しており、独立して開発可能
2. **拡張性**: 既存のものに影響を与えずに新しいフィーチャーを簡単に追加
3. **保守性**: 関連するコードが共存しているため、理解と修正が容易
4. **チーム協力**: 異なるチームが異なるフィーチャーで同時に作業可能
5. **テスト**: フィーチャーを個別にテスト可能
6. **コード再利用性**: 共有ロジックがcoreディレクトリに集約

## ベストプラクティス

1. **フィーチャーの独立性を保つ**: フィーチャー間の直接的な依存関係を避ける
2. **共有ロジックにはcoreを使用**: 共通機能を適切なcoreディレクトリに移動
3. **命名規則に従う**: フィーチャーとコンポーネントには説明的な名前を使用
4. **フィーチャー間依存関係を最小化**: フィーチャー通信にはイベントやサービスを使用
5. **一貫した構造を維持**: 各フィーチャーは同じディレクトリ構造に従う
6. **フィーチャー境界を文書化**: 各フィーチャーに何が属するかを明確に定義

## マイグレーションガイドライン

新しい機能を追加する際：
1. 既存のフィーチャーに属するか、新しいフィーチャーが必要かを判断
2. 新しいフィーチャーを作成する場合は、標準的なディレクトリ構造に従う
3. フィーチャーからcoreに共有ロジックを適切なタイミングで移動
4. フィーチャー間の依存関係をcore抽象化を通じてリファクタリング