import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/features/items_fetch/data/data_source/items_remote_data_source.dart';

class ItemsRepository {
  final ItemsRemoteDataSource itemsRemoteDataSource;

  ItemsRepository({required this.itemsRemoteDataSource});
    Future<DataState> getItems() async{
    return await itemsRemoteDataSource.getItems();
  }
}
