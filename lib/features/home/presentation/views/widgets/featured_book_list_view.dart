import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cutbit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BookImageItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is FeaturedBookLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
