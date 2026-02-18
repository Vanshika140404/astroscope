class Apod {
  final String title;
  final String date;
  final String url;
  final String? hdurl;
  final String mediaType;
  final String explanation;
  final String? thumbnailUrl;
  final String? copyright;
  final String serviceVersion;

  const Apod({
    required this.title,
    required this.date,
    required this.url,
    required this.mediaType,
    required this.explanation,
    required this.serviceVersion,
    this.hdurl,
    this.thumbnailUrl,
    this.copyright,
  });

  factory Apod.fromJson(Map<String, dynamic> json) {
    return Apod(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      url: json['url'] ?? '',
      hdurl: json['hdurl'],
      mediaType: json['media_type'] ?? '',
      explanation: json['explanation'] ?? '',
      thumbnailUrl: json['thumbnail_url'],
      copyright: json['copyright'],
      serviceVersion: json['service_version'] ?? '',
    );
  }
}
