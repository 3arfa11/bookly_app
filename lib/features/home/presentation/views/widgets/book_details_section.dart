import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .18),
          child: BookImageItem(
            imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle28.copyWith(fontFamily: kGtSectraFine),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          totalRating: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
      ],
    );
  }
}
