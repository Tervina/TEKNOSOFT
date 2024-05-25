import 'dart:convert';
import 'dart:ui';

import 'package:bmi_calculator/bmi_result.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const style =
    TextStyle(fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold);

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double height = 100;
  double weight = 50;
  double age = 20;
  Color inactiveCardColor = const Color(0xFF262c51);
  Color activeCardColor = const Color(0xFF1D1E33);
  Color currentCardColor = const Color(0xFF262c51);
  void toggleCardColor() {
    setState(() {
      currentCardColor = currentCardColor == inactiveCardColor
          ? activeCardColor
          : inactiveCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090c22),
      appBar: AppBar(
        centerTitle: true,
        elevation: 20,
        backgroundColor: const Color(0xFF090c22),
        title: const Text(
          "BMI CALCULATOR",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.sort),
      ),
      body: Container(
        child: Column(children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: currentCardColor,
                        //const Color(0xFF262c51),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF8C90AA)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentCardColor
                          //const Color(0xFF262c51),
                          ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF8C90AA)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF262c51),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(color: Color(0xFF8C90AA), fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " Cm",
                        style:
                            TextStyle(color: Color(0xFF8C90AA), fontSize: 20),
                      ),
                    ],
                  ),
                  //SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xffEB1555),
                          overlayColor:
                              const Color(0xffEB1555).withOpacity(0.2),
                          inactiveTrackColor: const Color(0xff888993),
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 2,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 13),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 25)),
                      child: Slider(
                        value: height,
                        //activeColor: Colors.white,
                        max: 200,
                        min: 50,
                        onChanged: (double value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xFF262c51),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(color: Colors.white),
                        ),
                        //SizedBox(height: 10,),
                        Text(
                          weight.toString(),
                          style: style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2f3656)),

                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },

                              //backgroundColor: const Color(0xFF2f3656),

                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2f3656)),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xFF262c51),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(color: Colors.white),
                        ),
                        //SizedBox(height: 10,),
                        Text(
                          "$age",
                          style: style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2f3656)),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2f3656)),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMI bmi_class = BMI(weight, height);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Result(bmi_class)));
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
        ]),
      ),
    );
  }
}
