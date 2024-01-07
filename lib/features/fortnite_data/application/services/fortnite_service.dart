import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/repositories/fortnite_api_repository.dart';

/// A service class responsible for managing the fortnite data.
class FortniteService {
  /// Creates an instance of [FortniteService].
  FortniteService(this._fortniteAPIRepository);

  final FortniteAPIRepository _fortniteAPIRepository;

  /// Get current challenges.
  Future<ChallengeResponse> getChallenges() {
    try {
      return _fortniteAPIRepository.getChallenges();
    } catch (e) {
      rethrow;
    }
  }

  /// Get current shop.
  Future<ShopResponse> getShop() {
    try {
      return _fortniteAPIRepository.getShop();
    } catch (e) {
      rethrow;
    }
  }
}
