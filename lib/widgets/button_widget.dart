import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/widgets/difficulty_level_widget.dart';
import 'package:neo_todo/widgets/text_widget.dart';

import '../constants/colors.dart';

class CustomNeumorphicButtonWidget extends StatelessWidget {
  const CustomNeumorphicButtonWidget({
    Key? key,
    required this.icon,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: buttonBackgroundColor,
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1.5, 1.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        iconSize: 40,
        icon: Icon(
          icon,
          color: color ?? defaultTextColor,
        ),
        onPressed: () {},
      ),
    );
  }
}

class NeumorphicButtonWidget extends StatefulWidget {
  const NeumorphicButtonWidget({
    Key? key,
    required this.icon,
    this.color,
    this.isCircularBottomNavButton = false,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color? color;
  final bool isCircularBottomNavButton;
  final void Function()? onPressed;

  @override
  State<NeumorphicButtonWidget> createState() => _NeumorphicButtonWidgetState();
}

class _NeumorphicButtonWidgetState extends State<NeumorphicButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isCircularBottomNavButton ? 75 : 60,
      width: widget.isCircularBottomNavButton ? 75 : 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: widget.isCircularBottomNavButton
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius:
            widget.isCircularBottomNavButton ? null : BorderRadius.circular(12),
        color: buttonBackgroundColor,
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1.5, 1.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: NeumorphicButton(
        onPressed: widget.onPressed,
        padding: const EdgeInsets.all(8),
        style: NeumorphicStyle(
          color: buttonBackgroundColor,
          shape: NeumorphicShape.flat,
          intensity: 1,
          shadowDarkColor: buttonBackgroundColor,
          boxShape: widget.isCircularBottomNavButton
              ? const NeumorphicBoxShape.circle()
              : NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        ),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          iconSize: widget.isCircularBottomNavButton ? 50 : 30,
          icon: Icon(
            widget.icon,
            color: widget.color ?? defaultTextColor,
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}

class MarkedNeumorphicButtonWidget extends StatefulWidget {
  const MarkedNeumorphicButtonWidget({
    Key? key,
    this.title,
    this.difficultyLevelColor,
    this.isMarkedIcon = true,
  }) : super(key: key);

  final String? title;
  final Color? difficultyLevelColor;
  final bool isMarkedIcon;

  @override
  State<MarkedNeumorphicButtonWidget> createState() =>
      _MarkedNeumorphicButtonWidgetState();
}

class _MarkedNeumorphicButtonWidgetState
    extends State<MarkedNeumorphicButtonWidget> {
  bool isMarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: widget.isMarkedIcon
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
        color: widget.isMarkedIcon ? buttonBackgroundColor : canvasColor,
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 1,
        ),
        boxShadow: [
          if (widget.isMarkedIcon)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(1.5, 1.5),
              blurRadius: 2,
            ),
          if (!widget.isMarkedIcon)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(-1.5, 0),
              blurRadius: 2,
            ),
          if (!widget.isMarkedIcon)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 1.5),
              blurRadius: 2,
            ),
        ],
      ),
      child: NeumorphicButton(
        onPressed: () {
          if (widget.isMarkedIcon) {
            setState(() {
              isMarked = !isMarked;
            });
          }
        },
        padding: const EdgeInsets.all(13),
        style: NeumorphicStyle(
          color: widget.isMarkedIcon ? buttonBackgroundColor : canvasColor,
          lightSource:
              widget.isMarkedIcon ? LightSource.topLeft : LightSource.topRight,
          shape: widget.isMarkedIcon && isMarked
              ? NeumorphicShape.concave
              : NeumorphicShape.flat,
          intensity: 1,
          shadowDarkColor: buttonBackgroundColor,
          boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
          )),
        ),
        child: Row(
          children: [
            if (widget.isMarkedIcon == false) TextWidget(widget.title ?? ''),
            if (widget.isMarkedIcon == false) const Spacer(),
            widget.isMarkedIcon
                ? Icon(
                    Icons.done_all_outlined,
                    size: 30,
                    color: isMarked
                        ? markedDoneIconColor
                        : markedUndoneAndClickedIconColor,
                  )
                : DifficultyLevelWidget(color: widget.difficultyLevelColor),
          ],
        ),
      ),
    );
  }
}

class RedeemNeumorphicButtonWidget extends StatefulWidget {
  const RedeemNeumorphicButtonWidget({
    Key? key,
    this.isRedeemButton = true,
  }) : super(key: key);

  final bool isRedeemButton;

  @override
  State<RedeemNeumorphicButtonWidget> createState() =>
      _RedeemNeumorphicButtonWidgetState();
}

class _RedeemNeumorphicButtonWidgetState
    extends State<RedeemNeumorphicButtonWidget> {
  bool isRedeemed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: widget.isRedeemButton
            ? const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
        color: widget.isRedeemButton ? buttonBackgroundColor : canvasColor,
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 2,
        ),
        boxShadow: [
          if (widget.isRedeemButton)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 1.5),
              blurRadius: 2,
            ),
          if (!widget.isRedeemButton)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 1.5),
              blurRadius: 2,
            ),
        ],
      ),
      child: NeumorphicButton(
        onPressed: () {
          if (widget.isRedeemButton) {}
        },
        padding: const EdgeInsets.all(12),
        provideHapticFeedback: widget.isRedeemButton ? true : false,
        style: NeumorphicStyle(
          color: widget.isRedeemButton ? buttonBackgroundColor : canvasColor,
          lightSource: LightSource.topLeft,
          shape: NeumorphicShape.flat,
          intensity: 0.5,
          shadowDarkColor: buttonBackgroundColor,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
            bottomLeft:
                widget.isRedeemButton ? Radius.zero : const Radius.circular(12),
            topLeft:
                widget.isRedeemButton ? Radius.zero : const Radius.circular(12),
            topRight:
                widget.isRedeemButton ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                widget.isRedeemButton ? const Radius.circular(12) : Radius.zero,
          )),
        ),
        child: Row(
          children: [
            widget.isRedeemButton
                ? const Icon(
                    Icons.redeem_outlined,
                    size: 30,
                    color: rewardButtonColor,
                  )
                : const TextWidget('Hello'),
            if (widget.isRedeemButton) const Spacer(),
            if (widget.isRedeemButton)
              const TextWidget(
                '-10',
                color: rewardButtonColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
          ],
        ),
      ),
    );
  }
}

class NeumorphicCardWidget extends StatelessWidget {
  const NeumorphicCardWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.color,
    this.isNavCard = true,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color? color;
  final bool isNavCard;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        color: buttonBackgroundColor,
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1.5, 1.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: NeumorphicButton(
        onPressed: onPressed,
        style: NeumorphicStyle(
          color: buttonBackgroundColor,
          shape: NeumorphicShape.flat,
          intensity: 1,
          surfaceIntensity: 1,
          shadowDarkColor: buttonBackgroundColor,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        ),
        child: Center(
          child: Row(
            children: [
              Icon(
                icon,
                color: color ?? defaultTextColor,
              ),
              const SizedBox(width: 10),
              TextWidget(
                title,
                fontSize: 14,
                color: color ?? defaultTextColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
