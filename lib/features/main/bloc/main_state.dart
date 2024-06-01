part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class TabBarState extends MainState {
  final int index;

  TabBarState({required this.index});
}
