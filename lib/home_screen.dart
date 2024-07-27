import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do/task_model/task_model.dart';
import 'blocs/task/task_bloc.dart';
import 'custom_drawer.dart';
import 'light_theme.dart';



class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoBloc todoBloc = TodoBloc(Hive.box<Task>('todoBox'))..add(LoadTodos());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: kColorPrimary,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: todoBloc,
        buildWhen: (previous, current) => current is TodoLoaded,
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(state.todos[index].title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _displayUpdateDialog(context, index, todo),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          todoBloc.add(DeleteTodo(index));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Failed to load todos'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _displayAddDialog(BuildContext context) async {
    final textController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a ToDo'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Enter ToDo here'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  todoBloc.add(AddTodo(
                    textController.text,
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _displayUpdateDialog(BuildContext context, int index, Task todo) async {
    final textController = TextEditingController(text: todo.title);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update ToDo'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Enter new title here'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  todoBloc.add(UpdateTodo(
                      index,
                      Task(
                        title: textController.text,
                        isCompleted: todo.isCompleted,
                      )));
                  todoBloc.add(LoadTodos());
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}


