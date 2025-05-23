import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce_hub_dashboard/core/enums/order_enum.dart';
import 'package:commerce_hub_dashboard/features/order/domain/entity/order_entity.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/order_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItemWidget({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Price
            Row(
              children: [
                Text(
                  'Total Price: \$${orderEntity.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                // Order Status
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: orderEntity.status == OrderStatusEnum.pending
                        ? Colors.orange
                        : orderEntity.status == OrderStatusEnum.accepted
                            ? Colors.green
                            : orderEntity.status == OrderStatusEnum.delivered
                                ? Colors.blue
                                : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    orderEntity.status.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // User ID
            Text(
              'User Name: ${orderEntity.shippingAddressEntity.name}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Shipping Address
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              orderEntity.shippingAddressEntity.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),

            // Payment Method
            Text(
              'Payment Method: ${orderEntity.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Order Products
            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderEntity.orderProductEntity.length,
              itemBuilder: (context, index) {
                final product = orderEntity.orderProductEntity[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) => Skeletonizer(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            OrderActionButtons(orderEntity: orderEntity),
          ],
        ),
      ),
    );
  }
}
