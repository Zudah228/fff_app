## ウィジェット引数として、表示するためだけの String、IconData は使わない

### ❌ NG

拡張性が低い

```dart
class TextInfo {
  const TextInfo({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 24)
        ),
      ],
    );
  }
}
```

### ⭕️ OK

`IconTheme.merge` や `DefaultTextStyle.merge` などの `InheritedWidget` を使って、拡張性のある実装にする。

URL を開く動作を含んでいたり、`Semantics` や `Tooltip` の関係で `String` にしたい場合などはその限りではない。

```dart
class TextInfo {
  const TextInfo({
    super.key,
    required this.text,
    required this.icon,
  });

  final Widget text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconTheme.merge(
          data: IconThemeData(
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
          chid: icon,
        ),
        DefaultTextStyle.merge(
          style: TextStyle(fontSize: 24),
          child: text,
        ),
      ],
    );
  }
}
```

## PrimaryScroll を意識する

ひとつのページに、１つのスクローラブルなら問題ないが、`IndexedStack` などで表示切り替えなどをして、複数のスクローラブルを扱う場合、PrimaryScroll を意識して開発する。

build 関数内で、今表示中であるかを監視して、各スクローラブルウィジェットの `primary` キーに `true` を渡すようにする。

```dart
  final isCurrentTab = ref.watch(mainTabProvider) == MainTab.myPage;

  return SingleChildScrollView(
    primary: isCurrentTab,
```

## SSOT の原則

### ❌ NG

```dart
final textEditingController = useTextEditingController();
final text = useState();

TextField(
  controller: textEditingController,
  onChanged: (value) {
    text.value = value;
  }
)

Text(text.value);
```

### ⭕️ OK

```dart
final textEditingController = useTextEditingController();

TextField(
  controller: textEditingController,
)

Text(text.value);
```

## ページから値を受け取る
