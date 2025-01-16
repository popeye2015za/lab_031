import 'package:flutter/material.dart';
import 'resultpage.dart'; 
class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void calculateBMI() {
    final double? weight = double.tryParse(weightController.text); 
    final double? height = double.tryParse(heightController.text); 

    if (weight != null && height != null && height > 0) {
      final double bmi = weight / (height * height); 


      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(bmiValue: bmi),
        ),
      );
    } else {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ข้อผิดพลาด'),
          content: const Text('กรุณากรอกน้ำหนักและส่วนสูงให้ถูกต้อง'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ตกลง'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 184, 235),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'คำนวณค่า BMI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('น้ำหนัก  '),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('กิโลกรัม'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ส่วนสูง  '),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('เมตร'),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: calculateBMI, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'ยืนยัน',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
