import 'package:freezed_annotation/freezed_annotation.dart';

// Note: These below imports are code generated so if missing run generator.
part 'challenge_response_model.freezed.dart';
part 'challenge_response_model.g.dart';

/// A class representing the challenges.
@freezed
class ChallengeResponse with _$ChallengeResponse {
  /// Private empty constructor required for getters and setters to work.
  const ChallengeResponse._();

  /// Default constructor for the [ChallengeResponse].
  const factory ChallengeResponse({
    /// Result success of response.
    @Default(false) bool result,

    /// Season number for quest bundles.
    @Default(0) int season,

    /// Season number for quest bundles.
    @Default('en') String lang,

    /// list of quest bundles
    @Default([]) List<ChallengeBundle> bundles,
  }) = _ChallengeResponse;

  /// Creates an [ChallengeResponse] instance from a JSON [Map].
  factory ChallengeResponse.fromJson(Map<String, Object?> json) =>
      _$ChallengeResponseFromJson(json);
}

/// A class representing the challenges.
@freezed
class ChallengeBundle with _$ChallengeBundle {
  /// Private empty constructor required for getters and setters to work.
  const ChallengeBundle._();

  /// Default constructor for the [ChallengeBundle].
  const factory ChallengeBundle({
    /// Bundle id.
    required String id,

    /// Bundle name.
    required String name,

    /// Unlock type.
    required String unlockType,

    /// Tags.
    required List<dynamic> tags,

    /// API Tags.
    required List<dynamic> apiTags,

    /// Colors for the bundle.
    required dynamic colors,

    /// Images for quest bundle.
    required dynamic images,

    /// Rewards for the bundle.
    required List<dynamic> bundleRewards,

    /// List of challenges.
    @Default([]) List<Quest> quests,
  }) = _ChallengeBundle;

  /// Creates an [ChallengeBundle] instance from a JSON [Map].
  factory ChallengeBundle.fromJson(Map<String, Object?> json) =>
      _$ChallengeBundleFromJson(json);
}

/// A class representing the challenges.
@freezed
class Quest with _$Quest {
  /// Private empty constructor required for getters and setters to work.
  const Quest._();

  /// Default constructor for the [Quest].
  const factory Quest({
    /// Quest id.
    required String id,

    /// Quest name.
    required String name,

    /// Is the quest enabled.
    required bool enabled,

    /// Date when quest was enabled.
    required String enabledDate,

    /// Parent quest of the quest.
    required dynamic parentQuest,

    /// Total progress of the quest.
    required int progressTotal,

    /// NPC character of the quest.
    required dynamic tandemCharacter,

    /// Tags of the quest.
    required List<dynamic> tags,

    /// Reward object for quest.
    required dynamic reward,

    /// Map locations for the quest.
    required List<dynamic> locations,
  }) = _Quest;

  /// Creates an [Quest] instance from a JSON [Map].
  factory Quest.fromJson(Map<String, Object?> json) => _$QuestFromJson(json);
}
