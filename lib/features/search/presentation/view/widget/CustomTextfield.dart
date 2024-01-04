import 'package:book/features/search/presentation/manager/serachbooksCubit/searchbook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
  });
  static String? value;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (v) {
        BlocProvider.of<SearchbookCubit>(context).fetchSearchbookfromRepo(v);
      },
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: Icon(
          Icons.search_sharp,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
