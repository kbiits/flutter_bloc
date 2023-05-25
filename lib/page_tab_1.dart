import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:learn_bloc/cubit/todo_cubit.dart';

class PageTab1 extends StatelessWidget {
  PageTab1({super.key});

  late CounterCubit counterCubit;
  late TodoCubit todoCubit;

  @override
  Widget build(BuildContext context) {
    counterCubit = context.read<CounterCubit>();
    todoCubit = context.read();

    // myapp -> bottom bar -> page tab 1 (init todocubit)
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            log("state baru");
            return Text(
              state.counter.toString(),
              style: const TextStyle(
                fontSize: 48,
              ),
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            counterCubit.addCounter();
          },
          child: Text("Add"),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () async {
            todoCubit.loadTodo();
          },
          child: Text("Fetch data todo"),
        ),
        ElevatedButton(
          onPressed: () async {
            todoCubit.makeTodoInitial();
          },
          child: Text("change todo state to initial"),
        ),
        BlocBuilder<TodoCubit, TodoState>(builder: (ctx, state) {
          if (state is TodoLoading) {
            return Text("loading todo");
          }
          if (state is TodoInitial) {
            return Text("initial todo");
          }
          return Text("todo loaded");
        })
      ],
    );
  }
}
