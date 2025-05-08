import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookImageItem extends StatelessWidget {
  const BookImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              placeholder: (context, url) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                ));
              },
              errorWidget: (context, url, error) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Failed to load!",
                      style: Styles.textStyle18,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
