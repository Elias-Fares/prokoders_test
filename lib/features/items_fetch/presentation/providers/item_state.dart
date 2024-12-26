part of 'items_provider.dart';
class ItemsState {
  final ItemsModel? items;
  final bool isLoading;
  final String? error;
  ItemsState({required this.items, required this.isLoading, this.error});
  ItemsState copyWith({
    ItemsModel? items,
    bool? isLoading,
    String? error,
  }) {
    return ItemsState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}