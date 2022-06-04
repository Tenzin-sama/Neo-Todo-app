import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/constants/colors.dart';

class DifficultyLevelWidget extends StatelessWidget {
  const DifficultyLevelWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: NeumorphicButton(
        onPressed: () {},
        padding: const EdgeInsets.all(8),
        style: NeumorphicStyle(
          color: color ?? easyLevelColor,
          shape: NeumorphicShape.flat,
          intensity: 1,
          shadowDarkColor: buttonBackgroundColor,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        ),
        provideHapticFeedback: false,
      ),
    );
  }
}
