class StripeService {
  static const PUBLISHABLE_KEY =
      "pk_test_51IV3qALpruYNOz2gdkcdEaxnx9dIh508yQ93p6c5PODoKuStQKUgHUB5jUf4HyyPoFa3iA7g8B4yXOPzGdDi7lWK00s7M3DDXr";
  static const SECRET_KEY =
      "sk_test_51IV3qALpruYNOz2g5lD8lXpNoISBIn5d9jvhe5LjH6LDpjXSoBVNuKLe2k5EvyxllCJfE5ywYBoG2CaTkSzBoQ8P0098WfprsA";
  static const PAYMENT_METHOD_URL = "https://api.stripe.com/v1/payment_methods";
  static const CUSTOMERS_URL = "https://api.stripe.com/v1/customers";
  static const CHARGE_URL = "https://api.stripe.com/v1/charges";

  Map<String, String> headers = {
    'Authorization': "Bearer  $SECRET_KEY",
    "Content-Type": "application/x-www-form-urlencoded"
  };
}
