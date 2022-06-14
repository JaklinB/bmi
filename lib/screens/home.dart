import 'package:todo/constants/app_constants.dart';
import 'package:todo/widgets/left_bar.dart';
import 'package:todo/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: accentColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child:  TextField(
                    controller: _heightController,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child:  TextField(
                    controller: _weightController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState((){
                _bmiResult = _w / (_h * _h);
                if(_bmiResult > 25){
                  _textResult = 'You\'re over weight';
                }else if(_bmiResult >= 18.5 && _bmiResult <=25){
                _textResult = 'You have normal weight';
                }else{
                  _textResult = 'You\'re under weight';
                }
                });
              },
              child: Container(
                child: const Text("Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentColor
                ),),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child:  Text(_bmiResult.toStringAsFixed(2),style: const TextStyle(fontSize: 90, color: accentColor)),
            ),
            SizedBox(height: 50),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
              child:  Text(
                  _textResult,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: accentColor)),
            ),),
            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            LeftBar(barWidth: 70),
            SizedBox(height: 20),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 50),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
