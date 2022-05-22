import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/constants/colors.dart';
import 'package:neo_todo/main.dart';
import 'package:neo_todo/models/todo.dart';
import 'package:neo_todo/screens/redeem_screen.dart';
import 'package:neo_todo/screens/todo_screen.dart';
import 'package:neo_todo/utiils/show_custom_modal_bottom_sheet.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/difficulty_level_widget.dart';
import 'package:neo_todo/widgets/navigator.dart';
import 'package:neo_todo/widgets/text_widget.dart';

import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedIndex = 0;
  final screens = [
    const TodoScreen(),
    const RedeemScreen(),
  ];
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: screens[selectedIndex],
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottomAppBar(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Container(
            height: 105,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: buttonBackgroundColor,
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.6),
                  width: 3,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NeumorphicButtonWidget(
                    icon: Icons.menu_outlined,
                    color: menuButtonColor,
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    }),
                NeumorphicButtonWidget(
                    icon: Icons.checklist_outlined,
                    color: selectedIndex == 0
                        ? markedUndoneAndClickedIconColor
                        : todoColor,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }),
                NeumorphicButtonWidget(
                    icon: Icons.account_balance_wallet_outlined,
                    color: selectedIndex == 1
                        ? markedUndoneAndClickedIconColor
                        : redeemColor,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }),
                NeumorphicButtonWidget(
                    icon: Icons.add_outlined,
                    color: selectedIndex == 0 ? todoColor : redeemColor,
                    isCircularBottomNavButton: true,
                    onPressed: () {
                      showCustomModalBottomSheet(
                        context,
                        title: 'NEW TASK',
                        description: 'Enter the task to be completed\n'
                            'and it\'s difficulty level',
                        isAddNewTaskOption: true,
                        primaryTextController: taskController,
                        primaryHintText: 'What to do?',
                        secondaryContentInput: Row(
                          children: const <Widget>[
                            TextWidget(
                              'Choose Difficulty Level',
                              fontSize: 16,
                            ),
                            Spacer(),
                            DifficultyLevelWidget(color: easyLevelColor),
                            SizedBox(width: 20),
                            DifficultyLevelWidget(color: mediumLevelColor),
                            SizedBox(width: 20),
                            DifficultyLevelWidget(color: difficultLevelColor),
                          ],
                        ),
                        onPressed: () {
                          Todo task = Todo(title: taskController.text);
                          objectBox.addTask(task);
                          navigateBack(context: context);
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
