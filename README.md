# 🚆 Flutter 기차 예매 서비스 앱

Flutter로 제작된 간단한 기차 예매 시뮬레이션 앱입니다.  
출발역과 도착역을 선택하고, 좌석을 선택하여 예매를 완료하는 흐름으로 구성되어 있습니다.

## 🧩 주요 기능

- 출발역과 도착역 선택 (리스트 제공)
- 선택한 역 정보 표시
- 4열 × 20행 좌석 선택 UI
- 좌석 예매 확인 다이얼로그
- 선택 초기화 및 홈 이동 처리

---

## 🛠️ 사용 기술

- Flutter 3.29+
- Dart 3.3+
- Cupertino Dialog
- Navigator stack 관리
- Stateless/Stateful 위젯 구조

---

## 📁 디렉토리 구조

```
flutter_train_app/
├── lib/
│   ├── main.dart                   # 앱 시작점
│   ├── models/
│   │   └── station_type.dart       # 출발/도착 enum
│   ├── pages/
│   │   ├── homepage.dart           # 출발/도착 선택 페이지
│   │   ├── station_list_page.dart  # 역 리스트 페이지
│   │   └── seat_page.dart          # 좌석 선택 페이지
│   └── widgets/
│       └── seat_widget.dart        # 좌석 위젯 (미사용 중)
```

---

## ▶️ 실행 방법

1. Flutter SDK 설치 (3.29 이상 권장)
2. 프로젝트 디렉토리로 이동
3. 의존성 설치:

```bash
flutter pub get
```

4. 앱 실행:

```bash
flutter run
```

---

## ✅ 추가하면 좋은 기능

- `SeatWidget` 활용한 좌석 컴포넌트 분리 적용
- 상태 관리를 위한 Provider 또는 Riverpod 도입
- 예매 내역 저장 기능 추가
- 역 선택 시 최근 선택 기록 남기기

