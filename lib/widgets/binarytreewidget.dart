import 'dart:math' as math;

import 'package:binarysearch_tree/models/tree_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/binarytreebloc_bloc.dart';

// ignore: must_be_immutable
class TreeView extends StatelessWidget {
  Node? node;
  TreeView({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Binarytreebloc, BinarytreeblocState>(
      builder: (context, state) {
        // ignore: unnecessary_type_check
        if (state is BinarytreeblocState) {
          return _buildTree(state.root);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildTree(Node? node) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: node?.value == null ? Container() : binaryTree(node),
    );
  }

  Column binaryTree(Node? node) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: AnimatedContainer(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
            duration: const Duration(seconds: 2),
            child: Center(
              child: Text('${node?.value}'),
            ),
          ),
        ),
        Row(
          children: [
            node?.left?.value != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Transform.rotate(
                        angle: 120 * math.pi / 180,
                        child: const Icon(
                          Icons.arrow_right_alt,
                          size: 40,
                        )),
                  )
                : Container(),
            node?.right?.value != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Transform.rotate(
                        angle: 45 * math.pi / 180,
                        child: const Icon(
                          Icons.arrow_right_alt,
                          size: 40,
                        )),
                  )
                : Container(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _buildTree(node?.left),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: _buildTree(node?.right),
            ),
          ],
        ),
      ],
    );
  }
}
