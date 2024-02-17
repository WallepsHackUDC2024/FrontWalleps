class DeviceSchedule {
  final String device;
  final int time;
  final int timesWeek;
  final double current_spent;
  final double expected_spent;

  DeviceSchedule({
    required this.device,
    required this.time,
    required this.timesWeek,
    required this.current_spent,
    required this.expected_spent,
  });

  factory DeviceSchedule.fromJson(Map<String, dynamic> json) {
    return DeviceSchedule(
      device: json['device'],
      time: json['time'],
      timesWeek: json['times_week'],
      current_spent: json['current_spent'],
      expected_spent: json['expected_spent'],
    );
  }
}
