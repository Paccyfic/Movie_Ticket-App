import 'package:flutter/material.dart';
import 'package:theatre_tickets_app/utils/data.dart';
//import '../utils/mytheme.dart';

class CrewCastBlock extends StatelessWidget {
  const CrewCastBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Crew & Casts",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All >",
                  style: TextStyle(
                    color: Color.fromARGB(255, 90, 4, 45),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: crewCast.length,
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          crewCast[index].image,
                          height: 107,
                          width: 87,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(crewCast[index].name)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}