import 'package:book/core/utils/styles.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/bookList.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/costumappbar.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/lsitBestSeller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: CustomappBar(),
                ),
                Booklist(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: ListBestSeller(),
          )
        ],
      ),
    ));
  }
}
