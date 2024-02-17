class DeviceSchedule {
  final String device;
  final int time;
  final int timesWeek;

  DeviceSchedule({
    required this.device,
    required this.time,
    required this.timesWeek,
  });

  factory DeviceSchedule.fromJson(Map<String, dynamic> json) {
    return DeviceSchedule(
      device: json['device'],
      time: json['time'],
      timesWeek: json['times_week'],
    );
  }
}
