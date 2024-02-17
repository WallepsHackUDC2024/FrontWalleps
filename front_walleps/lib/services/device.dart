import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/device.dart';

class DeviceService {
  final String baseUrl = 'http:localhost:8000'; // Cambia esto por la URL de tu API

  Future<List<Device>> fetchDevices() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> devicesJson = json.decode(response.body);
      return devicesJson.map((json) => Device.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load devices');
    }
  }

  Future<Device> fetchDeviceById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Device.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load device');
    }
  }

  Future<Device> createDevice(Device device) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: device.toJson(),
    );

    if (response.statusCode == 201) {
      return Device.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create device');
    }
  }

  Future<Device> updateDevice(int id, Device device) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: device.toJson(),
    );

    if (response.statusCode == 200) {
      return Device.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update device');
    }
  }

  Future<void> deleteDevice(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete device');
    }
  }
}
