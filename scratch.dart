import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String returnData = await task2();
  task3(returnData);
}

String task1 () {
  print('Task 1 complete');
  return 'Task 1';
}

Future<String> task2() async {
  String result;
  await Future.delayed(Duration(seconds: 3), () {
    print('Task 2 complete');
    result = 'Task 2 data';
  });
  return result;
}

void task3 (String task2) {
  print('Task 3 complete with $task2');
}
