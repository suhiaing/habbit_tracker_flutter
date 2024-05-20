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

Future<int> readAmount() async {
  final file = File("data_amount.txt");

  try {
    final data2 = await file.readAsString();
    final data = int.parse(data2);
    print("readAmount: $data");
    return data;
  } catch (e) {
    return Future.error('Error reading file: $e');
  }
}
