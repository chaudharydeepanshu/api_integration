import 'package:freezed_annotation/freezed_annotation.dart';

// Note: These below imports are code generated so if missing run generator.
part 'shop_response_model.freezed.dart';
part 'shop_response_model.g.dart';

/// A class representing the item shop.
@freezed
class ShopResponse with _$ShopResponse {
  /// Private empty constructor required for getters and setters to work.
  const ShopResponse._();

  /// Default constructor for the [ShopResponse].
  const factory ShopResponse({
    /// Result of shop response.
    @Default(false) bool result,

    /// Is it full shop.
    @Default(false) bool fullShop,

    /// When did shop last updated.
    required dynamic lastUpdate,

    /// Current rotations.
    required dynamic currentRotation,

    /// Current rotations.
    required dynamic nextRotation,

    /// Carousel of shop.
    required dynamic carousel,

    /// Item shop video.
    required dynamic specialOfferVideo,

    /// Item shop.
    required List<dynamic> shop,
  }) = _ShopResponse;

  /// Creates an [ShopResponse] instance from a JSON [Map].
  factory ShopResponse.fromJson(Map<String, Object?> json) =>
      _$ShopResponseFromJson(json);
}
