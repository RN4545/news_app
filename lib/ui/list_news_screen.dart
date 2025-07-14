import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/news_event.dart';
import 'package:news/utils/url_helper_function.dart';

import '../blocs/news_bloc.dart';
import '../blocs/news_state.dart';

class ListNewsScreen extends StatefulWidget {
  const ListNewsScreen({super.key});

  @override
  State<ListNewsScreen> createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.blue.shade300),
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          "News",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.status == NewsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == NewsStatus.loaded) {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              final article = state.articles[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {
                    if (article.url != null) {
                      launchExternalURL(article.url!);
                    }
                    // You can open detail screen or use `url_launcher`
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article.image != null)
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            article.image!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title ?? 'No Title',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              article.description ?? '',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  article.source?.name ?? 'Unknown Source',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  article.publishedAt?.split('T').first ?? '',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state.status == NewsStatus.error) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else {
          return const SizedBox.shrink(); // Initial
        }
      },
    );
  }
}
