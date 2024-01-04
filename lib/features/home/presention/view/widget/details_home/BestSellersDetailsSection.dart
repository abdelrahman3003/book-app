import 'package:book/core/errors/custom_error_widget.dart';
import 'package:book/core/utils/styles.dart';
import 'package:book/core/widgets/customloadingindicatorr.dart';
import 'package:book/features/home/presention/manager/similarbooksCubit/similarbooks_cubit.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/bookCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellersDetailsSection extends StatelessWidget {
  const BestSellersDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
            builder: (context, state) {
              if (state is SimilarbooksSuccess) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: BookCart(
                        Urlimage: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            "",
                      ),
                    );
                  },
                );
              } else if (state is SimilarbooksFailure) {
                return CustomErrorMessage(errorMessage: state.errorMessage);
              }
              return const CustomcLoadingIndicator();
            },
          ),
        ),
      ],
    );
  }
}
