import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';
import 'package:api_integration/features/home/presentation/states/home_state.dart';
import 'package:api_integration/features/home/presentation/widgets/challenge_card.dart';
import 'package:api_integration/features/home/presentation/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ChallengeResponse? challengeResponse;
  ShopResponse? shopResponse;

  Future<void> getChallenges() async {
    await ref.read(getFortniteChallengesCommandStateProvider).run();
    challengeResponse = ref.watch(fortniteChallengesStateProvider);
  }

  Future<void> getShop() async {
    await ref.read(getFortniteShopCommandStateProvider).run();
    shopResponse = ref.watch(fortniteShopStateProvider);
  }

  // Future for loading data
  Future<void> _loadData() async {
    await Future.wait([
      getChallenges(),
      getShop(),
    ]);
  }

  late Future loadDataFuture;

  @override
  void initState() {
    loadDataFuture = _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadDataFuture,
      builder: (context, snapshot) {
        ConnectionState connectionState = snapshot.connectionState;
        if (connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error in loading data'),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        loadDataFuture = _loadData();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (shopResponse != null) ...[
                  Text(
                    'Shop 🛒',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  ShopCard(
                    shopResponse: shopResponse!,
                  ),
                  const SizedBox(height: 8),
                ],
                if (challengeResponse != null) ...[
                  Text(
                    'Challenges 💡',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  ChallengeCard(
                    challengeResponse: challengeResponse!,
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  '~~ Fortnite API Test ~~',
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
