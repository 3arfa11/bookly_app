import 'package:bookly_app/features/home/presentation/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';

class BookSuggestionListView extends StatelessWidget {
  const BookSuggestionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: BookImageItem(),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
