import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle filter action here
      },
      child: Row(
        children: [
          Icon(Icons.filter),
          const SizedBox(width: 10),
          Text(
            'Filter',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
