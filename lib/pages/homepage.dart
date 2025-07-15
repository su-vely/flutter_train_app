import 'package:flutter/material.dart';
import 'station_list_page.dart';
import 'seat_page.dart';
import '../models/station_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;

  void _selectStation(StationType type) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => StationListPage(type: type),
      ),
    );

    if (result != null) {
      setState(() {
        if (type == StationType.departure) {
          departureStation = result;
        } else {
          arrivalStation = result;
        }
      });
    }
  }

  void _goToSeatPage() {
    if (departureStation == null || arrivalStation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('출발역과 도착역을 모두 선택해주세요.')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SeatPage(
          departure: departureStation!,
          arrival: arrivalStation!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: const Text('기차 예매'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStationColumn('출발역', departureStation, () {
                    _selectStation(StationType.departure);
                  }),
                  Container(
                    height: 50,
                    width: 2,
                    color: Colors.grey[400],
                  ),
                  _buildStationColumn('도착역', arrivalStation, () {
                    _selectStation(StationType.arrival);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _goToSeatPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStationColumn(
    String title,
    String? station,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            station ?? '선택',
            style: const TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}