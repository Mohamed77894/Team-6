# Talabat Auth & Products

Flutter task implementing a complete email authentication flow and the product
screens using feature-based Clean Architecture.

## User flow

1. Create an account with first name, last name, email, and a valid password.
2. The app calls `POST /api/auth/register`.
3. Only when that request succeeds does the app open the OTP screen. The API
   sends the OTP to the entered email address.
4. Verify the six-digit OTP through `POST /api/auth/verify-email`.
5. Log in through `POST /api/auth/login`; a successful response takes the user
   to the products screen.
6. Select a product to load its details from `GET /api/products/{id}`.

The verification screen also supports `POST /api/auth/resend-otp`.

## Email / OTP testing

Registration is a real request and creates an account, so use an email inbox
that you are allowed to receive mail in. Do not enter an important personal
email until the API and network connection have been checked. The UI does not
advance to OTP until the registration request succeeds; failures are shown in a
snackbar instead.

## Structure

Each feature is split into:

- `data`: API data sources, models, and repository implementations.
- `domain`: entities, repository contracts, and use cases.
- `presentation`: Cubits, states, widgets, and screens.

Shared network code and dependency injection live in `lib/core`. Routes are in
`lib/app`.

`get_it` registers the data sources, repositories, use cases, and Cubits.
Authentication and product states are Freezed unions; their generated
`*.freezed.dart` files are committed to the project.

## Run

```bash
flutter pub get
dart run build_runner build
flutter run
```

The app uses `https://accessories-eshop.runasp.net/api` as its API base URL.
