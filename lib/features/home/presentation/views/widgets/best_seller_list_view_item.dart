import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 130,
          child: AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/bookcover.jpg'))),
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                "Harry Potter and the Goblet of Fire",
                style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "J.K. Rowling",
              style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.montserrat().toString()),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  "19.99 \$",
                  style: Styles.textStyle20
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.yellow,
                  size: 28,
                ),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  "4.8",
                  style: Styles.textStyle20,
                ),
                const SizedBox(
                  width: 9,
                ),
                const Text(
                  "(2395)",
                  style: Styles.textStyle16,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
