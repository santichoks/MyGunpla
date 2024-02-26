import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, required this.label, required this.icon, required this.color});

  final String label;
  final Color color;
  final IconData icon;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focus = FocusNode();
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();

    _focus.addListener(_onFocus);
  }

  void _onFocus() {
    setState(() {
      _isFocus = _focus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: _isFocus
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(4, 4),
                ),
              ]
            : null,
      ),
      child: TextField(
        cursorHeight: 18,
        focusNode: _focus,
        style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
        ),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          prefixIconColor: _isFocus ? widget.color : Colors.grey,
          labelText: widget.label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(bottom: 16, right: 20),
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
