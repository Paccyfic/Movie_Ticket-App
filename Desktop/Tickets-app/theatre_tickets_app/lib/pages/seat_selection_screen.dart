import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:theatre_tickets_app/controllers/auth_controller.dart';
import 'package:theatre_tickets_app/controllers/seat_selection_controller.dart';
import 'package:theatre_tickets_app/model/movie_model.dart';
import 'package:theatre_tickets_app/model/theatre_model.dart';
//import 'package:theatre_tickets_app/utils/mytheme.dart';
import 'package:theatre_tickets_app/widgets/number_of_seats.dart';
import 'package:theatre_tickets_app/widgets/seat_layout.dart';
import 'package:theatre_tickets_app/widgets/seat_type.dart';
import 'package:theatre_tickets_app/blocs/theatre_bloc.dart';

import '../utils/data.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TheatreModel theatreModel;
  final MovieModel movieModel;
  const SeatSelectionScreen({
    super.key,
    required this.theatreModel,
    required this.movieModel,
  });

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  noOfSeatSelection() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "How Many Seats?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: SvgPicture.asset(
                    "assets/icons/${SeatSelectionController.instance.getAsset()}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              NoOfSeats(onTap: SeatSelectionController.instance.noOfSeats.call),
              const SizedBox(
                height: 10,
              ),
              SeatType(
                onTap: SeatSelectionController.instance.seatType.call,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBar({required Function(bool) toggle}) {
    return BottomAppBar(
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: ElevatedButton(
          onPressed: () {
            //print(SeatSelectionController.instance.isSeatSelection.value);

            if (SeatSelectionController.instance.isSeatSelection.value) {
              if (SeatSelectionController.instance.seatPrice <= 0.0) {
                AuthController.instance.getErrorSnackBarNew("Please select atleast one seat");
                return;
              }
              SeatSelectionController.instance.createOrder();
            } else {
              if (SeatSelectionController.instance.noOfSeats.value <= 0) {
                AuthController.instance.getErrorSnackBarNew("Please select number of seats");
                return;
              }
              toggle(true);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: const Color.fromARGB(255, 90, 4, 45),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Obx(
            () => Center(
              child: Text(
                SeatSelectionController.instance.isSeatSelection.value
                    ? "Pay ${SeatSelectionController.instance.seatPrice.value}"
                    : "Select Seats",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget myAppBar({required Function(bool) toggle}) {
    return AppBar(
      elevation: 0,
      title: Text(widget.movieModel.title),
      actions: [
        TextButton(
          onPressed: () {
            toggle(false);
            SeatSelectionController.instance.selectedSeats = [].obs;
            SeatSelectionController.instance.seatPrice = 0.0.obs;
            SeatSelectionController.instance.seatPrices = [].obs;
          },
          child: Obx(
            () => Text(
              "${SeatSelectionController.instance.noOfSeats < 0 ? 0 : SeatSelectionController.instance.noOfSeats} Seats",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(toggle: SeatSelectionController.instance.isSeatSelection.call),
      backgroundColor: const Color(0xFFF5F5FA),
      appBar: myAppBar(toggle: SeatSelectionController.instance.isSeatSelection.call),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex.call,
            isBooking: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() => SeatSelectionController.instance.isSeatSelection.value
              ? SeatLayout(model: seatLayout)
              : noOfSeatSelection()),
        ],
      ),
    );
  }
}