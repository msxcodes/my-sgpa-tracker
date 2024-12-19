import 'package:flutter/material.dart';
import 'package:my_sgpa_tracker/pages/about-us/about-us.modal.dart';
import 'package:my_sgpa_tracker/pages/spg-dashboard/widgets/overview-card.dart';

class DashboardHeaderContent extends StatelessWidget {
  const DashboardHeaderContent({
    super.key,
    required this.sgpaValue,
    required this.totalSubjects,
    required this.totalCredits,
    required this.avgGrade,
  });

  final double sgpaValue;
  final int totalSubjects;
  final double totalCredits;
  final String avgGrade;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white70,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "SGPA Overview",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AboutUsModal(),
                    );
                  },
                ),
              ],
            ),
            Text(
              "SGPA : $sgpaValue",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OverViewCard(
                    title: "Total Subjects",
                    value: "$totalSubjects Subject",
                  ),
                  OverViewCard(
                    title: "Total Credits",
                    value: "$totalCredits Credit",
                  ),
                  OverViewCard(
                    title: "Average Grade",
                    value: "$avgGrade Grade",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}