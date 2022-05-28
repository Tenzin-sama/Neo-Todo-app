import 'package:flutter/material.dart';

navigateTo({required context, required screen, state}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => screen),
  );
}

navigateAndRestore({context, screen, onBack}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => screen))
      .then((val) {});
}

//Replace previous screen from stack and set new screen as the previous stack
navigateToReplace({required context, required screen}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => screen));
}

//Remove all previous stack and set new screen as the first screen
navigateAndRemoveUntil({required context, required screen}) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false);
}

//go back
navigateBack({required context}) {
  Navigator.pop(context);
}
