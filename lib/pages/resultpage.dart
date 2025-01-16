import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double bmiValue; // รับค่า BMI ที่คำนวณมา

  const ResultPage({super.key, required this.bmiValue});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "น้ำหนักต่ำกว่าเกณฑ์";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "น้ำหนักปกติ";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "น้ำหนักเกิน";
    } else if (bmi >= 30 && bmi <= 34.9) {
      return "โรคอ้วนระดับ 1";
    } else if (bmi >= 35 && bmi <= 39.9) {
      return "โรคอ้วนระดับ 2";
    } else {
      return "โรคอ้วนระดับรุนแรง";
    }
  }

  @override
  Widget build(BuildContext context) {
    String category = getBMICategory(widget.bmiValue);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 184, 235), // ตั้งค่าพื้นหลังหน้าเป็นสีฟ้าอ่อน
      appBar: AppBar(
        title: const Text('ผลการคำนวณค่า BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,  // จัดชิดบน
          crossAxisAlignment: CrossAxisAlignment.center,  // จัดกลางในแนวนอน
          children: [
            const Text(
              'ผลการคำนวณค่า BMI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'BMI = ${widget.bmiValue.toStringAsFixed(2)}', // แสดงค่า BMI
              style: const TextStyle(fontSize: 24, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Text(
              category, // แสดงผลการแปลผล
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'เกณฑ์การแปลผล BMI',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'น้อยกว่า 18.5 : น้ำหนักต่ำกว่าเกณฑ์\n'
              '18.5 - 24.9 : น้ำหนักปกติ\n'
              '25.0 - 29.9 : น้ำหนักเกิน\n'
              '30.0 - 34.9 : โรคอ้วนระดับ 1\n'
              '35.0 - 39.9 : โรคอ้วนระดับ 2\n'
              '40 ขึ้นไป : โรคอ้วนระดับรุนแรง',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // กลับไปหน้าแรก
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'คำนวณใหม่',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
