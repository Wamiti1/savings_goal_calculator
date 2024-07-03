import 'package:flutter/material.dart';
import 'package:savings_goal_calculator/pages/display.dart';
import 'package:intl/intl.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  var goal = TextEditingController();
  var savings = TextEditingController();
  var monthly = TextEditingController();
  DateTime now = DateTime.now();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        title: const Center(child:  Text('Goal Savings')),
      ),
      body: ListView(
        children:[Column(
          children: [
          SizedBox(
            
            //For responsiveness on different screens
          height:MediaQuery.of(context).size.height*0.2, 
          child :Image.asset('assets/money.png', scale: 3.0,
          color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,)),
          Text('E-Piggy Savings' ,style: Theme.of(context).textTheme.bodyLarge,),
          Text(
            'Starting : ${DateFormat('EEEE, dd.MM.y').format(now)} ${now.timeZoneName}',
            style: Theme.of(context).textTheme.bodyLarge,),
         
          Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: goal,
                  decoration: const InputDecoration(
                    labelText:'Your goal',
                    border: OutlineInputBorder(),
                  ),
                     keyboardType: TextInputType.number,     
                  ),
                ),
        
        
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: savings,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:'Current Savings'
                  ),
          keyboardType: TextInputType.number, 
                  
                          
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: monthly,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:'Monthly'
                  ),
                            keyboardType: TextInputType.number, 
                  ),
                ),
              ],
            ),
          ),
        
          OutlinedButton(onPressed: (){
            try{
               Map<String, dynamic> results = {
              "Goal": double.parse(goal.text),
              "Current": double.parse(savings.text),
              "Monthly": double.parse(monthly.text),
              "Date": now,
            };
            Navigator.push(context, MaterialPageRoute(builder: (_)=>  Display(results: results,)));
            }

            catch(e){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('An error occurred. Check your input fields')));
            }
           


          }, 
          child: const Text('Calculate'))  
        
          ],),
      ])
    );
  }
}