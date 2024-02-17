class Device {
  final int id;
  final String device_name;
  final int times_week;
  final int daytime;
  final int duration;
  final String brand;
  final String model;
  final String efficiency;

  Device({
    required this.id,
    required this.device_name,
    required this.times_week,
    required this.daytime,
    required this.duration,
    required this.brand,
    required this.model,
    required this.efficiency,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as int, // Usar el operador as para manejar nulls
      device_name: json['device_name'] as String,
      times_week: json['times_week'] as int,
      daytime: json['daytime'] as int,
      duration: json['duration'] as int,
      brand: json['brand'] as String,
      model: json['model'] as String,
      efficiency: json['efficiency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'device_name': device_name,
      'times_week': times_week,
      'daytime': daytime,
      'duration': duration,
      'brand': brand,
      'model': model,
      'efficiency': efficiency,
    };
  }
}
