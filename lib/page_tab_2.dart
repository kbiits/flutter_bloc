import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:learn_bloc/cubit/todo_cubit.dart';

class PageTab2 extends StatelessWidget {
  PageTab2({super.key});

  late CounterCubit counterCubit;
  late TodoCubit todoCubit;

  @override
  Widget build(BuildContext context) {
    counterCubit = context.read<CounterCubit>();
    todoCubit = context.read<TodoCubit>();

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            counterCubit.addCounter();
          },
          child: Text("Add"),
        ),
        BlocBuilder<TodoCubit, TodoState>(builder: (ctx, state) {
          if (state is TodoLoaded) {
            return Text("todo loaded");
          }

          if (state is TodoInitial) {
            return Text("todo initial");
          }

          return Text("todo loading");
        })
      ],
    );
  }
}
