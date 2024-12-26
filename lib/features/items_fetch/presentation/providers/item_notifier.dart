part of 'items_provider.dart';

class ItemsNotifier extends StateNotifier<ItemsState> {
  final Ref ref;

  ItemsNotifier(this.ref)
      : super(ItemsState(items: null, isLoading: false, error: null)) {
    getItems();
  }

  Future<void> getItems() async {
    final getUseCase = ref.read(getItemsUseCaseProvider);
    state = state.copyWith(isLoading: true, error: "", items: null);
    final response = await getUseCase.call(NoParams());
    if (response is DataSuccess) {
      state = state.copyWith(items: response.data, isLoading: false, error: "");
    } else {
      state = state.copyWith(
          error: response.exceptionResponse?.exceptionMessages.firstOrNull ??
              "Error Occured",
          isLoading: false);
    }
  }

  void addItem({required String title, required String description}) {
    if (state.error?.isEmpty ?? true) {
      state = state.copyWith(
          items: state.items?.copyWith(items: [
        Item(id: 0, userId: 1, title: title, body: description),
        ...?state.items?.items,
      ]));
    }
  }
}
