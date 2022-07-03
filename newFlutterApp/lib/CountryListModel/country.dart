class Country {
  String countryId;
  String countryName;

  Country({required this.countryId, required this.countryName});

  Map<String, dynamic> toJson() => {
        "countryList": countryId,
        "name": countryName,
      };

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryId: json["countryId"],
      countryName: json["countryName"],
    );
  }
}