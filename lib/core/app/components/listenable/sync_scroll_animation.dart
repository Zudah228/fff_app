import 'package:flutter/material.dart';

class SyncScrollAnimation extends StatelessWidget {
  const SyncScrollAnimation({
    super.key,
    this.scrollController,
    required this.child,
  });

  final ScrollController? scrollController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scrollController =
        this.scrollController ?? PrimaryScrollController.of(context);

    return ListenableBuilder(
      listenable: scrollController,
      builder: (context, child) => Transform.translate(
        offset: Offset(
          0,
          scrollController.hasClients ? -scrollController.position.pixels : 0,
        ),
        child: child,
      ),
      child: child,
    );
  }
}
