import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/item_sets_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/items_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/rarities_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';

/// Interface for fortnite API repository.
abstract class FortniteAPIRepository {
  /// Get current challenges.
  Future<ChallengeResponse> getChallenges();

  /// Get all items.
  Future<ItemsResponse> getItems();

  /// Get all upcoming items.
  Future<ItemsResponse> getUpcomingItems();

  /// Get a specific item data.
  Future<Item> getItemData(String itemId);

  /// Get all item sets.
  Future<ItemSetsResponse> getItemSets();

  /// Get all rarities.
  Future<RaritiesResponse> getRarities();

  /// Get current shop.
  Future<ShopResponse> getShop();
}
