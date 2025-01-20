
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, this.dataa, this.total});
  // ignore: prefer_typing_uninitialized_variables
  final dataa; 
  // ignore: prefer_typing_uninitialized_variables
  final total ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 4,
        ),
        Container(
            alignment: Alignment.center,
            child: const Text(
              ' < summary >',
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            )),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataa.length,
          itemBuilder: (context, index) => SizedBox(height: 130,
            child: Card(
              child:ListTile( 
                        leading: SizedBox( height: 100,
                          child: Image.network(dataa[index].image,fit: BoxFit.cover, )), 
                        
                        title: Text(dataa[index].name ,style:const TextStyle( fontSize: 20),),
                        subtitle:
                             Text("${dataa[index].price}") ,
                       
                      ),
            ),
          ),
        ) ,
        const Spacer() ,
        // ignore: unnecessary_brace_in_string_interps
        Text("Total: ${total} " ,style: const TextStyle( fontSize: 20 ,fontWeight: FontWeight.bold),)
      ]),
    );
  }
}
