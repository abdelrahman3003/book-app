import 'package:book/core/errors/failures.dart';
import 'package:book/core/utils/api_Services.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';

import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeREpoImp implements HomeRepo {
  final ApiService apiService;

  HomeREpoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> FetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free-ebooks&Sorting=newest &q=general");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.froDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

//
//https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=subject:Programming
  @override
  Future<Either<Failure, List<BookModel>>> FetchFeaturesBooks() async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free-ebooks&q=subject:general");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.froDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> FetchSimilarBooks(
      {required String catogary}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.froDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  getUrl(urL, context) async {
    Uri url = Uri.parse(urL);
    if (await canLaunchUrl(url)) {
      await launch(url.toString());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("cann't launch url$url")));
    }
  }
}
