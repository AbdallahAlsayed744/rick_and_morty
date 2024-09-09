class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'] ?? 0,
      pages: json['pages'] ?? 0,
      next: json['next'] ?? '',
      prev: json['prev'] ?? '',
    );
  }
}