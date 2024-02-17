class Device {
  final int? id;
  final String device_name;
  final int times_week;
  final String daytime;
  final int duration;

  Device({
    this.id,
    required this.device_name,
    required this.times_week,
    required this.daytime,
    required this.duration,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as int?, // Usar el operador as para manejar nulls
      device_name: json['device_name'] as String,
      times_week: json['times_week'] as int,
      daytime: json['daytime'] as String,
      duration: json['duration'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'device_name': device_name,
      'times_week': times_week,
      'daytime': daytime,
      'duration': duration,
    };
  }
}
