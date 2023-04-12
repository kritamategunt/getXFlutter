import 'dart:convert';

import 'package:get/get.dart';
import 'package:to_do_list/app/core/utils/keys.dart';
import 'package:to_do_list/app/data/models/task.dart';
import 'package:to_do_list/app/data/services/storage/services.dart';

class TaskProvider {
  StorageService _storage = Get.find<StorageService>();

//read task from localStorage then pass as a key by using jsonDecode then map individual by forEach
  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));

    return tasks;
  }

//To convert task<Object> to Json
  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(Task));
  }
}
