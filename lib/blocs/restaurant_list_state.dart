import 'package:flutter/foundation.dart';
import 'package:recipe_challenge/core/bloc/bloc.dart';
import 'package:recipe_challenge/models/store_model.dart';

class RestaurantListState extends BlocState {
  final List<StoreModel> restaurantList;

  RestaurantListState({this.restaurantList});
}

class Initial extends RestaurantListState {}

class Loading extends RestaurantListState {}

class Loaded extends RestaurantListState {
  Loaded({@required List<StoreModel> restaurantList})
      : super(restaurantList: restaurantList);
}

class LoadingError extends Failure {
  LoadingError(String message) : super(message);
}
