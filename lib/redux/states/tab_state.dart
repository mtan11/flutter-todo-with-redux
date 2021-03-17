import 'package:flutter/material.dart';

@immutable
class TabState {
  final int currentIndex;

  const TabState({this.currentIndex});

  factory TabState.initial() => const TabState(currentIndex: 0);

  TabState copyWith({int currentIndex}) {
    return TabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
