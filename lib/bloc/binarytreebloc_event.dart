part of 'binarytreebloc_bloc.dart';

abstract class BinarytreeblocEvent {}

class InsertEvent extends BinarytreeblocEvent {
  final int value;
  InsertEvent({required this.value});
}
