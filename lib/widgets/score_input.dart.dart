import 'package:flutter/material.dart';

class ScoreInput extends StatefulWidget {
  final Function(String) onResult;

  ScoreInput({required this.onResult});

  @override
  _ScoreInputState createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  void _calculateCategory() {
    final input1 = _controller1.text;
    final input2 = _controller2.text;
    final input3 = _controller3.text;

    final score1 = int.tryParse(input1);
    final score2 = int.tryParse(input2);
    final score3 = int.tryParse(input3);

    if (score1 == null || score2 == null || score3 == null ||
        score1 < 0 || score1 > 100 || score2 < 0 || score2 > 100 || score3 < 0 || score3 > 100) {
      widget.onResult('Input tidak valid! Masukkan nilai antara 0 hingga 100 untuk semua input.');
    } else {
      final averageScore = (score1 + score2 + score3) / 3;

      String result;
      if (averageScore >= 85) {
        result = 'Kategori: A';
      } else if (averageScore >= 70) {
        result = 'Kategori: B';
      } else if (averageScore >= 55) {
        result = 'Kategori: C';
      } else {
        result = 'Kategori: D';
      }
      widget.onResult('Rata-rata: ${averageScore.toStringAsFixed(2)}\n$result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan Nilai 1 (0-100)',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _controller2,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan Nilai 2 (0-100)',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _controller3,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan Nilai 3 (0-100)',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _calculateCategory,
          child: Text('Hitung'),
        ),
      ],
    );
  }
}
