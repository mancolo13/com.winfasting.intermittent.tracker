import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});
  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  int _drank = 1850;
  final int _goal = 2500;

  @override
  Widget build(BuildContext context) {
    final progress = (_drank / _goal).clamp(0.0, 1.0);
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Hydration Log')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Electrolytes & Hydro', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Icon(Icons.water_drop, color: AppTheme.secondaryColor),
                  ],
                ),
                const SizedBox(height: 14),
                Text('$_drank / $_goal ml', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white12,
                  color: AppTheme.primaryColor,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _quickAdd('+250 ml', 250),
                    _quickAdd('+500 ml', 500),
                    _quickAdd('+750 ml', 750),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                _settingRow('Smart Hydration Reminders', true),
                const Divider(),
                _settingRow('Electrolyte Salt Alert', false),
                const Divider(),
                _settingRow('Sync Apple Health / Google Fit', true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickAdd(String label, int amount) {
    return OutlinedButton(
      onPressed: () => setState(() => _drank = (_drank + amount).clamp(0, 5000)),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: AppTheme.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }

  Widget _settingRow(String title, bool initialVal) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis)),
          Switch(
            value: initialVal,
            activeThumbColor: AppTheme.primaryColor,
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }
}

