import 'package:api_integration/constants/fortnite_api_constants.dart';
import 'package:api_integration/features/fortnite_data/application/services/fortnite_service.dart';
import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/repositories/fortnite_api_io_impl.dart';
import 'package:api_integration/features/home/presentation/commands/get_challanges_command.dart';
import 'package:api_integration/features/home/presentation/commands/get_shop_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Note: These below imports are code generated so if missing run generator.
part 'home_state.g.dart';

FortniteService fortniteService() => FortniteService(
      FortniteApiIoImpl(apiKey: FortniteAPIConstants.apiKey),
    );

/// This class is used to manage the state of the fortnite challenges.
@riverpod
class FortniteChallengesState extends _$FortniteChallengesState {
  @override
  ChallengeResponse? build() {
    return null;
  }
}

/// A class representing the state of the [GetFortniteChallengesCommandState] command.
@riverpod
class GetFortniteChallengesCommandState
    extends _$GetFortniteChallengesCommandState {
  @override
  GetFortniteChallengesCommand build() {
    return GetFortniteChallengesCommand(
      fortniteService(),
      (ChallengeResponse value) {
        ref.read(fortniteChallengesStateProvider.notifier).state = value;
      },
    );
  }
}

/// This class is used to manage the state of the fortnite shop.
@riverpod
class FortniteShopState extends _$FortniteShopState {
  @override
  ShopResponse? build() {
    return null;
  }
}

/// A class representing the state of the [GetFortniteShopCommandState] command.
@riverpod
class GetFortniteShopCommandState extends _$GetFortniteShopCommandState {
  @override
  GetFortniteShopCommand build() {
    return GetFortniteShopCommand(
      fortniteService(),
      (ShopResponse value) {
        ref.read(fortniteShopStateProvider.notifier).state = value;
      },
    );
  }
}
