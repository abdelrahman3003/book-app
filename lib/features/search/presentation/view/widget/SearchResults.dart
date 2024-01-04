import 'package:book/core/errors/custom_error_widget.dart';
import 'package:book/core/utils/styles.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/best_seller_body.dart';
import 'package:book/features/search/presentation/manager/serachbooksCubit/searchbook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchbookCubit, SearchbookState>(
      builder: (context, state) {
        if (state is SearchbookSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: BestSellerBody(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchbookFailure) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        }
        return const Center(
            child: Text(
          "No Results",
          style: Styles.textStyle18,
        ));
      },
    );
  }
}
