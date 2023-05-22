import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/tree_node.dart';

part 'binarytreebloc_event.dart';
part 'binarytreebloc_state.dart';

class Binarytreebloc extends Bloc<BinarytreeblocEvent, BinarytreeblocState> {
  Binarytreebloc() : super(BinarytreeblocState(root: null)) {
    on<InsertEvent>((event, emit) {
      Node newRoot = Node(event.value);
      if (state.root == null) {
        emit(BinarytreeblocState(root: newRoot));
      } else {
        _insertNode(state.root!, newRoot);
        emit(BinarytreeblocState(root: state.root!));
      }
    });
  }

  void _insertNode(Node root, Node newNode) {
    if (newNode.value < root.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        _insertNode(root.left!, newNode);
        root.hasLeftChild = true;
      }
    } else if (newNode.value > root.value) {
      if (root.right == null) {
        root.right = newNode;
      } else {
        _insertNode(root.right!, newNode);
        root.hasRightChild = true;
      }
    }
  }
}
