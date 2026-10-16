import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  bool _fasting = true;
  int _elapsedHours = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Fast Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bolt, color: AppTheme.primaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryColor.withValues(alpha: 0.25), AppTheme.surfaceColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.35)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _fasting ? 'FASTING ACTIVE' : 'EATING WINDOW',
                        style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                    const Text('Protocol: 16:8', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: CircularProgressIndicator(
                        value: _fasting ? 0.88 : 0.25,
                        strokeWidth: 12,
                        backgroundColor: Colors.white12,
                        color: AppTheme.primaryColor,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$_elapsedHours:35', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900)),
                        const Text('ELAPSED', style: TextStyle(fontSize: 11, color: Colors.white60, letterSpacing: 1.2)),
                        const SizedBox(height: 4),
                        const Text('1h 25m left', style: TextStyle(color: AppTheme.secondaryColor, fontSize: 13, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Current Stage: Autophagy & Peak Fat Burn',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () => setState(() => _fasting = !_fasting),
                  icon: Icon(_fasting ? Icons.stop_circle_outlined : Icons.play_circle_fill),
                  label: Text(_fasting ? 'End Fast' : 'Start Fast'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _fasting ? Colors.white12 : AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 46),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _metricBox('Streak', '12 Days', Icons.local_fire_department, AppTheme.primaryColor)),
              const SizedBox(width: 12),
              Expanded(child: _metricBox('Target', '16h 00m', Icons.flag_rounded, AppTheme.secondaryColor)),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Metabolic Milestones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _stageTile('Blood Sugar Stabilized', 'Completed at 4h', Icons.check_circle, true),
          _stageTile('Fat Burning Peak', 'Completed at 12h', Icons.check_circle, true),
          _stageTile('Autophagy Regeneration', 'Active now (14h+)', Icons.hourglass_top_rounded, true),
          _stageTile('Deep Ketosis Peak', 'Unlocks at 18h', Icons.lock_outline, false),
        ],
      ),
    );
  }

  Widget _metricBox(String label, String value, IconData icon, Color col) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: col, size: 24),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
          FittedBox(fit: BoxFit.scaleDown, alignment: Alignment.centerLeft, child: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _stageTile(String title, String subtitle, IconData icon, bool active) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: active ? AppTheme.primaryColor.withValues(alpha: 0.25) : Colors.transparent),
      ),
      child: Row(
        children: [
          Icon(icon, color: active ? AppTheme.primaryColor : Colors.white38, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(subtitle, style: const TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

