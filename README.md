# 💳 Checkout Feature

A modular UI component for handling the full checkout experience in a Flutter e-commerce app, including:

🧺 Order summary with totals  
💳 Multiple payment method support  
🌐 Localized checkout (Arabic PayPal)  
✅ Final confirmation with receipt

<p align="center">
  <img src="assets/screen_shots/Checkout_all_views.png" alt="Checkout Flow Overview" width="800"/>
</p>

---

## 🎨 Screens

🧾 My Cart: Displays order subtotal, shipping, and total with a "Complete Payment" button

<p align="center">
  <img src="assets/screen_shots/my_cart_view.png" alt="Cart Summary View" width="800"/>
</p>

💳 Payment Selection: Lets users choose between PayPal and Card with visual icons

<p align="center">
  <img src="assets/screen_shots/my_cart_ayment_method-selection.png" alt="Payment Method View" width="800"/>
</p>

🔐 Payment Gateway: A secure screen to enter card details or select saved methods (Test Mode enabled)

<p align="center">
  <img src="assets/screen_shots/stripe_payment_gateway.png" alt="Secure Gateway View" width="800"/>
</p>

🌍 PayPal Arabic: RTL PayPal screen with user info and card selection in Arabic

<p align="center">
  <img src="assets/screen_shots/payPal_checkout.png" alt="PayPal Arabic View" width="800"/>
</p>

✅ Confirmation: Final success view with transaction summary, green status, and barcode receipt

<p align="center">
  <img src="assets/screen_shots/thank_you_view.png" alt="Confirmation Screen" width="800"/>
</p>

---

## 🛠️ Tech Stack

📱 Frontend
- Framework: Flutter.
- State Management: Bloc. 

🌐 Integration
- Stripe / PayPal API (Test Mode Supported)

📦 Dependencies
- `flutter_credit_card` / `flutter_bloc` / `flutter_stripe` / `flutter_paypal_payment` / `dio` / `dartz` / `font_awesome_flutter` / `svg_flutter`

---

## 🏗️ Architecture
  - 🧩 MVVM pattern


