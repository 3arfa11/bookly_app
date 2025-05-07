import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.back,
            ),
          ),
          const SearchTextField(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Search results",
            style: Styles.textStyle18,
          ),
          Divider(
            color: Colors.grey.shade800,
            thickness: 0.8,
          ),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
