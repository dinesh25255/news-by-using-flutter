

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsLoad extends StatelessWidget {
  const NewsLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
        return  Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.white,

                    height: 70,
                    width: 100,


                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 40,
                          width: double.infinity,
                        ),

                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.white,
                              height: 20,
                              width: 80,
                            ),

                            Container(
                              color: Colors.white,
                              height: 20,
                              width: 80,
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        );
      }
    );
  }
}
