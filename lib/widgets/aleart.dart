import 'package:flutter/cupertino.dart';

showMyAlert({required BuildContext context, String? title, String? content, List<dynamic>? actions}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          CupertinoDialogAction(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Color(0xFF0079FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
