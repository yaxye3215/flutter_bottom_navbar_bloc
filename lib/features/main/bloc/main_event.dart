part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class ChangeTabBArIndex extends MainEvent {
  final int index;

  ChangeTabBArIndex({required this.index});
}
