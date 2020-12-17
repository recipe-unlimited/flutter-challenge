import 'package:recipe_challenge/models/store_hour_details.dart';

class StoreHour {
  final DateTime date;
  final StoreHourDetails store;

  StoreHour({
    this.date,
    this.store,
  });

  factory StoreHour.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StoreHour(
      date: DateTime.parse(map['date']),
      store: StoreHourDetails.fromMap(map['store']),
    );
  }
}
