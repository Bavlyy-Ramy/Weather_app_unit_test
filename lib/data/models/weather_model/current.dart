import 'condition.dart';

class Current {
  String? lastUpdated;
  double? tempC;
  int? isDay;
  Condition? condition;
  int? humidity;
  int? cloud;

  Current({
    this.lastUpdated,
    this.tempC,
    this.isDay,
    this.condition,
    this.humidity,
    this.cloud,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdated: json['last_updated'] as String?,
    tempC: (json['temp_c'] as num?)?.toDouble(),
    isDay: json['is_day'] as int?,
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    humidity: json['humidity'] as int?,
    cloud: json['cloud'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'last_updated': lastUpdated,
    'temp_c': tempC,
    'is_day': isDay,
    'condition': condition?.toJson(),
    'humidity': humidity,
    'cloud': cloud,
  };
}
