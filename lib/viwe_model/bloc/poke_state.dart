part of 'poke_cubit.dart';

abstract class PokeState {}

class PokeInitial extends PokeState {}
class GetPokeLoadingState extends PokeState {}
class GetPokeSuccessState extends PokeState {}
class GetPokeErrorState extends PokeState {}
class SelectedPokeState extends PokeState {}
