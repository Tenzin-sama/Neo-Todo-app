import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/text_widget.dart';

import '../constants/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Drawer(
        backgroundColor: canvasColor,
        child: Column(
          children: [
            Container(
              color: buttonBackgroundColor,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  TextWidget(
                    'NeoTodo',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    'Complete Tasks',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: canvasColor,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.6),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, -1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        NeumorphicCardWidget(
                          icon: Icons.inventory_outlined,
                          title: 'Task History',
                          color: todoColor,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 25),
                        NeumorphicCardWidget(
                          icon: Icons.settings_outlined,
                          title: 'Redeem Settings',
                          color: redeemColor,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 25),
                        NeumorphicCardWidget(
                          icon: Icons.tips_and_updates_outlined,
                          title: 'Help',
                          color: menuButtonColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    NeumorphicCardWidget(
                      icon: Icons.help_outline,
                      title: 'About NeoTodo',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
