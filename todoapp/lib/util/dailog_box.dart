import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DailogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DailogBox({super.key , required this.controller ,required this.onSave, required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 115,
        child: Column(
          children: [
            Padding(padding:EdgeInsets.all(5)),
            TextField(
              controller: controller ,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Add a new task"),
              
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 4,),

                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel,
                // color: Colors.red,
                
                )


              ],
            )
            
          ],
        ),
      ),
    );
  }
}