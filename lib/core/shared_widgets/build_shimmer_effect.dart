
import '../../../../../main_importants.dart';

class BuildShimmerEffect extends StatelessWidget {
  const BuildShimmerEffect({super.key,
    required this.listCount,
    this.scrollDirection = Axis.vertical,
  });
  final int listCount;
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 200,
                height: 16,
                color: Colors.white,
              ),
              const SizedBox(height: 4),
              Container(
                width: 150,
                height: 14,
                color: Colors.white,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
        itemCount: listCount,
      ),
    );
  }
}
