import 'dart:developer' as dev;

import 'package:cached_network_image_platform_interface/nsg_image_item.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NsgImageCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'nsgImageCacheManager';

  static final NsgImageCacheManager _instance = NsgImageCacheManager._();

  factory NsgImageCacheManager() {
    return _instance;
  }

  NsgImageCacheManager._() : super(Config(key));

  Stream<FileResponse> getFileStreamUsingDataItem(NsgImageItem image,
      {String? key, Map<String, String>? headers, bool withProgress = false}) {
    final url = image.globalFilePath(ImageSize.large);

    final newUrl = url;

    if (newUrl != url) {
      dev.log('🔄 Подмена ссылки для кэша:');
      dev.log('  оригинал: $url');
      dev.log('  заменён:  $newUrl');
    }

    return getFileStream(newUrl,
        key: key, headers: headers, withProgress: withProgress);
  }

  Stream<FileResponse> getImageFileUsingDataItem(NsgImageItem image,
      {String? key, Map<String, String>? headers, bool withProgress = false}) {
    final url = image.globalFilePath(ImageSize.large);

    final newUrl = url;

    if (newUrl != url) {
      dev.log('🔄 Подмена ссылки для кэша:');
      dev.log('  оригинал: $url');
      dev.log('  заменён:  $newUrl');
    }

    return getImageFile(newUrl,
        key: key, headers: headers, withProgress: withProgress);
  }

  @override
  Stream<FileResponse> getImageFile(String url,
      {String? key,
      Map<String, String>? headers,
      bool withProgress = false,
      int? maxHeight,
      int? maxWidth}) {
    final newUrl = url;

    if (newUrl != url) {
      dev.log('🔄 Подмена ссылки для кэша:');
      dev.log('  оригинал: $url');
      dev.log('  заменён:  $newUrl');
    }

    return super.getImageFile(newUrl,
        key: key,
        headers: headers,
        withProgress: withProgress,
        maxHeight: maxHeight,
        maxWidth: maxWidth);
  }

  @override
  Stream<FileResponse> getFileStream(String url,
      {String? key, Map<String, String>? headers, bool withProgress = false}) {
    final newUrl = url;

    if (newUrl != url) {
      dev.log('🔄 Подмена ссылки для кэша:');
      dev.log('  оригинал: $url');
      dev.log('  заменён:  $newUrl');
    }

    return super.getFileStream(newUrl,
        key: key, headers: headers, withProgress: withProgress);
  }
}
