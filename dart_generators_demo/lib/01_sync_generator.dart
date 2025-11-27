List<String> grabAllTissues(int total) {
  var pileOfTissues = <String>[];
  
  for (int i = 1; i <= total; i++) {
    print('  [List] ดึงแผ่นที่ $i ออกมา... วางแปะไว้บนกอง');
    pileOfTissues.add('ทิชชู่แผ่นที่ $i');
  }
  
  print('  [List] ดึงหมดกล่องแล้ว!');
  return pileOfTissues;
}

Iterable<String> grabTissueBox(int total) sync* {
  
  for (int i = 1; i <= total; i++) {
    yield '$i'; 
    
    print('  [Box] ...คนใช้ดึงไปแล้ว (Resume) เตรียมดึงแผ่นต่อไป');
  }
}

void main() {
  print('--- 1. ทดสอบแบบ List (ดึงมากองไว้ก่อน) ---');
  var myPile = grabAllTissues(3); 
  for (var tissue in myPile) {
    print('User: หยิบ $tissue มาเช็ดหน้า');
  }

  print('\n--- 2. ทดสอบแบบ Generator (ดึงจากกล่องทีละแผ่น) ---');
  var myBox = grabTissueBox(3);
  
  for (var tissue in myBox) {
    print('User: ดึง $tissue \n');
  }
}