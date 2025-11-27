import 'dart:async';

Stream<int> downloadGamePatch() async* {
  await Future.delayed(Duration(seconds: 1)); 
  yield 20; 

  await Future.delayed(Duration(seconds: 1)); 
  yield 50; 

  await Future.delayed(Duration(seconds: 1));
  yield 90; 

  await Future.delayed(Duration(seconds: 1));
  yield 100; 
}

void main() async {
  print('--- เริ่มดาวน์โหลด ---');

  await for (var percent in downloadGamePatch()) {
    print('ความคืบหน้า: $percent% ...'); 
  }

  print('--- ติดตั้งเสร็จสมบูรณ์ พร้อมเล่น! ---');
}