import 'package:flutter/material.dart';
import 'package:recipe_challenge/blocs/restaurant_list_bloc.dart';
import 'package:recipe_challenge/blocs/restaurant_list_state.dart';
import 'package:recipe_challenge/core/bloc/bloc.dart';
import 'package:recipe_challenge/core/bloc/bloc_provider.dart';
import 'package:recipe_challenge/models/store_model.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RestaurantListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Restaurants'),
        actions: const [
          IconButton(icon: Icon(Icons.location_on), onPressed: null),
        ],
      ),
      body: StreamBuilder<BlocState>(
        stream: bloc.state,
        initialData: bloc.currentState,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error!);
          }

          final state = snapshot.data;
          if (state is Initial) {
            bloc.fetchRestaurantList();
            return _buildLoadingStateWidget();
          } else if (state is Loaded) {
            return _buildLoadedStateWidget(state.restaurantList!);
          } else if (state is Loading) {
            return _buildLoadingStateWidget();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoadingStateWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoadedStateWidget(List<StoreModel> restaurantList) {
    return ListView.builder(
      itemCount: restaurantList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(restaurantList[index].storeName),
      ),
    );
  }

  Widget _buildErrorWidget(Object error) {
    return Center(
      child: Text(error.toString()),
    );
  }
}
