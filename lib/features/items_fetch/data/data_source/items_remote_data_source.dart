import 'package:dio/dio.dart';
import 'package:prokoders_test/core/dio/base_dio.dart';
import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/features/items_fetch/domain/models/item_model.dart';

abstract class ItemsRemoteDataSource {
  Future<DataState> getItems();
}

class ItemsRemoteDataSourceImpl implements ItemsRemoteDataSource {
  late BaseDio baseDio;
  final Dio dio;

  ItemsRemoteDataSourceImpl({required this.dio}) {
    baseDio = BaseDio(dioProject: dio);
  }

  @override
  Future<DataState> getItems() async {
    final response =
        await baseDio.get<ItemsModel>(subUrl: "https://jsonplaceholder.typicode.com/posts", model: ItemsModel());
    return response;
  }
}
