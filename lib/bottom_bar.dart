import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:learn_bloc/cubit/todo_cubit.dart';
import 'package:learn_bloc/page_tab_1.dart';
import 'package:learn_bloc/page_tab_2.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    PageTab1(),
    PageTab2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => TodoCubit()),
        ],
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


// MyApp -> BottomBar (initialize counter cubit) -> Page Tab 1
// context.read()

// MyApp -> BottomBar (initialize counter cubit) -> Page Tab 2



// (counter cubit 1) (counter cubit 2)
// MyApp -> BottomBar1 (initialize counter cubit) -> Page Tab 1

// MyApp -> BottomBar2 (initialize counter cubit) -> Page Tab 2