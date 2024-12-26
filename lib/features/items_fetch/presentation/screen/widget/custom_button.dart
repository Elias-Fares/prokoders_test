part of '../items_screen.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonTitle;
  final Function() onTap;
  const CustomButton(
      {super.key,
      required this.buttonColor,
      required this.buttonTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              buttonTitle,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
