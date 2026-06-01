import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  const FormRow({
    super.key,
    required this.label,
    required this.child,
    this.isRequired = false,
  });

  final String label;
  final Widget child;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                if (isRequired)
                  const Text(
                    ' *',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(child: SizedBox(height: 44, child: child)),
        ],
      ),
    );
  }
}
