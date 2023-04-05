import 'package:breaking_bad_bloc/Data/Models/GOTCharacter.dart';
import 'package:breaking_bad_bloc/constants/colors.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  final GotCharacter character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600, //image height
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.fullName,
          style: const TextStyle(color: MyColors.white),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  Widget characterInfo(String title, String value){
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(color: MyColors.white,fontWeight: FontWeight.bold,fontSize: 18)
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: MyColors.white,fontSize: 16)
          ),
        ]
      )
    );
  }
  Widget buildDivider(double endIndent){
    return Divider(
      color: MyColors.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Full Name:  ',character.fullName),
                      buildDivider(260),
                      characterInfo('Title:  ',character.title),
                      buildDivider(305),
                      characterInfo('House:  ',character.family),
                      buildDivider(290),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
                const SizedBox(height: 500,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
