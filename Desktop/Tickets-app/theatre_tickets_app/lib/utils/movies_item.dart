import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theatre_tickets_app/pages/details_screen.dart';
import 'package:theatre_tickets_app/utils/data.dart';
// ignore: unused_import
import 'package:theatre_tickets_app/utils/mytheme.dart';
import 'package:theatre_tickets_app/blocs/item_bloc.dart';

class MoviesItems extends StatelessWidget {
  const MoviesItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 230,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, i) {
          return Hero(
            tag: "${movies[i].title}$i",
            child: ItemBlock(
              model: movies[i],
              isMovie: true,
              onTap: (model) {
                Get.to(() => DetailsScreen(), arguments: [movies[i], i]);
              },
            ),
          );
        },
      ),
    );
  }
}