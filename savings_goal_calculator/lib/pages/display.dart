import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Display extends StatefulWidget {
  final Map <String, dynamic> results;
  const Display({super.key, required this.results});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
late double current = widget.results['Current'];
late  double goal = widget.results['Goal'];
late double monthly = widget.results['Monthly'];
late DateTime start =  DateTime.parse(widget.results['Date'].toString())   ;

double  achieved(){
 return ((goal - current)/goal * 100);
}


double remaining(){
  return ((goal-current)/monthly);
}

DateTime next(){
return start.add(const Duration(days: 30));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Results'),),
      ) ,
      body:  Center(
        child: Column(
          children: [
            Text('Your current achievement : ${achieved().toStringAsFixed(0)}%'),
            Text(' Remaining months to achieve goal : ${remaining().toStringAsFixed(0)} months'),
            Text('Next installation on : ${DateFormat('EEEE, dd.MM.yy').format(next())}'),
            Text('Next installation on : ${next().difference(DateTime.now()).inHours.toString()} hours')
          ],),
      )
      
      );
  
}}