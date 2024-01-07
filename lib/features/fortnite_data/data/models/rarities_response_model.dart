import 'package:freezed_annotation/freezed_annotation.dart';

// Note: These below imports are code generated so if missing run generator.
part 'rarities_response_model.freezed.dart';
part 'rarities_response_model.g.dart';

/// Fortnite rarities response.
@freezed
class RaritiesResponse with _$RaritiesResponse {
  /// Private empty constructor required for getters and setters to work.
  const RaritiesResponse._();

  /// Default constructor for the [RaritiesResponse].
  const factory RaritiesResponse({
    /// Result success of the response.
    @Default(false) bool result,

    /// Response language.
    @Default('en') String lang,

    /// List of rarities.
    @Default([]) List<Rarity> rarities,
  }) = _RaritiesResponse;

  /// Creates an [RaritiesResponse] instance from a JSON [Map].
  factory RaritiesResponse.fromJson(Map<String, dynamic> json) =>
      _$RaritiesResponseFromJson(json);
}

/// Fortnite rarity.
@freezed
class Rarity with _$Rarity {
  /// Private empty constructor required for getters and setters to work.
  const Rarity._();

  /// Default constructor for the [Rarity].
  const factory Rarity({
    /// ID of the rarity.
    required String id,

    /// Name of the rarity.
    required String name,

    /// Translation ID of the rarity.
    required dynamic translationID,

    /// Colors object of the rarity.
    required Map colors,

    /// Image of the rarity.
    required dynamic image,
  }) = _Rarity;

  /// Creates a [Rarity] instance from a JSON [Map].
  factory Rarity.fromJson(Map<String, dynamic> json) => _$RarityFromJson(json);
}
