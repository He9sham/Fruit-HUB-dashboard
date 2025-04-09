import 'package:commerce_hub_dashboard/features/order/data/models/order_models.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/order_product_model_.dart';
import 'package:commerce_hub_dashboard/features/order/data/models/shipping_model.dart';

OrderEntity getDummyOrder() {
  // Create a sample shipping address
  ShippingAddresEntity shippingAddress = ShippingAddresEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    floor: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProducteEntity> orderProducts = [
    OrderProducteEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 49.99,
      quantity: 2,
    ),
    OrderProducteEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 29.99,
      quantity: 1,
    ),
    OrderProducteEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );

  // Create and return the OrderModel
  return OrderEntity(
    orderProductModel: orderProducts,
    // orderID: '12345',
    totalPrice: totalPrice,
    // status: OrderStatusEnum.pending,
    uId: 'user123',
    shippingAddressModel: shippingAddress,
    // orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
}
