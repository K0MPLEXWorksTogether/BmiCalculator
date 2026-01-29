import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi/components/info_card.dart';
import 'package:bmi/components/gender_card.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/models/calculator.dart';

import 'package:bmi/pages/results_page.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders? gender;
  double height = 180.0;
  int weight = 60;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF0A0E21),
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 5.0,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InfoCard(
                    gender == Genders.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    GenderCard(FontAwesomeIcons.mars, "MALE"),
                    () {
                      setState(() {
                        gender = Genders.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    gender == Genders.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    GenderCard(FontAwesomeIcons.venus, 'FEMALE'),
                    () {
                      setState(() {
                        gender = Genders.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InfoCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toInt().toString(), style: kNumberTextStyle),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 16.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 220.0,
                      value: height,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      },
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InfoCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                backgroundColor: Color(0xFF4C4F5E),
                                foregroundColor: kBottomContainerColor,
                              ),
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                backgroundColor: Color(0xFF4C4F5E),
                                foregroundColor: kBottomContainerColor,
                              ),
                              child: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                backgroundColor: Color(0xFF4C4F5E),
                                foregroundColor: kBottomContainerColor,
                              ),
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                backgroundColor: Color(0xFF4C4F5E),
                                foregroundColor: kBottomContainerColor,
                              ),
                              child: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator bmiCalc = Calculator(
                height: height.toInt(),
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: bmiCalc.calculateBMI(),
                    resultText: bmiCalc.getResult(),
                    interpretation: bmiCalc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width,
              height: kBottomContainerHeight,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text('CALCULATE', style: kLargeButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
