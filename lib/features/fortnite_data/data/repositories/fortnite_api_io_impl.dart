import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/item_sets_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/items_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/rarities_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/repositories/fortnite_api_repository.dart';
import 'package:dio/dio.dart';

/// A implementation class of [FortniteAPIRepository] for [fortniteapi.io] api.
class FortniteApiIoImpl implements FortniteAPIRepository {
  /// The base URL for the API.
  final String _apiURL = "https://fortniteapi.io";

  /// API key from [fortniteapi.io](https://dashboard.fortniteapi.io/)
  late String apiKey;

  /// Language to use for the api.
  /// Default is english.
  ///
  /// Supported languages: en, ar, de, es, es-419, fr, it, ja, ko, pl, pt-BR, ru, tr, zh-CN, zh-Hant
  late String language;

  /// Creates an instance of [FortniteApiIoImpl].
  FortniteApiIoImpl({
    required this.apiKey,
    this.language = "en",
  }) {
    [
      "en",
      "ar",
      "de",
      "es",
      "es-419",
      "fr",
      "it",
      "ja",
      "ko",
      "pl",
      "pt-BR",
      "ru",
      "tr",
      "zh-CN",
      "zh-Hant",
    ].contains(language)
        ? null
        : throw Exception("Language not supported");
  }

  /// Send a request to api.
  Future<dynamic> _send({
    String apiVersion = "v2",
    required String endpoint,
    List<String> query = const [],
    int retries = 0,
  }) async {
    query.add("lang=$language");
    final String url = "$_apiURL/$apiVersion/$endpoint?${query.join("&")}";

    try {
      Response res = await Dio().fetch(
        RequestOptions(
          method: "GET",
          path: url,
          headers: {
            "Authorization": apiKey,
          },
        ),
      );

      return res.data;
    } on DioException catch (e) {
      int statusCode = e.response?.statusCode ?? 0;

      if (statusCode.toString().startsWith("5")) {
        if (retries < 5) {
          await Future.delayed(
            const Duration(seconds: 5),
            () async {
              return await _send(
                apiVersion: apiVersion,
                endpoint: endpoint,
                query: query,
                retries: retries + 1,
              );
            },
          );
        } else {
          throw Exception("fortniteapi.io is currently down");
        }
      }

      throw Exception(e.response?.data ?? "Unknown error");
    }
  }

  /// Get current challenges.
  @override
  Future<ChallengeResponse> getChallenges({
    String season = "current",
  }) async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "challenges",
      query: ["season=$season"],
    );

    return ChallengeResponse.fromJson(data);
  }

  /// Get all items.
  @override
  Future<ItemsResponse> getItems() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/list",
      query: [],
    );

    return ItemsResponse.fromJson(data);
  }

  /// Get all upcoming items.
  @override
  Future<ItemsResponse> getUpcomingItems() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/upcoming",
      query: [],
    );

    return ItemsResponse.fromJson(data);
  }

  /// Get a specific item data.
  @override
  Future<Item> getItemData(String itemId) async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/get?id=$itemId",
      query: [],
    );

    return Item.fromJson(data["item"]);
  }

  /// Get all item sets.
  @override
  Future<ItemSetsResponse> getItemSets() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/sets",
      query: [],
    );

    return ItemSetsResponse.fromJson(data);
  }

  /// Get all rarities.
  @override
  Future<RaritiesResponse> getRarities() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "rarities",
      query: [],
    );

    return RaritiesResponse.fromJson(data);
  }

  /// Get current shop.
  @override
  Future<ShopResponse> getShop() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "shop",
      query: [],
    );

    return ShopResponse.fromJson(data);
  }
}
