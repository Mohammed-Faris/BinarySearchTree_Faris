import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/binarytreebloc_bloc.dart';
import '../widgets/binarytreewidget.dart';

// ignore: must_be_immutable
class BinaryTreeScreen extends StatelessWidget {
  BinaryTreeScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Binary Search Tree"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: controller,
                  // onSubmitted: (value) {
                  //   if (controller.text == "") {
                  //     return;
                  //   }
                  //   context
                  //       .read<Binarytreebloc>()
                  //       .add(InsertEvent(value: int.parse(controller.text)));
                  //   controller.clear();
                  // },
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (controller.text == "") {
                      return;
                    }
                    context
                        .read<Binarytreebloc>()
                        .add(InsertEvent(value: int.parse(controller.text)));
                    controller.clear();
                  },
                  child: const Text("Insert")),
              const Text("Root"),
              const Icon(Icons.arrow_downward),
              const TreeView(),
            ],
          ),
        ));
  }
}
