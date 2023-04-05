import 'package:breaking_bad_bloc/BLOC/characters_cubit.dart';
import 'package:breaking_bad_bloc/Data/Models/GOTCharacter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../Widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  static const String routeName = 'char-screen';

  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  late List<GotCharacter> allCharacters;

  late List<GotCharacter> findCharacter;

  bool _isSearching = false;

  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching? const BackButton(color: MyColors.grey,):Container(),
        backgroundColor: MyColors.yellow,
        title: _isSearching? _buildSearchField(): _appBarTitle(),
        actions: _appBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget _appBarTitle(){
    return const Text(
      'Game Of Thrones',
      style: TextStyle(color: MyColors.grey),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).gotCharacters;
          return buildLoadedListWidget();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColors.yellow,
            ),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _textController.text.isEmpty?allCharacters.length:findCharacter.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _textController.text.isEmpty? allCharacters[index]:findCharacter[index],
        );
      },
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _textController,
      cursorColor: MyColors.grey,
      onChanged: (searchedCharacter) {
        addSearchedTextToSearchedList(searchedCharacter);
      },
      style: const TextStyle(
        color: MyColors.grey,
        fontSize: 18,
      ),
      decoration: const InputDecoration(
          hintText: 'Find a character...',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: MyColors.grey,
            fontSize: 18,
          )),
    );
  }

  List<Widget> _appBarActions() {
    if (_isSearching) {
      return [IconButton(
        onPressed: () {
          _clearSearch();
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.clear,
          color: MyColors.grey,
        ),
      )];
    } else {
      return [IconButton(
          onPressed: _startSearching,
          icon: const Icon(
            Icons.search,
            color: MyColors.grey,
          ))];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _textController.clear();
    });
  }

  void addSearchedTextToSearchedList(String searchedCharacter) {
    findCharacter = allCharacters
        .where((character) =>
            character.fullName.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
}
