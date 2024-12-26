import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prokoders_test/core/validator/fields_validator.dart';
import 'package:prokoders_test/features/items_fetch/domain/models/item_model.dart';
import 'package:prokoders_test/features/items_fetch/presentation/providers/items_provider.dart';
import 'package:prokoders_test/features/log_in/domain/model/user_model.dart';
import 'package:prokoders_test/features/log_in/presentation/screen/login_screen.dart';
part 'widget/change_state_widget.dart';
part 'widget/item_card.dart';
part 'widget/add_item_dialog.dart';
part 'widget/add_item_field.dart';
part 'widget/custom_button.dart';

class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var itemState = ref.watch(itemsProvider);

    Widget buildContent(ItemsModel? itemsModel) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: itemsModel?.items?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = itemsModel?.items?.elementAt(index);
                return ItemCart(
                    id: item?.id.toString() ?? "0",
                    title: item?.title ?? "",
                    description: item?.body ?? "");
              },
            )
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(itemsProvider.notifier).getItems();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fetch Items",
              style: TextStyle(color: Colors.black, fontSize: 22)),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15),
              child: InkWell(
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  UserManager userManager = UserManager();
                  userManager.clearUser();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
            // ref.read(itemsProvider.notifier).getItems();
            AddItemDialog.builder(context);
          },
        ),
        body: SafeArea(
          child: ChangeStateWidget(
            itemsState: itemState,
            onSuccessWidget: buildContent(itemState.items),
            onLoadingWidget: const Center(
              child: CircularProgressIndicator(),
            ),
            onErrorWidget: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                    height: 400,
                    child: Center(child: Text(itemState.error ?? "")))),
          ),
        ),
      ),
    );
  }
}
