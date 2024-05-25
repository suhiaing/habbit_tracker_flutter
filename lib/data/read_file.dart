import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<List<dynamic>> readFile() async {
  final file = File("data.json");
  final jsonString = await file.readAsString();

  try {
    final data = jsonDecode(jsonString) as List<dynamic>;
    return data;
  } catch (e) {
    return Future.error('Error reading file: $e');
  }
}

Future<int> readStar() async {
  final file = File("stars.txt");

  try {
    final data2 = await file.readAsString();
    final data = int.parse(data2);
    return data;
  } catch (e) {
    return Future.error('Error reading file: $e');
  }
}

Future<List<dynamic>> readDaily() async {
  final file = File("daily_data.json");
  final jsonString = await file.readAsString();

  try {
    final data = jsonDecode(jsonString) as List<dynamic>;
    return data;
  } catch (e) {
    return Future.error('Error reading file: $e');
  }
}
