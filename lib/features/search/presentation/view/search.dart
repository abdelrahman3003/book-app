import 'package:book/core/utils/styles.dart';
import 'package:book/features/search/presentation/view/widget/CustomTextfield.dart';
import 'package:book/features/search/presentation/view/widget/SearchResults.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: CustomTextfield(),
                  ),
                  Text(
                    "Search Results",
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const SliverFillRemaining(child: SearchResults()),
          ],
        ),
      )),
    );
  }
}
