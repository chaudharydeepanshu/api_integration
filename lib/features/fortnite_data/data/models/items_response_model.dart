import 'package:freezed_annotation/freezed_annotation.dart';

// Note: These below imports are code generated so if missing run generator.
part 'items_response_model.freezed.dart';
part 'items_response_model.g.dart';

/// Fortnite items response.
@freezed
class ItemsResponse with _$ItemsResponse {
  /// Private empty constructor required for getters and setters to work.
  const ItemsResponse._();

  /// Default constructor for the [ItemsResponse].
  const factory ItemsResponse({
    /// Result success of the response.
    @Default(false) bool result,

    /// List of items.
    @Default([]) List<Item> items,
  }) = _ItemsResponse;

  /// Creates an [ItemsResponse] instance from a JSON [Map].
  factory ItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemsResponseFromJson(json);
}

/// Fortnite item.
@freezed
class Item with _$Item {
  /// Private empty constructor required for getters and setters to work.
  const Item._();

  /// Default constructor for the [Item].
  const factory Item({
    /// Item ID.
    required String id,

    /// Item type.
    required dynamic type,

    /// Item name.
    required String name,

    /// Item description.
    required String description,

    /// Item rarity.
    required dynamic rarity,

    /// Item series.
    required dynamic series,

    /// Item price.
    required int price,

    /// Data on when the item was added.
    required dynamic added,

    /// Built-in emote data for the item.
    required dynamic builtInEmote,

    /// Does the item have copyrighted audio.
    @Default(false) bool copyrightedAudio,

    /// Is the item going to be released in the future.
    @Default(false) bool upcoming,

    /// Is the item reactive.
    @Default(false) bool reactive,

    /// Release date for the item.
    required dynamic releaseDate,

    /// Last appearance for the item.
    required dynamic lastAppearance,

    /// Interest for the item.
    required double interest,

    /// Icon URL for the item.
    required dynamic icon,

    /// Featured icon URL for the item.
    required dynamic featured,

    /// Background icon for the item.
    required dynamic bg,

    /// Full background icon for the item.
    required dynamic fullBg,

    /// Video hash for the item. https://youtube.com/watch?v=<hash>.
    required dynamic video,

    /// Audio data for the item.
    required dynamic audio,

    /// Gameplay tags of the item.
    @Default([]) List<dynamic> gameplayTags,

    /// API tags of the item.
    @Default([]) List<dynamic> apiTags,

    /// Battle pass data for the item if any.
    required dynamic battlepass,

    /// Item set data for the item.
    required dynamic itemSet,

    /// Shop history for the item.
    @Default([]) List<dynamic> shopHistory,

    /// Display assets render data for the item.
    required dynamic displayAssets,

    /// Styles data for the item.
    required dynamic styles,
  }) = _Item;

  /// Creates an [Item] instance from a JSON [Map].
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
