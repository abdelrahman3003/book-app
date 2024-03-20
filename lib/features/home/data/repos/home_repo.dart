import 'package:book/core/errors/failures.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> FetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> FetchFeaturesBooks();
  Future<Either<Failure, List<BookModel>>> FetchSimilarBooks(
      {required String catogary});
  getUrl(String url, BuildContext context);
}
