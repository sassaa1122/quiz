import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> questions = [
    'เมืองหลวงขอประเทศไทยคืออะไร',
    'เจ้าของ facebook คือใคร',
    'บิดาแห่งวิชาวิทยาศาสตร์คือใคร',
    'บิดาแห่งคณิตศาสตร์คือใคร',
    'บิดาแห่งภูมิศาสตร์คือใคร',
    'อาหารประจําชาติไทยคืออะไร',
    'อาหารประจําชาติอิตาลีคืออะไร',
    'ผลลัพธ์ไดมีค่ามากที่สุด',
    'สกุลเงินไทยคืออะไร',
    'สกุลเงินญี่ปุ่นคืออะไร',
  ];

  List<List<String>> options = [
    ['กรุงเทพมหานคร', 'เชียงใหม่', 'พัทยา', 'พัทลุง'],
    ['อัลเบิร์ต ไอน์สไตน์', 'มาร์ก ซักเคอร์เบิร์ก', 'เอราทอสเทนีส', 'คาร์ล ฟรีดริช เกาส์'],
    ['คาร์ล ฟรีดริช เกาส์', 'มาร์ก ซักเคอร์เบิร์ก', 'อัลเบิร์ต ไอน์สไตน์', 'เอราทอสเทนีส'],
    ['มาร์ก ซักเคอร์เบิร์ก', 'คาร์ล ฟรีดริช เกาส์', 'อัลเบิร์ต ไอน์สไตน์', 'เอราทอสเทนีส'],
    ['มาร์ก ซักเคอร์เบิร์ก', 'เอราทอสเทนีส', 'คาร์ล ฟรีดริช เกาส์', 'อัลเบิร์ต ไอน์สไตน์'],
    ['พิซซ่า', 'มัสมั่น', 'ต้มยำกุ้ง', 'ซูชิ'],
    ['พิซซ่า', 'มัสมั่น', 'ต้มยำกุ้ง', 'ซูชิ'],
    ['100*100', '100^2', '100*50', '1000/10'],
    ['หยวน', 'ดอลลาร์', 'บาท', 'เยน'],
    ['ดอลลาร์', 'บาท', 'เยน', 'หยวน'],
  ];

  List<int> answers = [
    0, // กรุงเทพมหานคร
    1, // มาร์ก ซักเคอร์เบิร์ก
    3, // อัลเบิร์ต ไอน์สไตน์
    1, // คาร์ล ฟรีดริช เกาส์
    1, // เอราทอสเทนีส
    2, // ต้มยำกุ้ง
    0, // พิซซ่า
    1, // 100^2
    2, // บาท
    2, // เยน
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(int selectedOptionIndex) {
    if (selectedOptionIndex == answers[currentQuestionIndex]) {
      setState(() {
        score++;
      });
    }
    moveToNextQuestion();
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Finished'),
            content: Text('Your Score: $score out of ${questions.length}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  restartQuiz();
                },
                child: Text('Restart'),
              ),
            ],
          );
        },
      );
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              questions[currentQuestionIndex],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Column(
              children: List.generate(
                4,
                (index) => ElevatedButton(
                  onPressed: () => checkAnswer(index),
                  child: Text(options[currentQuestionIndex][index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
