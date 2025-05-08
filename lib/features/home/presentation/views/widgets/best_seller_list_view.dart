import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
