import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final protocols = [
      {'name': '16:8 Intermittent', 'desc': 'The gold standard for daily energy and weight balance', 'hrs': '16h Fast • 8h Eat', 'diff': 'Popular'},
      {'name': '18:6 Accelerated', 'desc': 'Deeper autophagy and accelerated fat burning window', 'hrs': '18h Fast • 6h Eat', 'diff': 'Intermediate'},
      {'name': '20:4 Warrior Diet', 'desc': 'Single large nutrient-rich dinner protocol', 'hrs': '20h Fast • 4h Eat', 'diff': 'Advanced'},
      {'name': '24:0 OMAD Feast', 'desc': 'One full meal a day for cellular reset', 'hrs': '24h Fast • Once/week', 'diff': 'Hard'},
      {'name': '14:10 Gentle Reset', 'desc': 'Ideal for beginners and recovery phase', 'hrs': '14h Fast • 10h Eat', 'diff': 'Easy'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Win • Protocols')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: protocols.length,
        itemBuilder: (context, i) {
          final p = protocols[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(p['name']!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(p['diff']!, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(p['desc']!, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(p['hrs']!, style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w600, fontSize: 13)),
                    ElevatedButton(
                      onPressed: () => RoutingService.openRegistrationUrl(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Select'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

