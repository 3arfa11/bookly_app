import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_suggestion_list_view.dart';
import 'package:flutter/material.dart';

class SuggestedBooksSection extends StatelessWidget {
  const SuggestedBooksSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BookSuggestionListView(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
