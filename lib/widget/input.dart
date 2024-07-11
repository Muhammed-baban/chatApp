import 'package:flutter/material.dart';
import 'package:chat/utils/theme.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final bool isPassword;
  final String? title;
  final double? width;
  final double? height;
  final bool useHintAsPlaceholder;
  final bool isNumeric;
  final int? maxLength;
  final bool isCentered;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final Function(String)? onChanged;
  final bool search;

  const CustomInput({
    Key? key,
    this.hintText,
    this.title,
    this.isPassword = false,
    this.width = 90,
    this.height = 40,
    this.useHintAsPlaceholder = true,
    this.isNumeric = false,
    this.maxLength,
    this.isCentered = false,
    this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
    this.onChanged,
    this.search = false,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.length == widget.maxLength) {
        widget.nextFocusNode?.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: const TextStyle(
              color: primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width * widget.width! / 100,
          height: widget.height,
          child: TextField(
            controller: _controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType:
                widget.isNumeric ? TextInputType.number : TextInputType.text,
            textAlign: widget.isCentered ? TextAlign.center : TextAlign.start,
            maxLength: widget.maxLength,
            style: TextStyle(fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              filled: true,
              fillColor: white,
              hintText: widget.useHintAsPlaceholder ? widget.hintText : null,
              hintStyle: const TextStyle(color: fontPlaceholder),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              counterText: '',
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: fontPlaceholder,
                      ),
                      onPressed: _toggleObscureText,
                    )
                  : null,
              prefixIcon: widget.search
                  ? const Icon(
                      Icons.search,
                      color: fontPlaceholder,
                    )
                  : null,
            ),
            focusNode: widget.focusNode,
            onChanged: (text) {
              if (_controller.text.isEmpty) {
                widget.previousFocusNode?.requestFocus();
              }
              if (widget.onChanged != null) {
                widget.onChanged!(text);
              }
            },
            onSubmitted: (_) {
              widget.nextFocusNode?.requestFocus();
            },
          ),
        ),
        Divider(
          color: fontPlaceholder,
          thickness: 1,
        ),
      ],
    );
  }
}
