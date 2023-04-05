import 'package:breaking_bad_bloc/Data/Models/character.dart';
import 'package:breaking_bad_bloc/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  CharacterItem({required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          child: Text(character.name ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
            height: 1.3,fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold
          ),),
        ),
        child: Container(
          color: MyColors.grey,
          child: CachedNetworkImage(
            imageUrl: character.image ?? '',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
             Center(child: Image.asset('assets/images/loading.gif'),),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        ),
      ),
    );
  }
}
