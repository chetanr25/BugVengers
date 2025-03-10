class ImageMetadata {
  final double? latitude;
  final double? longitude;
  final String? dateTime;
  final Map<String, dynamic> deviceInfo;
  final Map<String, dynamic> photoInfo;
  final Map<String, dynamic> allMetadata;
  final String path;

  ImageMetadata({
    this.latitude,
    this.longitude,
    this.dateTime,
    required this.deviceInfo,
    required this.photoInfo,
    required this.allMetadata,
    required this.path,
  });

  factory ImageMetadata.fromJson(
    Map<String, dynamic> json, {
    required String path,
  }) {
    final exif = json['exif'] as Map<String, dynamic>;
    return ImageMetadata(
      latitude: exif['gps']?['latitude'] as double?,
      longitude: exif['gps']?['longitude'] as double?,
      dateTime: exif['photo']?['DateTimeOriginal'] as String?,
      deviceInfo: exif['device'] as Map<String, dynamic>,
      photoInfo: exif['photo'] as Map<String, dynamic>,
      allMetadata: json,
      path: path,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'dateTime': dateTime,
      'deviceInfo': deviceInfo,
      'photoInfo': photoInfo,
      'allMetadata': allMetadata,
      'path': path,
    };
  }
}
