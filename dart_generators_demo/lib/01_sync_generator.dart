// 1. แบบปกติ (List): พฤติกรรม "ดึงออกมากองรวมกันให้หมดก่อน"
// ข้อเสีย: ต้องใช้โต๊ะวางทิชชู่กองใหญ่ (เปลือง RAM) กว่าจะได้เช็ดหน้าแผ่นแรก
List<String> grabAllTissues(int total) {
  var pileOfTissues = <String>[];
  
  for (int i = 1; i <= total; i++) {
    print('  [List] ดึงแผ่นที่ $i ออกมา... วางแปะไว้บนกอง');
    pileOfTissues.add('ทิชชู่แผ่นที่ $i');
  }
  
  print('  [List] ดึงหมดกล่องแล้ว!');
  return pileOfTissues;
}

// 2. แบบ Generator (sync*): พฤติกรรม "ดึงทีละแผ่นเมื่อจะใช้"
// ข้อดี: ไม่ต้องมีที่วางของ ดึงคาไว้ที่ปากกล่อง (ประหยัด RAM)
Iterable<String> grabTissueBox(int total) sync* {
  
  for (int i = 1; i <= total; i++) {
    yield '$i'; // ส่งให้คนใช้ แล้วหยุดรอ (Pause)
    
    print('  [Box] ...คนใช้ดึงไปแล้ว (Resume) เตรียมดึงแผ่นต่อไป');
  }
}

void main() {
  print('--- 1. ทดสอบแบบ List (ดึงมากองไว้ก่อน) ---');
  // สังเกต: ดึงจนครบ 3 แผ่นก่อน ถึงจะได้เริ่มเช็ดหน้า
  var myPile = grabAllTissues(3); 
  for (var tissue in myPile) {
    print('User: หยิบ $tissue มาเช็ดหน้า');
  }

  print('\n--- 2. ทดสอบแบบ Generator (ดึงจากกล่องทีละแผ่น) ---');
  // สังเกต: ดึง -> เช็ด -> ดึง -> เช็ด (สลับกันทำงาน)
  var myBox = grabTissueBox(3);
  
  for (var tissue in myBox) {
    print('User: ดึง $tissue \n');
  }
}