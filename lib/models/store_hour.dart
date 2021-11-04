import 'package:recipe_challenge/models/store_hour_details.dart';

class StoreHour {
  final DateTime date;
  final StoreHourDetails? store;

  StoreHour({
    required this.date,
    this.store,
  });

  factory StoreHour.fromMap(Map<String, dynamic> map) {
    return StoreHour(
      date: DateTime.parse(map['date']),
      store:
          map['store'] != null ? StoreHourDetails.fromMap(map['store']) : null,
    );
  }
}
