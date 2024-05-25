import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> writeData(List<dynamic> content) async {
  try {
    final file = File("data.json");

    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    final jsonString = jsonEncode(content);
    await file.writeAsString(jsonString);
  } on FileSystemException catch (e) {
    return Future.error('Error writing file: $e');
  }
}

Future<void> writeDailyData(List<dynamic> content) async {
  try {
    final file = File("daily_data.json");

    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    final jsonString = jsonEncode(content);
    await file.writeAsString(jsonString);
  } on FileSystemException catch (e) {
    return Future.error('Error writing file: $e');
  }
}

Future<void> wirteStar(int amount) async {
  try {
    final file = File("stars.txt");

    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    await file.writeAsString(amount.toString());
  } on FileSystemException catch (e) {
    return Future.error('Error writing file: $e');
  }
}
