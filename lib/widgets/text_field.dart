import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.label,
    this.color = Colors.black,
    required this.icon,
    this.obscureText = false,
    this.isTouch = false,
    required this.onChange,
  });

  final String label;
  final Color color;
  final IconData icon;
  final bool obscureText;
  final bool isTouch;
  final void Function(String value) onChange;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final _focus = FocusNode();
  final _controller = TextEditingController();
  bool _isFocus = false;
  bool _isTouch = false;

  @override
  void initState() {
    super.initState();

    _focus.addListener(_onFocus);
    _controller.addListener(_onChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocus() {
    setState(() {
      _isFocus = _focus.hasFocus;
    });

    if (!_focus.hasFocus) {
      setState(() {
        _isTouch = true;
      });
    }
  }

  void _onChange() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
            controller: _controller,
            obscureText: widget.obscureText ? true : false,
            enableSuggestions: widget.obscureText ? false : true,
            autocorrect: widget.obscureText ? false : true,
            onChanged: widget.onChange,
            cursorHeight: 18,
            focusNode: _focus,
            style: TextStyle(
              color: _isFocus ? widget.color : Colors.black,
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
        ),
        SizedBox(
          height: 28,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: (_isTouch || widget.isTouch) && _controller.text.isEmpty
                ? Text(
                    "The ${widget.label.toLowerCase()} is required.",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
