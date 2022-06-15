import 'package:flutter/material.dart';
import 'package:neo_todo/constants/colors.dart';
import 'package:neo_todo/widgets/button_widget.dart';
import 'package:neo_todo/widgets/custom_app_bar.dart';

class RewardSettingsScreen extends StatefulWidget {
  const RewardSettingsScreen({Key? key}) : super(key: key);

  @override
  State<RewardSettingsScreen> createState() => _RewardSettingsScreenState();
}

class _RewardSettingsScreenState extends State<RewardSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      extendBody: true,
      appBar: const CustomAppBar(
        isOneLinedTitle: false,
        firstTitle: 'Redeem',
        secondTitle: 'Settings',
        subtitle: 'Adjust rewards',
        trailingIcon: Icons.arrow_forward_ios_outlined,
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
