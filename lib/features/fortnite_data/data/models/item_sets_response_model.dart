import 'package:freezed_annotation/freezed_annotation.dart';

// Note: These below imports are code generated so if missing run generator.
part 'item_sets_response_model.freezed.dart';
part 'item_sets_response_model.g.dart';

/// Item sets response.
@freezed
class ItemSetsResponse with _$ItemSetsResponse {
  /// Private empty constructor required for getters and setters to work.
  const ItemSetsResponse._();

  /// Default constructor for the [ItemSetsResponse].
  const factory ItemSetsResponse({
    /// Result success of the response.
    @Default(false) bool result,

    /// Language of the response.
    @Default('en') String lang,

    /// Item sets.
    @Default([]) List<ItemSet> sets,
  }) = _ItemSetsResponse;

  /// Creates an [ItemSetsResponse] instance from a JSON [Map].
  factory ItemSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemSetsResponseFromJson(json);
}

/// Fortnite item set.
@freezed
class ItemSet with _$ItemSet {
  /// Private empty constructor required for getters and setters to work.
  const ItemSet._();

  /// Default constructor for the [ItemSet].
  const factory ItemSet({
    /// Item set id.
    required String id,

    /// Item set name.
    required String name,
  }) = _ItemSet;

  /// Creates an [ItemSet] instance from a JSON [Map].
  factory ItemSet.fromJson(Map<String, dynamic> json) =>
      _$ItemSetFromJson(json);
}
