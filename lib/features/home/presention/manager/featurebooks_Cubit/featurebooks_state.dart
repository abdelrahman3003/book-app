part of 'featurebooks_cubit.dart';

sealed class FeaturebooksState extends Equatable {
  const FeaturebooksState();

  @override
  List<Object> get props => [];
}

final class FeaturebooksInitial extends FeaturebooksState {}

final class FeaturebooksFailureState extends FeaturebooksState {
  final String errorMessage;

  FeaturebooksFailureState(this.errorMessage);
}

final class FeaturebooksLoadingState extends FeaturebooksState {}

final class FeaturebooksSucessState extends FeaturebooksState {
  final List<BookModel> ListBooks;

  FeaturebooksSucessState(this.ListBooks);
}
