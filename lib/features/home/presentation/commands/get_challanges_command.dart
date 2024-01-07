import 'package:api_integration/features/fortnite_data/application/services/fortnite_service.dart';
import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:api_integration/features/shared/presentation/snackbars/error_snackbar.dart';
import 'package:api_integration/utils/logger_util.dart';

/// A command class responsible for getting fortnite challenges.
class GetFortniteChallengesCommand {
  /// Creates an instance of [GetFortniteChallengesCommand].
  GetFortniteChallengesCommand(
    this._fortniteService,
    this._updateFortniteChallenges,
  );

  /// The fortnite service.
  final FortniteService _fortniteService;

  /// Callback function to update the fortnite challenges state provider.
  final void Function(ChallengeResponse) _updateFortniteChallenges;

  /// Runs the command.
  Future<void> run() async {
    try {
      ChallengeResponse challengeResponse =
          await _fortniteService.getChallenges();

      _updateFortniteChallenges.call(challengeResponse);
    } catch (e) {
      logger.e(e);
      showErrorSnackBar(
        text: "Encountered error while getting fortnite challenges.",
        subText: e.toString(),
      );
      rethrow;
    }
  }
}
