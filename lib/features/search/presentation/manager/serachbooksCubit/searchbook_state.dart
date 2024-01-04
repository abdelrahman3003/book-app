part of 'searchbook_cubit.dart';

sealed class SearchbookState extends Equatable {
  const SearchbookState();

  @override
  List<Object> get props => [];
}

final class SearchbookInitial extends SearchbookState {}

final class SearchbookLoading extends SearchbookState {}

final class SearchbookFailure extends SearchbookState {
  final String errorMessage;

  SearchbookFailure({required this.errorMessage});
}

final class SearchbookSuccess extends SearchbookState {
  final List<BookModel> books;

  SearchbookSuccess({required this.books});
}
