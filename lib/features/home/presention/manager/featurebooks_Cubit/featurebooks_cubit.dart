import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featurebooks_state.dart';

class FeaturebooksCubit extends Cubit<FeaturebooksState> {
  FeaturebooksCubit(this.homeRepo) : super(FeaturebooksInitial());
  final HomeRepo homeRepo;
  Future<void> FetchFeaturBooks() async {
    emit(FeaturebooksLoadingState());
    var result = await homeRepo.FetchFeaturesBooks();
    result.fold((failure) {
      emit(FeaturebooksFailureState(failure.Errormessage));
    }, (books) {
      emit(FeaturebooksSucessState(books));
    });
  }
}
