import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: const Icon(
              Icons.search,
            ),
            filled: true,
            fillColor: Colors.grey.shade900,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white))),
      ),
    );
  }
}
