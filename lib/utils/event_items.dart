import 'package:flutter/material.dart';
import 'package:theatre_tickets_app/model/event_model.dart';
import 'package:theatre_tickets_app/blocs/item_bloc.dart';

class EventItems extends StatelessWidget {
  final List<EventModel> events;
  const EventItems({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 230,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (_, i) {
          return ItemBlock(
            model: events[i],
            onTap: (model) {},
          );
        },
      ),
    );
  }
}