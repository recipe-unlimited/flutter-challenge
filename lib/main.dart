import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:recipe_challenge/blocs/restaurant_list_bloc.dart';
import 'package:recipe_challenge/constants.dart';
import 'package:recipe_challenge/core/bloc/bloc_provider.dart';
import 'package:recipe_challenge/pages/restaurant_page_list.dart';
import 'package:recipe_challenge/services/store_service.dart';

final locator = GetIt.instance;
void main() {
  registerDependencies();
  runApp(const MyApp());
}

void registerDependencies() {
  locator.registerSingleton<Client>(Client());
  locator.registerLazySingleton<StoreService>(() => StoreService(host: uatHostUrl, httpClient: locator.get<Client>()));
  locator.registerFactory<RestaurantListBloc>(() => RestaurantListBloc(storeService: locator.get<StoreService>()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: locator.get<RestaurantListBloc>(),
        child: const RestaurantListPage(),
      ),
    );
  }
}
