class StoreHourDetails {
  final String open;
  final String close;
  final bool available;

  StoreHourDetails({
    required this.open,
    required this.close,
    required this.available,
  });

  factory StoreHourDetails.fromMap(Map<String, dynamic> map) {
    return StoreHourDetails(
      open: map['open'],
      close: map['close'],
      available: map['available'],
    );
  }
}
