import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/constants/colors.dart';
import 'package:neo_todo/main.dart';
import 'package:neo_todo/models/todo.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/custom_app_bar.dart';
import 'package:neo_todo/widgets/text_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // late Stream<List<Todo>> tasksStream;
  late List<Todo> tasks;

  void getAllTasks() {
    tasks = objectBox.getTasks();
  }

  @override
  void initState() {
    super.initState();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      extendBody: true,
      appBar: const CustomAppBar(
        firstTitle: 'To Do',
        subtitle: '4 total tasks left',
        trailingIcon: Icons.inventory_outlined,
        textColor: todoColor,
      ),
      body: SizedBox(
        height: double.infinity,
        child: tasks.isEmpty
            ? const Center(
                child: TextWidget(
                'You don\'t have any tasks right now\n'
                'Use the + button to add new',
                textAlign: TextAlign.center,
                fontSize: 14,
              ))
            : ListView.builder(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    onDismissed: (direction) {
                      objectBox.deleteTask(tasks[index].id);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          const MarkedNeumorphicButtonWidget(),
                          Expanded(
                              child: GestureDetector(
                            onLongPress: () {},
                            child: MarkedNeumorphicButtonWidget(
                              title: tasks[index].title,
                              isMarkedIcon: false,
                            ),
                          )),
                        ],
                      ),
                    ),
                  );
                },
              ),
        // child: StreamBuilder<List<Todo>>(
        //   stream: objectBox.getTasks(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const Center(
        //           child: TextWidget(
        //         'You don\'t have any tasks right now\n'
        //         'Use the + button to add new',
        //         textAlign: TextAlign.center,
        //         fontSize: 14,
        //       ));
        //     } else {
        //       log(snapshot.data.toString());
        //       final tasks = snapshot.data;
        //       return ListView.builder(
        //         padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        //         itemCount: tasks!.length,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             margin: const EdgeInsets.only(bottom: 20),
        //             child: Row(
        //               children: <Widget>[
        //                 const MarkedNeumorphicButtonWidget(),
        //                 Expanded(
        //                     child: MarkedNeumorphicButtonWidget(
        //                   title: tasks[index].title,
        //                   isMarkedIcon: false,
        //                 )),
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // )
      ),
    );
  }
}
