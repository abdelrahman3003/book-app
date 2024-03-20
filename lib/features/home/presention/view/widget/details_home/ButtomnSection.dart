import 'package:book/core/widgets/customButton.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/featurebooks_Cubit/featurebooks_cubit.dart';

class ButtomnSection extends StatelessWidget {
  const ButtomnSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: CustomButtom(
                onPressed: () {},
                backgroundcolor: Colors.white,
                textcolor: Colors.black,
                text: "Free",
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
          ),
          Expanded(
            child: CustomButtom(
                onPressed: () async {
                  BlocProvider.of<FeaturebooksCubit>(context)
                      .getUrl(bookModel.volumeInfo.previewLink!, context);
                },
                backgroundcolor: const Color(0xffEF8262),
                textcolor: Colors.white,
                text: getext(),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          ),
        ],
      ),
    );
  }

  String getext() {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not availble";
    }
    return "Preview";
  }
}
