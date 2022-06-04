import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/constants/colors.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/navigator.dart';
import 'package:neo_todo/widgets/text_widget.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context,
    {required String title,
    required String description,
    bool isAddNewTaskOption = true,
    required String primaryHintText,
    required TextEditingController primaryTextController,
    String? secondaryHintText,
    TextEditingController? secondaryTextController,
    required Widget secondaryContentInput,
    required dynamic Function() onPressed}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                  title,
                  fontSize: 20,
                ),
                const SizedBox(height: 16),
                TextWidget(
                  description,
                  maxLines: 2,
                  color: cancelButtonColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      color: canvasColor,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      surfaceIntensity: 1,
                      shadowDarkColor: buttonBackgroundColor,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: primaryTextController,
                        style: const TextStyle(fontSize: 18, color: todoColor),
                        cursorColor: todoColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: primaryHintText,
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: cancelButtonColor,
                          ),
                          filled: true,
                          fillColor: canvasColor,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                secondaryContentInput,
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 45,
                      width: 130,
                      child: NeumorphicCardWidget(
                          icon: Icons.close_outlined,
                          title: 'CANCEL',
                          color: cancelButtonColor,
                          isNavCard: false,
                          onPressed: () {
                            navigateBack(context: context);
                          }),
                    ),
                    SizedBox(
                      height: 45,
                      width: 130,
                      child: NeumorphicCardWidget(
                        icon: Icons.add_circle_outline,
                        title: 'ADD',
                        color: isAddNewTaskOption ? todoColor : redeemColor,
                        isNavCard: false,
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    },
  );
}
