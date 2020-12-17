import 'package:http/http.dart';
import 'package:recipe_challenge/services/store_service.dart';
import 'package:test/test.dart';

void main() {
  group('StoreService Tests', () {
    test('getStoreList', () async {
      final storeService = StoreService(
        host: 'https://uatiosapi.swisschalet.com/CaraAPI/APIService/',
        httpClient: Client(),
      );

      final result = await storeService.fetchStoreList();
      print(result);
      expect(result, isNotNull);
    });
  });
}
