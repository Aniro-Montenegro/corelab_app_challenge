import 'package:flutter/material.dart';

class ShowSucess {
  void showSuccessDialog(BuildContext context, String message, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return AlertDialog(
          title: Text(title),
          content: Text(message),
        );
      },
    );
  }
}
