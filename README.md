# Arriada Group Electronic E-Commerce Flutter App

This is an electronic e-commerce app built using Flutter. It allows users to browse and purchase electronic products from various categories.
By :
-Ayah Abdalmagied 
-ibtihal mohamed 

```
-Benghazi LATI Mobile App Camp
```

## Features

- User authentication (login and registration)
- Browse products by category
- Search for products
- Add products to cart
- Add products to Favorite
- Checkout and payment using T-Link Api

## Getting Started

To get started with this app, you will need to have Flutter installed on your machine. You can follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install) to install it.

Once you have Flutter installed, you can clone this repository by running the following command:

```
git clone https://github.com/ibtihalmohamed/ag-group.git
```

After cloning the repository, navigate to the project directory and run the following command to install all dependencies:

```
flutter pub get
```

## Code Details

The app is divided into several screens, each of which is implemented as a separate widget. The main screens are:

- `AuthScreens`: Displays the authentication screens for the app.
- `HomeScreen`: Displays a list of product categories.
- `CategoryScreen`: Displays a list of products in a particular category.
- `DetailesScreen`: Displays details about a particular product.
- `CartScreen`: Displays items in the user's cart and allows them to checkout.
- `PaymentScreen`: Allows users to enter their shipping information and complete their purchase.
- `ProfileScreen`: Displays the user's personal information .

The app uses the `provider` package to manage state. The `Cart` and `Favorite` classes are implemented as `ChangeNotifier` classes, which allows them to notify listeners when their state changes.

The app also uses the `http` package to make API requests to the backend server. The API endpoints are defined in the `api_service.dart` file, besides that it uses firebase as a backend server for the user authentication process.

## Contributing

If you would like to contribute to this project, feel free to submit a pull request. Before doing so, please ensure that your code follows the existing code style and that all tests pass.

## Contact

If you have any questions or concerns about this project, please contact us at [Ayahorieth@gmail.com || ibtihalmohamed1997@gmail.com].

![alt text](https://github.com/ibtihalmohamed/ag-group/blob/main/Splash.png)
![alt text](https://github.com/ibtihalmohamed/ag-group/blob/main/Onboarding.png)
![alt text](https://github.com/ibtihalmohamed/ag-group/blob/main/Auth.png)

## License



For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
