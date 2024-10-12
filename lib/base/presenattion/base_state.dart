import 'package:rick_and_morty_app/core/enums/state_status.dart';

class BaseState<T> {
  final T? model;
  final StateStatus status;

  BaseState({this.model, required this.status});
}
