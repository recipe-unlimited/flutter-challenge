import 'package:recipe_challenge/models/store_hour.dart';

class StoreModel {
  final int storeNumber;
  final String storeName;
  final double latitude;
  final double longitude;
  final double distance;
  final bool eCommOnly;
  final String streetNumber;
  final String street;
  final String city;
  final String province;
  final String postalCode;
  final String phoneNumber;
  final List<StoreHour> hours;

  StoreModel({
    this.storeNumber,
    this.storeName,
    this.latitude,
    this.longitude,
    this.distance,
    this.eCommOnly,
    this.streetNumber,
    this.street,
    this.city,
    this.province,
    this.postalCode,
    this.phoneNumber,
    this.hours,
  });

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StoreModel(
      storeNumber: map['storeNumber']?.toInt(),
      storeName: map['storeName']?.toString(),
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      distance: map['distance']?.toDouble(),
      eCommOnly: map['eCommOnly'] == "Y",
      streetNumber: map['streetNumber']?.toString(),
      street: map['street'],
      city: map['city'],
      province: map['province'],
      postalCode: map['postalCode'],
      phoneNumber: map['phoneNumber'],
      hours:
          List<StoreHour>.from(map['hours']?.map((x) => StoreHour.fromMap(x))),
    );
  }
}
