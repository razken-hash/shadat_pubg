class AssetsManager {
  static const String defaultVectorsDirectory = "assets/vectors";
  static const String defaultVector = "default";
  static const ImageType defaultVectorType = ImageType.svg;

  static String getVector(
    String vector, {
    String directory = defaultVectorsDirectory,
    ImageType type = defaultVectorType,
  }) {
    if (vector.isEmpty) {
      return "$defaultVectorsDirectory/$defaultVector.${defaultVectorType.name}";
    }
    return "$directory/$vector.${type.name}";
  }

  static const String defaultImagesDirectory = "assets/images";
  static const String defaultImage = "default";
  static const ImageType defaultImageType = ImageType.png;

  static String getImage(
    String image, {
    String directory = defaultImagesDirectory,
    ImageType type = defaultImageType,
  }) {
    if (image.isEmpty) {
      return "$defaultImagesDirectory/$defaultImage.${defaultImageType.name}";
    }
    return "$directory/$image.${type.name}";
  }

  static String assetify(
    String file, {
    required directory,
    String? type,
  }) {
    return "$directory/$file.${type ?? ""}";
  }
}

enum ImageType { png, svg }
