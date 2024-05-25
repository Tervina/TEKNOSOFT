import 'package:bmi_calculator/bmi_result.dart';
import 'package:bmi_calculator/home.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  BMI bmi;

  Result(this.bmi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF090c22),
        appBar: AppBar(
          elevation: 20,
          centerTitle: true,
          backgroundColor: const Color(0xFF090c22),
          title: const Text(
            "BMI CALCULATOR",
            textAlign: TextAlign.center,
          ),
          leading: const Icon(Icons.sort),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Your Result ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFF1d1f33)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmi.type(),
                        style:
                            const TextStyle(color: Colors.green, fontSize: 50),
                      ),
                      Text(
                        bmi.getResult().toStringAsFixed(2),
                        style: style,
                      ),
                      Text(
                        bmi.advice(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffEB1555)),
                child: const Center(
                  child: Text(
                    "CALCULATE YOUR BMI",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
