import 'package:flutter/material.dart';
import 'package:rick_and_morty/costants/Colors.dart';
import 'package:rick_and_morty/costants/Routes.dart';
import 'package:rick_and_morty/data/models/Results.dart';

class itemview extends StatelessWidget {

  final Results char;
  const itemview({super.key , required this.char});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 8),
      width: double.infinity,
      color: Colors.black54,
       alignment: Alignment.bottomCenter,
      child: Text(char.name,style: const TextStyle(
        color: colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
    
        ),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),


    ),child:InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Characterdetails,arguments: char);
      },
      child: Hero(
        tag: char.id,
        child: Container(
          width: double.infinity,
          margin:const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          padding:const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(8),
        
          ),
          child: char.image.isNotEmpty ?FadeInImage.assetNetwork(placeholder: 'assets/images/myloading.gif',placeholderFit:BoxFit.contain , image: char.image,fit: BoxFit.cover,) :Image.asset('assets/images/me.jpg'),
          
        
        ),
      ),
    ),
    );
  }
}