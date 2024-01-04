import 'package:book/core/errors/failures.dart';
import 'package:book/core/utils/api_services.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fecthsearchbooks(
      String catogarey) async {
    try {
      List<BookModel> books = [];
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest &q=c$catogarey");
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return Left(ServerFailure.froDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
