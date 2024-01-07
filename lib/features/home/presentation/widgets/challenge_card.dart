import 'package:api_integration/features/fortnite_data/data/models/challenge_response_model.dart';
import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengeResponse challengeResponse;

  const ChallengeCard({super.key, required this.challengeResponse});

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
              'Season ${challengeResponse.season}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Quest Bundles:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            if (challengeResponse.bundles.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: challengeResponse.bundles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChallengeBundleCard(
                        bundle: challengeResponse.bundles[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8.0);
                  },
                ),
              )
            else
              Text(
                'No quest bundles available.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }
}

class ChallengeBundleCard extends StatelessWidget {
  final ChallengeBundle bundle;

  const ChallengeBundleCard({super.key, required this.bundle});

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
            Text('Name: ${bundle.name}'),
            Text('Id: ${bundle.id}'),
          ],
        ),
      ),
    );
  }
}
