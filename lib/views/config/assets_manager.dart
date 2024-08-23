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

  static const String defaultAudiosDirectory = "assets/audios";
  static const String defaultAudio = "default";
  static const AudioType defaultAudioType = AudioType.mp3;

  static String getAudio(
    String audio, {
    String directory = "audios",
    AudioType type = defaultAudioType,
  }) {
    if (audio.isEmpty) {
      return "$defaultAudiosDirectory/$defaultAudio.${defaultAudioType.name}";
    }
    return "$directory/$audio.${type.name}";
  }

  static String getAsset(
    String file, {
    required directory,
    String? type,
  }) {
    return "$directory/$file.${type ?? ""}";
  }
}

enum ImageType { png, svg }

enum AudioType { mp3 }
