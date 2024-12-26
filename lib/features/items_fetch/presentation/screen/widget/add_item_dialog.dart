part of '../items_screen.dart';

class AddItemDialog extends ConsumerStatefulWidget {
  static builder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AddItemDialog();
        });
  }

  const AddItemDialog({
    super.key,
  });

  @override
  ConsumerState<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends ConsumerState<AddItemDialog> {
  final TextEditingController titleTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            insetPadding: const EdgeInsets.symmetric(horizontal: 25),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add new item",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AddItemTextFormField(
                        textEditingController: titleTextEditingController,
                        validator: (value) {
                          return FieldsValidator.validateEmpty(
                              value: value ?? "");
                        },
                        hintText: "Enter item title",
                        iconData: Icons.title_outlined),
                    const SizedBox(
                      height: 25,
                    ),
                    AddItemTextFormField(
                        textEditingController: descriptionTextEditingController,
                        validator: (value) {
                          return FieldsValidator.validateEmpty(
                              value: value ?? "");
                        },
                        hintText: "Enter item description",
                        iconData: Icons.description_outlined),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonColor: Colors.grey,
                            buttonTitle: "Cancel",
                            onTap: () {
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            buttonColor: Theme.of(context).primaryColor,
                            buttonTitle: "Add",
                            onTap: () {
                              if (!(_formKey.currentState?.validate() ??
                                  false)) {
                                return;
                              }
                              ref.read(itemsProvider.notifier).addItem(
                                  title: titleTextEditingController.text,
                                  description:
                                      descriptionTextEditingController.text);
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
