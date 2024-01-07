import 'package:api_integration/features/fortnite_data/data/models/shop_response_model.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final ShopResponse shopResponse;

  const ShopCard({super.key, required this.shopResponse});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shop Updated: ${DateTime.parse(shopResponse.lastUpdate['date']).toLocal()}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Quest Bundles:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            if (shopResponse.shop.isNotEmpty)
              SizedBox(
                height: 400,
                child: ListView.separated(
                  cacheExtent: 10,
                  scrollDirection: Axis.horizontal,
                  itemCount: shopResponse.shop.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShopItemCard(item: shopResponse.shop[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8.0);
                  },
                ),
              )
            else
              Text(
                'No shop items available.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }
}

class ShopItemCard extends StatelessWidget {
  final dynamic item;

  const ShopItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item["displayName"]}'),
            const Text('Image:\n'),
            Image.network(
              item["displayAssets"][0]['url'],
              height: 300,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
