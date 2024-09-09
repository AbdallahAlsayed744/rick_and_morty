import 'package:flutter/material.dart';
import 'package:rick_and_morty/costants/Colors.dart';
import 'package:rick_and_morty/data/models/Results.dart';

class CharacterScreenDetails extends StatelessWidget {
  final Results char;

  const CharacterScreenDetails({required this.char,super.key});

  Widget sliverappbar(){
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: colors.gray,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(char.name),
        // centerTitle: true,
        background: Hero(tag: char.id, child:
        Image.network(char.image,fit: BoxFit.cover,),)
      ),


    );
  }

  Widget bodyofdetails(String title, String value){
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(children: [

        TextSpan(text: title, style: const TextStyle(color: colors.white, fontSize: 22, fontWeight: FontWeight.bold)),

        TextSpan(text: value, style: const TextStyle(color: Color.fromARGB(255, 148, 148, 150), fontSize: 20, fontWeight: FontWeight.normal)),
      ]),

    );
     
  }

  Widget dvider(double endIndent){
    return Divider(
      height: 30,
      color: colors.yellow,
      thickness: 2,
      endIndent: endIndent,
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colors.gray,
      body: CustomScrollView(
        slivers: [
          sliverappbar(),
          

          SliverList(delegate: SliverChildListDelegate([

            Container(
              margin:const EdgeInsets.fromLTRB(14, 30, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  bodyofdetails("Status: ", char.status),
                  dvider(286),
                  bodyofdetails("Species: ", char.species),
                  dvider(270),
                  bodyofdetails("Gender: ", char.gender),
                  dvider(280),
                  

                  // SizedBox(height: 120,)
                  
              
              ]),
              
            ),
            SizedBox(height: 600,)

          ],
          ),
          )

        ],
      )
    );
  }
}
