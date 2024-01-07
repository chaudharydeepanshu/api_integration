import 'package:api_integration/features/fortnite_data/application/services/fortnite_service.dart';
import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';
import 'package:api_integration/features/shared/presentation/snackbars/error_snackbar.dart';
import 'package:api_integration/utils/logger_util.dart';

/// A command class responsible for getting fortnite shop.
class GetFortniteShopCommand {
  /// Creates an instance of [GetFortniteShopCommand].
  GetFortniteShopCommand(
    this._fortniteService,
    this._updateFortniteShop,
  );

  /// The fortnite service.
  final FortniteService _fortniteService;

  /// Callback function to update the fortnite shop state provider.
  final void Function(ShopResponse) _updateFortniteShop;

  /// Runs the command.
  Future<void> run() async {
    try {
      ShopResponse shopResponse = await _fortniteService.getShop();

      _updateFortniteShop.call(shopResponse);
    } catch (e) {
      logger.e(e);
      showErrorSnackBar(
        text: "Encountered error while getting fortnite shop.",
        subText: e.toString(),
      );
      rethrow;
    }
  }
}
