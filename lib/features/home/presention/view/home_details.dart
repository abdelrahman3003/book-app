import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/presention/manager/similarbooksCubit/similarbooks_cubit.dart';
import 'package:book/features/home/presention/view/widget/details_home/BestSellersDetailsSection.dart';
import 'package:book/features/home/presention/view/widget/details_home/BookDetailsSection.dart';
import 'package:book/features/home/presention/view/widget/details_home/ButtomnSection.dart';
import 'package:book/features/home/presention/view/widget/details_home/home_details_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  void initState() {
    BlocProvider.of<SimilarbooksCubit>(context).fetchsimilarbooks(
        catogary: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CoustomAppBarDetailsBody(),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: BookDetailsSection(bookModel: widget.bookModel),
                ),
                ButtomnSection(bookModel: widget.bookModel),
                const SizedBox(
                  height: 30,
                ),
                const BestSellersDetailsSection(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
