import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this.homeRepo) : super(NewestbooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchnewestbooks() async {
    emit(NewestbooksLoading());
    var result = await homeRepo.FetchNewestBooks();
    result.fold((failure) {
      emit(NewestbooksFailure(failure.Errormessage));
    }, (books) {
      emit(NewestbooksSucess(books));
    });
  }
}
