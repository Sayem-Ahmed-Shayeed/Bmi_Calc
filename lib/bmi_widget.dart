import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';

enum InchOrCm { inch, cm }

enum KgOrLbs { kg, lbs }

class BmiWidget extends StatefulWidget {
  BmiWidget({super.key, required this.switchPage});

  void Function(String recommendation, String status, double bmi) switchPage;

  @override
  State<StatefulWidget> createState() {
    return _BmiWidget();
  }
}

class _BmiWidget extends State<BmiWidget> {
  final ageController = TextEditingController();
  final feetController = TextEditingController();
  final inchController = TextEditingController();
  final weightController = TextEditingController();

  double? age = 0;
  double? feetVar = 0;
  double? inchVar = 0;
  double? weight = 0;

  var inch = InchOrCm.cm;
  var kg = KgOrLbs.kg;
  double bmi = 0;

  @override
  void dispose() {
    feetController.dispose();
    inchController.dispose();
    ageController.dispose();
    weightController.dispose();
    super.dispose();
  }

  String status = "Undefined";

  dynamic defineStatus() {
    if (bmi < 16) {
      status = 'Severe Thinness';
    } else if (bmi >= 16 && bmi < 17) {
      status = 'Moderate Thinness';
    } else if (bmi >= 17 && bmi < 18.5) {
      status = 'Mild Thinness';
    } else if (bmi >= 18.5 && bmi < 25) {
      status = 'Ideal';
    } else if (bmi >= 25 && bmi < 30) {
      status = 'Overweight';
    } else if (bmi >= 30 && bmi < 35) {
      status = 'First Stage of Obesity';
    } else if (bmi >= 35 && bmi < 40) {
      status = 'Second Stage of Obesity';
    } else if (bmi >= 40) {
      status = 'Severely Obesity';
    }
  }

  dynamic getRecommendation(double bmi) {
    if (bmi < 16) {
      return 'You are in the Severe Thinness category. It is recommended to consult with a healthcare provider to assess potential health risks and nutritional needs.';
    } else if (bmi >= 16 && bmi < 17) {
      return 'You are in the Moderate Thinness category. A balanced diet and possibly a consultation with a healthcare provider are recommended.';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'You are in the Mild Thinness category. It may be helpful to focus on nutrient-rich foods to gain weight gradually.';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Well done ! You are in the Ideal category. Maintain a balanced diet and regular physical activity to stay healthy.';
    } else if (bmi >= 25 && bmi < 30) {
      return 'You are in the Overweight category. Consider a healthy eating plan and increasing your physical activity to reach a healthier weight.';
    } else if (bmi >= 30 && bmi < 35) {
      return 'You are in the First Stage of Obesity. It is advisable to consult with a healthcare provider for a weight management plan.';
    } else if (bmi >= 35 && bmi < 40) {
      return 'You are in the Second Stage of Obesity. Medical intervention may be necessary to manage your weight and associated health risks.';
    } else if (bmi >= 40) {
      return 'You are in the Severely Obesity category. Seeking medical advice and creating a comprehensive weight management plan is highly recommended.';
    }
  }

  void showAlertDialog(String thing) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            thing,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          insetPadding: const EdgeInsets.all(20),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Okay',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calculate Your BMI",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: kColorScheme.primaryContainer,
              ),
            ),
            Text(
              "Know your BMI by entering basic details like Age,Height & Weight",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: kColorScheme.primaryContainer,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                      //fillColor: kColorScheme.primaryContainer,
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      )),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  maxLength: 3,
                  showCursor: true,
                  onSubmitted: (value) {
                    var val1 = double.tryParse(ageController.text);
                    if (ageController.text.isNotEmpty) {
                      if (val1 != null) {
                        if (val1 > 0) {
                          age = val1;
                        } else {
                          showAlertDialog('Please Enter a valid age');
                        }
                      } else {
                        showAlertDialog('Please Enter a valid age');
                      }
                    } else {
                      showAlertDialog('Please Enter a valid age');
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: feetController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Feet',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        onSubmitted: (value) {
                          double? val = double.tryParse(feetController.text);
                          if (feetController.text.isNotEmpty) {
                            if (val != null) {
                              if (val > 0) {
                                feetVar = val;
                              } else {
                                showAlertDialog('Please Enter a valid height');
                              }
                            } else {
                              showAlertDialog('Please Enter a valid height');
                            }
                          } else {
                            showAlertDialog('Please Enter a valid height');
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        controller: inchController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Inch',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        maxLength: 2,
                        onSubmitted: (value) {
                          double? val = double.tryParse(inchController.text);
                          if (inchController.text.isNotEmpty) {
                            if (val != null) {
                              if (val > 0) {
                                inchVar = val;
                              } else {
                                showAlertDialog('Please Enter a valid height');
                              }
                            } else {
                              showAlertDialog('Please Enter a valid height');
                            }
                          } else {
                            showAlertDialog('Please Enter a valid height');
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: weightController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Weight',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        maxLength: 6,
                        onSubmitted: (value) {
                          var val2 = double.tryParse(weightController.text);
                          if (weightController.text.isNotEmpty) {
                            if (val2 != null) {
                              if (val2 > 0) {
                                //calculateBmi();
                                weight = val2;
                              } else {
                                showAlertDialog('Please Enter a valid Weight');
                              }
                            } else {
                              showAlertDialog('Please Enter a valid Weight');
                            }
                          } else {
                            showAlertDialog('Please Enter a valid Weight');
                          }
                        },
                      ),
                    ),
                    const Spacer(),
                    DropdownButton(
                        dropdownColor: kColorScheme.onPrimaryContainer,
                        value: kg,
                        items: KgOrLbs.values.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.name.toString().toLowerCase(),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.blueGrey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            kg = value;
                          });
                        })
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      feetVar = double.tryParse(feetController.text);
                      weight = double.tryParse(weightController.text);
                      inchVar = double.tryParse(feetController.text);
                      if (feetVar == null ||
                          weight == null ||
                          inchVar == null) {
                        showAlertDialog('Please Enter a valid Height & Weight');
                      } else if (feetVar! <= 0 ||
                          weight! <= 0 ||
                          inchVar! <= 0) {
                        showAlertDialog('Please Enter a valid Height & Weight');
                      } else {
                        calculateBmi();
                        defineStatus();
                        String recommendation = getRecommendation(bmi);
                        //add it here
                        widget.switchPage(recommendation, status, bmi);
                      }
                    },
                    child: const Text("Calculate BMI"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calculateBmi() {
    inchVar = double.tryParse(inchController.text);
    feetVar = double.tryParse(feetController.text);
    weight = double.tryParse(weightController.text);

    if (kg == KgOrLbs.lbs) {
      weight = weight! * 0.453592;
    }
    var height = feetVar! * 12;
    height += inchVar!;
    height *= 0.0254;
    bmi = weight! / (height * height); // (height * height);
  }
}
