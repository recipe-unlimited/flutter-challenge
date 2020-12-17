class StoreHourDetails {
  final String open;
  final String close;
  final bool available;

  StoreHourDetails({
    this.open,
    this.close,
    this.available,
  });

  factory StoreHourDetails.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StoreHourDetails(
      open: map['open'],
      close: map['close'],
      available: map['available'],
    );
  }
}
