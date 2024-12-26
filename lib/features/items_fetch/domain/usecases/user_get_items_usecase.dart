import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/core/use_case/use_case.dart';
import 'package:prokoders_test/features/items_fetch/data/repository/items_repository.dart';

class UserGetItemsUseCase implements UseCase<DataState, NoParams> {
  final ItemsRepository itemsRepository;

  UserGetItemsUseCase( {required this.itemsRepository});

  @override
  Future<DataState> call(NoParams noParams) async {
    final response = await itemsRepository.getItems();
    return response;
  }
}
class NoParams {

}
