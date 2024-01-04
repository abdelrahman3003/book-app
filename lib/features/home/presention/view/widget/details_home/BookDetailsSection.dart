import 'package:book/core/utils/styles.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/bookCart.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .21,
            ),
            child:
                BookCart(Urlimage: bookModel.volumeInfo.imageLinks!.thumbnail)),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title ?? "",
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 7,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        rating(
          rate: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        )
      ],
    );
  }
}
