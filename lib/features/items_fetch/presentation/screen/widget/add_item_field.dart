part of '../items_screen.dart';
class AddItemTextFormField extends StatelessWidget {
  const AddItemTextFormField({
    super.key,
    required this.textEditingController,
    required this.validator,
    required this.hintText,
    required this.iconData,
  });

  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final IconData iconData;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          )),
    );
  }
}
