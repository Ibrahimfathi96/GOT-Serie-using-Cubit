import 'package:breaking_bad_bloc/Data/Models/GOTCharacter.dart';
import 'package:breaking_bad_bloc/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class CharacterItem extends StatelessWidget {
  final GotCharacter character;

  const CharacterItem({super.key, required this.character});

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
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, characterDetailsScreen,arguments: character);
        },
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            child: Text(character.fullName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold
            ),),
          ),
          child: Hero(
            tag: character.id,
            child: Container(
              color: MyColors.grey,
              child: CachedNetworkImage(
                imageUrl: character.imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                 Center(child: Image.asset('assets/images/loading.gif'),),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            ),
          ),
        ),
      ),
    );
  }
}
