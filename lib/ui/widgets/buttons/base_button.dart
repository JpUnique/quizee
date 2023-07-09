import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String? text;

  final Color? bgColor;
  final Function()? onPress;

  const BaseButton({
    Key? key,
    this.text,
    this.bgColor,
    this.onPress,
  }) : super(key: key);

  const BaseButton.outlined({
    Key? key,
    this.text,
    this.bgColor,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text ?? "Next",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}