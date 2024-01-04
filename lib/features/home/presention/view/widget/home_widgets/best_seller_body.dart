import 'package:book/constants.dart';
import 'package:book/core/utils/routesApp.dart';
import 'package:book/core/utils/styles.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/bookCart.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          RoutesApp.kHomeDetails,
          extra: bookModel,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
                height: 120,
                child: BookCart(
                  Urlimage: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(
                    bookModel.volumeInfo.title ?? "Unknwon",
                    style: Styles.textStyle20.copyWith(
                        fontFamily: Constant.kGtSectraFine,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  bookModel.volumeInfo.authors?[0] ?? "Unknown",
                  style: Styles.textStyle14,
                ),
                Row(
                  children: [
                    const Text(
                      "Free",
                      style: Styles.textStyle18,
                    ),
                    const Spacer(),
                    rating(
                      rate: bookModel.volumeInfo.averageRating ?? 0,
                      count: bookModel.volumeInfo.ratingsCount ?? 0,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
