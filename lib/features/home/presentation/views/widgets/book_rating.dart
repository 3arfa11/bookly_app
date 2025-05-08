import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    required this.rating,
    required this.totalRating,
    super.key,
  });

  final num rating, totalRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
          size: 28,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle20,
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          '(${totalRating})',
          style: Styles.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
