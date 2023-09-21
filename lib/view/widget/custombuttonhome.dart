import 'package:flutter/material.dart';

class CustomButtonHome extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color colr;
  const CustomButtonHome(
      {super.key, required this.title, this.onPressed, required this.colr});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            //side: BorderSide(width: 1)
          ),
          color: colr,
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
