import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/features/items_fetch/data/data_source/items_remote_data_source.dart';
import 'package:prokoders_test/features/items_fetch/data/repository/items_repository.dart';
import 'package:prokoders_test/features/items_fetch/domain/models/item_model.dart';
import 'package:prokoders_test/features/items_fetch/domain/usecases/user_get_items_usecase.dart';
part 'item_state.dart';
part 'item_notifier.dart';

final itemsRemoteDataSourceProvider = Provider<ItemsRemoteDataSource>(
  (ref) {
    final dioObject =
        Dio();
    return ItemsRemoteDataSourceImpl(dio: dioObject);
  },
);

final itemsRepositoryProvider = Provider<ItemsRepository>((ref) {
  final itemsRemoteDataSource = ref.read(itemsRemoteDataSourceProvider);
  return ItemsRepository(itemsRemoteDataSource: itemsRemoteDataSource);
});

final getItemsUseCaseProvider = Provider<UserGetItemsUseCase>((ref) {
  final itemsRepository = ref.read(itemsRepositoryProvider);
  return UserGetItemsUseCase(itemsRepository: itemsRepository);
});

final itemsProvider = StateNotifierProvider<ItemsNotifier, ItemsState>((ref) {
  return ItemsNotifier(ref);
});
