import 'package:recipe_challenge/blocs/restaurant_list_state.dart';
import 'package:recipe_challenge/core/bloc/bloc.dart';
import 'package:recipe_challenge/services/store_service.dart';

class RestaurantListBloc extends Bloc<RestaurantListState> {
  final StoreService storeService;
  RestaurantListBloc({required this.storeService})
      : super(initialState: Initial());

  Future<void> fetchRestaurantList() async {
    emit(Loading());
    try {
      final storeList = await storeService.fetchStoreList();
      emit(Loaded(restaurantList: storeList));
    } catch (e, s) {
      error(LoadingError(e, s));
    }
  }
}
