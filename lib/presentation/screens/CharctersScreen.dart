
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty/business_logic/cubit/charactres_cubit.dart';
import 'package:rick_and_morty/costants/Colors.dart';
import 'package:rick_and_morty/data/models/Results.dart';
import 'package:rick_and_morty/presentation/widgets/itemview.dart';

class CharctersScreen extends StatefulWidget {
  const CharctersScreen({super.key});

  @override
  State<CharctersScreen> createState() => _CharctersScreenState();


}





class _CharctersScreenState extends State<CharctersScreen> {

  late List<Results> allcharacters;
  late List<Results> searchcharacters;
  final TextEditingController searchcontroller = TextEditingController();

  var _isSearching = false;


 

  Widget getBlocBuilder(){

  return BlocBuilder<CharactresCubit,CharactresState>(builder: (context,state){

    if(state is CharactresLoaded){

      allcharacters = state.characters;
    

      return getScreenWidgets();
      


    }else{

      return Circlewindicatorloadoin();

    }
    


  });



}

Widget Circlewindicatorloadoin(){

  return const Center(child: CircularProgressIndicator(
    color: colors.yellow,

  ),);
}

Widget getScreenWidgets(){

  return SingleChildScrollView(

    child: Container(
  
    // color:colors.gray ,
    child: Column(children: [

      Gridviewwidget()


      
    ]),
    ),
  );
  
}

Widget Gridviewwidget(){

  return GridView.builder(
  itemCount: searchcontroller.text.isEmpty ? allcharacters.length : searchcharacters.length,
  physics:const ClampingScrollPhysics() 
  ,padding: EdgeInsets.zero,shrinkWrap: true,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  childAspectRatio: 2/3,
  mainAxisSpacing: 1,
  crossAxisSpacing: 1), 
  itemBuilder: (context,index)
  {
     
     return itemview(char: searchcontroller.text.isEmpty ? allcharacters[index] : searchcharacters[index] );

     

  });
  



}

Widget searchcharactertextfield(){

  return TextField(
    controller: searchcontroller,
    cursorColor: colors.gray,
    autofocus: true,
    decoration: const InputDecoration(
    hintText: "Search for Character",
    border: InputBorder.none,
    hintStyle: TextStyle(color: colors.gray,fontSize: 17),

    ),
    style:const TextStyle(color: colors.gray,fontSize: 17),
    onChanged: (value){

      searchcharchter(value);
      
    },
  
  );


}
 void searchcharchter(String value){
  searchcharacters = allcharacters.where((charcter) => charcter.name.toLowerCase().startsWith(value)).toList();

  setState(() {
    
  });
 }

 List<Widget> bodyofsearch(){
   if(_isSearching){

    return [
      IconButton(onPressed: (){
        _closesearch();
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.close,color: colors.gray,))


    ];

    

   }
   else{

    return [IconButton(onPressed: _opensearch, icon: const Icon(Icons.search))];



   }


 } 

 void _opensearch(){

  ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _closesearch));

  setState(() {
    _isSearching =true;
  });


 }

 void _closesearch(){

  _cleartext();

  setState(() {

    _isSearching = false;
  });




 }
 void _cleartext(){

  searchcontroller.clear();
  

 }

 Widget myappbar(){

  return const Text("characters",style: TextStyle(color: colors.gray));


 }

 Widget _buildOfflineWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          Image.asset('assets/images/network.png'),
          
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16.0, vertical: 16.0),
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                      'Can\'t connect to internet! , please check your network.'),
                ],
                repeatForever: true,
              ),
            ),
           
          ),
        ],
      ),
    );
  }


  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactresCubit>(context).getCharacters();
    

    return Scaffold(
      backgroundColor: colors.gray,
      appBar: AppBar(title: _isSearching ? searchcharactertextfield() : myappbar(),

    actions: bodyofsearch(),
    
    
    backgroundColor: colors.yellow,),
    
    body:OfflineBuilder(connectivityBuilder: (BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child){
         final bool connected = !connectivity.contains(ConnectivityResult.none);
         if(connected){
            return getBlocBuilder();
         }
         else{

          return _buildOfflineWidget();



         }



          },
          child: Circlewindicatorloadoin(),
          )

    );
    
    
    
  }
}
