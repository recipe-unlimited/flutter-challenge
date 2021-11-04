import 'dart:convert';

import 'package:http/http.dart';
import 'package:recipe_challenge/models/coordinates.dart';
import 'package:recipe_challenge/models/store_model.dart';

const defaultFromCoordinates = "60,-150";
const defaultToCoordinates = "39,-50";
const getStoreListPath = '/getStoreList';
const getStoreDetailsPath = '/getStoreDetails';

class StoreService {
  final Client httpClient;
  final String host;

  StoreService({required this.httpClient, required this.host});

  Future<List<StoreModel>> fetchStoreList({Coordinates? coordinates}) async {
    var fromCoordinates = defaultFromCoordinates;
    var toCoordinates = defaultToCoordinates;

    if (coordinates != null) {
      fromCoordinates =
          '${coordinates.latitude - 1.0}, ${coordinates.latitude + 1.0}';
      toCoordinates =
          '${coordinates.longitude - 1.0}, ${coordinates.longitude + 1.0}';
    }

    final result = await httpClient.get(Uri.parse(host +
        getStoreListPath +
        '?from=$fromCoordinates&to=$toCoordinates&includeHours=w&lang=EN'));

    if (result.statusCode != 200) {
      throw result.reasonPhrase ?? result.statusCode.toString();
    }

    final map = jsonDecode(result.body);

    if (map['response']['responseHeader']['result'] != 'Success') {
      throw map['response']['responseHeader']['result'];
    }

    if (map['response']['responseContent']['businessStatusModel']['status'] !=
        'SUCCESS') {
      throw map['response']['responseContent']['businessStatusModel']
              ['status'] +
          ' : ' +
          map['response']['responseContent']['businessStatusModel']
              ['screenMsg'];
    }

    final storeList = map['response']['responseContent']['storeModel'] as List;
    return storeList.map((e) => StoreModel.fromMap(e)).toList();
  }
}
