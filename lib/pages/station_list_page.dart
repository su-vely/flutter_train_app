import 'package:flutter/material.dart';
import '../models/station_type.dart';

class StationListPage extends StatelessWidget {
  final StationType type;
  const StationListPage({super.key, required this.type});

  final List<String> stations = const [
    "수서", "동탄", "평택지제", "천안아산", "오송",
    "대전", "김천구미", "동대구", "경주", "울산", "부산"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type == StationType.departure ? '출발역' : '도착역'),
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pop(context, stations[index]);
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Text(
                stations[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}