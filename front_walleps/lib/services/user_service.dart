import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'dart:developer';
import '../models/device_scheduler.dart';

class UserService {
  final String baseUrl =
      "http://10.20.29.249:8000/user"; // Ajusta a la URL de tu API

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/all'));

    if (response.statusCode == 200) {
      List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<bool> updateUser(int userId, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$userId'));

    return response.statusCode == 200;
  }

  Future<List<DeviceSchedule>> getSchedulerByUserId(
      int userId, bool sections) async {
    final response =
        await http.get(Uri.parse('$baseUrl/scheduler/$userId/$sections'));

    if (response.statusCode == 200) {
      List<dynamic> scheduleJson = jsonDecode(response.body);
      return scheduleJson.map((json) => DeviceSchedule.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load schedule');
    }
  }
}
