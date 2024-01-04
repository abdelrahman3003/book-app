import 'package:book/core/widgets/customButton.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                  if (await canLaunchUrl(url)) {
                    return await canLaunchUrl(url);
                  }
                  return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("cann't launch url$url")));
                },
                backgroundcolor: Color(0xffEF8262),
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
