part of 'newestbooks_cubit.dart';

sealed class NewestbooksState extends Equatable {
  const NewestbooksState();

  @override
  List<Object> get props => [];
}

final class NewestbooksInitial extends NewestbooksState {}

final class NewestbooksLoading extends NewestbooksState {}

final class NewestbooksFailure extends NewestbooksState {
  final String errorMessage;

  NewestbooksFailure(this.errorMessage);
}

final class NewestbooksSucess extends NewestbooksState {
  final List<BookModel> books;

  NewestbooksSucess(this.books);
}
