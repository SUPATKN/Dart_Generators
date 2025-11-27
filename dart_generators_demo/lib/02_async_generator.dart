import 'dart:async';

// จำลองการโหลดไฟล์ (Download) ที่มีการแจ้งเตือนเป็นระยะ
Stream<int> downloadGamePatch() async* {
  // ช่วงที่ 1: เริ่มโหลด
  await Future.delayed(Duration(seconds: 1)); // สมมติว่ารอเน็ต 1 วิ
  yield 20; // ส่งค่า 20% ไปบอกหน้าจอ (คนใช้เห็นว่าขยับแล้ว!)

  // ช่วงที่ 2: โหลดต่อ
  await Future.delayed(Duration(seconds: 1)); 
  yield 50; // ส่งค่า 50%

  // ช่วงที่ 3: ใกล้เสร็จ
  await Future.delayed(Duration(seconds: 1));
  yield 90; // ส่งค่า 90%

  // ช่วงสุดท้าย: เสร็จสมบูรณ์
  await Future.delayed(Duration(seconds: 1));
  yield 100; // ส่งค่า 100%
}

void main() async {
  print('--- เริ่มดาวน์โหลด ---');

  // ใช้ await for เพื่อรอรับค่าที่ค่อยๆ ไหลมา
  await for (var percent in downloadGamePatch()) {
    // ตรงนี้คือจุดที่เราเอาไปอัปเดต UI (เช่น Text หรือ LinearProgressIndicator)
    print('ความคืบหน้า: $percent% ...'); 
  }

  print('--- ติดตั้งเสร็จสมบูรณ์ พร้อมเล่น! ---');
}