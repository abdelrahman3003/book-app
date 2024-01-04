import 'package:book/core/errors/failures.dart';

import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fecthsearchbooks(String catogarey);
}
