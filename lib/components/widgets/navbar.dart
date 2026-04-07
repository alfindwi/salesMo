import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:hugeicons/styles/stroke_rounded.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;

    int currentIndex = 0;
    if (location.startsWith('/dashboard')) currentIndex = 0;
    if (location.startsWith('/stats')) currentIndex = 1;
    if (location.startsWith('/split-bill')) currentIndex = 2;
    if (location.startsWith('/history')) currentIndex = 3;
    if (location.startsWith('/profile')) currentIndex = 4;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10),
              BoxShadow(blurRadius: 3, offset: const Offset(0, 1)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(
                context,
                HugeIconsStrokeRounded.home07,
                0,
                currentIndex,
                "HOME",
                '/dashboard',
              ),
              _buildItem(
                context,
                HugeIconsStrokeRounded.chart01,
                1,
                currentIndex,
                'STATS',
                '/stats',
              ),

              const SizedBox(width: 40),
              _buildItem(
                context,
                HugeIconsStrokeRounded.note01,
                3,
                currentIndex,
                "HISTORY",
                '/history',
              ),
              _buildItem(
                context,
                HugeIconsStrokeRounded.user03,
                4,
                currentIndex,
                "PROFILE",
                '/profile',
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 35,
          child: GestureDetector(
            onTap: () => context.push('/split-bill'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5BAE1B),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: HugeIcon(
                    icon: HugeIconsStrokeRounded.qrCode01,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "SPLIT",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF5BAE1B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(
    BuildContext context,
    dynamic icon,
    int index,
    int currentIndex,
    String text,
    String route,
  ) {
    final isActive = index == currentIndex;
    final isQr = index == 2;

    return GestureDetector(
      onTap: () => context.go(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(isQr ? 14 : 10),
            decoration: BoxDecoration(
              color: isQr
                  ? const Color(0xFF5BAE1B)
                  : isActive
                  ? const Color(0xFF5BAE1B)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              boxShadow: isQr
                  ? [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            transform: isQr
                ? Matrix4.translationValues(0, -10, 0)
                : Matrix4.identity(),
            child: HugeIcon(
              icon: icon,
              size: isQr ? 30 : 22,
              color: isQr
                  ? Colors.white
                  : isActive
                  ? Colors.white
                  : Colors.black54,
            ),
          ),

          if (!isQr) ...[
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: 11,
                color: isActive ? const Color(0xFF5BAE1B) : Colors.black54,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
