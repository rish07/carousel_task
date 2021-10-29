class SampleData {
  final String imageUrl;
  final String date;
  final int numberOfPeople;
  final List<Avatar> avatars;
  SampleData(
      {required this.imageUrl,
      required this.date,
      required this.avatars,
      required this.numberOfPeople});
}

class Avatar {
  final String imageUrl;

  Avatar({required this.imageUrl});
}
