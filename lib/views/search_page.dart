



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:news/common/app_bar.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/text_style.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/views/news_page.dart';


class SearchPage extends StatelessWidget {

  final textController  = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget.getAppBar(text: "Search any news"),
          body: Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/images/search_image.json'),
                    TextFormField(
                      controller: textController,
                      decoration:  InputDecoration(

                        hintText: "search......",
                        hintStyle: TextStyles.text,

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: AppColor.blueColor),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: AppColor.blueColor),
                        ),
                      ),

                      onFieldSubmitted: (val) {
                        ref.read(newsProvider.notifier).getNews(searchText: val);
                        textController.clear();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   NewsPage(val)),
                        );

                      },
                    ),
                    Wrap(
                      children: [
                        _buildTextButton(ref, context, "Nepal"),
                        _buildTextButton(ref, context, "Games"),
                        _buildTextButton(ref, context, "Technology"),
                        _buildTextButton(ref, context, "Sports"),
                        _buildTextButton(ref, context, "Gadgets"),

                      ],
                    ),
                  ],
                ),
              );
            },
          )

      ),
    );
  }

  TextButton _buildTextButton(WidgetRef ref, BuildContext context, String text) {
    return TextButton(onPressed: (){

                        ref.read(newsProvider.notifier).getNews(searchText: text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   NewsPage(text)),
                        );

                      }, child: Text(text, style:  TextStyles.keyWordsText));
  }
}
