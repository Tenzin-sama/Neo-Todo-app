import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_todo/constants/colors.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/text_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.firstTitle,
    this.secondTitle,
    this.isOneLinedTitle = true,
    this.subtitle,
    required this.trailingIcon,
    this.textColor,
  }) : super(key: key);

  final String firstTitle;
  final String? secondTitle;
  final bool isOneLinedTitle;
  final String? subtitle;
  final IconData trailingIcon;
  final Color? textColor;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: 1,
      toolbarHeight: 90,
      backgroundColor: buttonBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                widget.firstTitle,
                fontSize: widget.isOneLinedTitle ? 36 : 14,
                fontWeight: widget.isOneLinedTitle
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor,
              ),
              if (widget.isOneLinedTitle == false)
                TextWidget(
                  widget.secondTitle ?? '',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              TextWidget(
                widget.subtitle!,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: widget.textColor,
              ),
            ],
          ),
          const Spacer(),
          // CustomNeumorphicButton(icon: widget.trailingIcon, color: todoColor),
          NeumorphicButtonWidget(
              icon: widget.trailingIcon, color: widget.textColor),
        ],
      ),
    );
  }
}
