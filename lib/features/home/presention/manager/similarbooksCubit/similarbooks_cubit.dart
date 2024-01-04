import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similarbooks_state.dart';

class SimilarbooksCubit extends Cubit<SimilarbooksState> {
  SimilarbooksCubit(this.homeRepo) : super(SimilarbooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchsimilarbooks({required String catogary}) async {
    emit(SimilarbooksLoading());
    var result = await homeRepo.FetchSimilarBooks(catogary: catogary);
    result.fold((failure) {
      emit(SimilarbooksFailure(failure.Errormessage));
    }, (books) {
      emit(SimilarbooksSuccess(books));
    });
  }
}
