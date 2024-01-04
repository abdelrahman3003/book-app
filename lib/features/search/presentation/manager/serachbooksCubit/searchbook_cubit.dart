import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/search/data/repo/search_repo_imp.dart';
import 'package:equatable/equatable.dart';

part 'searchbook_state.dart';

class SearchbookCubit extends Cubit<SearchbookState> {
  SearchbookCubit(this.searchRepoImp) : super(SearchbookInitial());
  final SearchRepoImp searchRepoImp;
  Future<void> fetchSearchbookfromRepo(String catogarey) async {
    emit(SearchbookLoading());
    var result = await searchRepoImp.fecthsearchbooks(catogarey);
    result.fold((failure) {
      emit(SearchbookFailure(errorMessage: failure.Errormessage));
    }, (books) {
      emit(SearchbookSuccess(books: books));
    });
  }
}
