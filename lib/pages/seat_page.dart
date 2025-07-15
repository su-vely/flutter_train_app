import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  const SeatPage({
    super.key,
    required this.departure,
    required this.arrival,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final Set<String> selectedSeats = {};

  void toggleSeat(String seatId) {
    setState(() {
      if (selectedSeats.contains(seatId)) {
        selectedSeats.remove(seatId);
      } else {
        selectedSeats.add(seatId);
      }
    });
  }

void bookSeats() {
  if (selectedSeats.isEmpty) return;

  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: const Text('예매 확인'),
      content: Text('${selectedSeats.length}개의 좌석을 예매하시겠습니까?'),
      actions: [
        CupertinoDialogAction(
          child: const Text('취소'),
          //onPressed: () => Navigator.pop(context), // 다이얼로그 닫기
          onPressed: () {
          setState(() {
            selectedSeats.clear(); // ✅ 선택된 좌석 초기화
          });
        },
        ),
        CupertinoDialogAction(
          child: const Text('확인'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(); // 다이얼로그만 닫음
            Navigator.popUntil(context, (route) => route.isFirst); // 홈으로 이동
          },
        ),
      ],
    ),
  );
}

  Widget buildSeat(String seatId) {
    final isSelected = selectedSeats.contains(seatId);
    return GestureDetector(
      onTap: () => toggleSeat(seatId),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(seatId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('좌석 선택')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.departure,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_circle_right_outlined, size: 30),
                const SizedBox(width: 8),
                Text(
                  widget.arrival,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendBox('선택됨', Colors.purple),
                const SizedBox(width: 20),
                _legendBox('선택안됨', Colors.grey[300]!),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('A', style: TextStyle(fontSize: 18)),
                Text('B', style: TextStyle(fontSize: 18)),
                SizedBox(width: 50), // 행 번호 칸
                Text('C', style: TextStyle(fontSize: 18)),
                Text('D', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, row) {
                  final rowNumber = row + 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildSeat('A$rowNumber'),
                        buildSeat('B$rowNumber'),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text('$rowNumber',
                              style: const TextStyle(fontSize: 18)),
                        ),
                        buildSeat('C$rowNumber'),
                        buildSeat('D$rowNumber'),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: bookSeats,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '예매 하기',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _legendBox(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}