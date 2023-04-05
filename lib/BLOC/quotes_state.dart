part of 'quotes_cubit.dart';

@immutable
abstract class QuotesState {}

class QuotesInitial extends QuotesState {}

class QuotesLoaded extends QuotesState{
  final List<CharactersQuotes> gotQuotes;

  QuotesLoaded(this.gotQuotes);
}

class QuotesErrorCase extends QuotesState{}