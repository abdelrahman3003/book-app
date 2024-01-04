part of 'similarbooks_cubit.dart';

sealed class SimilarbooksState extends Equatable {
  const SimilarbooksState();

  @override
  List<Object> get props => [];
}

final class SimilarbooksInitial extends SimilarbooksState {}

final class SimilarbooksLoading extends SimilarbooksState {}

final class SimilarbooksFailure extends SimilarbooksState {
  final String errorMessage;

  SimilarbooksFailure(this.errorMessage);
}

final class SimilarbooksSuccess extends SimilarbooksState {
  final List<BookModel> books;

  SimilarbooksSuccess(this.books);
}
