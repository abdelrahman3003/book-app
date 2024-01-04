import 'package:book/core/errors/custom_error_widget.dart';
import 'package:book/core/utils/routesApp.dart';
import 'package:book/core/widgets/customloadingindicatorr.dart';
import 'package:book/features/home/presention/manager/featurebooks_Cubit/featurebooks_cubit.dart';
import 'package:book/features/home/presention/view/widget/home_widgets/bookCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Booklist extends StatelessWidget {
  const Booklist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturebooksCubit, FeaturebooksState>(
      builder: (context, state) {
        if (state is FeaturebooksSucessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.ListBooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        RoutesApp.kHomeDetails,
                        extra: state.ListBooks[index],
                      );
                    },
                    child: BookCart(
                        Urlimage: state.ListBooks[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            ""),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturebooksFailureState) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        }
        return CustomcLoadingIndicator();
      },
    );
  }
}
