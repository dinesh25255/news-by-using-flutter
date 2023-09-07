


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/common/app_bar.dart';
import 'package:news/constants/text_style.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/loading/news_load.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/loading/image_load.dart';

class NewsPage extends ConsumerWidget {

  String name;
  NewsPage(this.name, {super.key});

  String sortBy = "popularity";

  final category = ['popularity', 'publishedAt', 'relevancy' ];


  @override
  Widget build(BuildContext context, ref) {
    final newsState = ref.watch(newsProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget.getAppBar(text: "$name news", isUpperCase: true ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: sortBy,
                  items: category.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyles.dropDownText,
                      ),
                    );
                  }).toList(),

                  onChanged: (String? newValue) {
                    sortBy = newValue!;
                    ref.read(newsProvider.notifier).getNews(sortBy: newValue, searchText: name);

                  },
                ),
              ),
            ),
            Expanded(child: _buildNews(newsState)),

          ],
        )


      ),
    );
  }

  Widget _buildNews(newsState) {
    if(newsState.isLoad){
      return const NewsLoad();
    }

    else if(newsState.errMessage.isEmpty){

      return ListView.builder(
        shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: newsState.news.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),

                onTap: () async{

                  final Uri url = Uri.parse(newsState.news[index].url);


                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw "Could not launch $url";
                  }

                },
                leading: SizedBox(
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: newsState.news[index].urlToImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const ImageLoad(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),

                  ),
                ),
                title: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(newsState.news[index].title, style: TextStyles.text,) ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(newsState.news[index].source.name, style: TextStyles.sourceText )),
                    Text(newsState.news[index].publishedAt.substring(0, 10), style: TextStyles.text,),
                  ],
                ),
              ),
            );
          }
      );

    }

    else{
      return Center(child: Text(newsState.errMessage),);
    }
  }

}
