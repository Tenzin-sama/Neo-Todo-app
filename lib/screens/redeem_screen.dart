import 'package:flutter/material.dart';
import 'package:neo_todo/constants/colors.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/custom_app_bar.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({Key? key}) : super(key: key);

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  int selectedIndex = 0;
  // bool isSelected =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      extendBody: true,
      appBar: const CustomAppBar(
        firstTitle: 'Redeem',
        subtitle: '24 coins collected',
        trailingIcon: Icons.settings,
        textColor: redeemColor,
      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: const <Widget>[
                  Expanded(
                      child: RedeemNeumorphicButtonWidget(
                    isRedeemButton: false,
                  )),
                  RedeemNeumorphicButtonWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
