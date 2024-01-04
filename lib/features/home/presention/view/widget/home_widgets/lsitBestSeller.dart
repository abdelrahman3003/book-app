import 'package:book/core/errors/custom_error_widget.dart';
import 'package:book/core/widgets/customloadingindicatorr.dart';
import 'package:book/features/home/presention/manager/newestbooks/newestbooks_cubit.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/best_seller_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBestSeller extends StatelessWidget {
  const ListBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbooksSucess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BestSellerBody(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestbooksFailure) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        }
        return CustomcLoadingIndicator();
      },
    );
  }
}
