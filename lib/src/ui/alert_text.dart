import 'package:flutter/material.dart';

enum AlertTextType {
  success, 
  warning,
  error,
  networkError
}

/// FIXME for `type == AlertTextType.networkError` add retry indicator
class AlertText extends StatelessWidget {

  final AlertTextType type;
  final Widget? icon;
  final String message;
  const AlertText({
    super.key,
    this.type = AlertTextType.error,
    this.icon,
    required this.message
  });

  @override
  Widget build(BuildContext context) {

    final Color color = _getColor(type);


    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        icon ?? Icon(_getIconData(type), color: color),

        const SizedBox(width: 4.0),

        Expanded(
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600
            ),
            child: Text(
              message,
            ),
          ),
        ),

      ],
    );
  }

  static Color _getColor(AlertTextType type) {
    switch(type) {
      case AlertTextType.success:
        return Colors.green;
      case AlertTextType.warning:
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  static IconData _getIconData(AlertTextType type) {
    switch(type) {
      case AlertTextType.success:
        return Icons.check_circle_outline;
      case AlertTextType.networkError:
        return Icons.wifi_off_rounded;
      default:
        return Icons.warning_amber_rounded;
    }
  }

}
