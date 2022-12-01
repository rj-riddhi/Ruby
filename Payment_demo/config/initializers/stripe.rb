Rails.configuration.stripe = {
    :publishable_key => 'pk_test_51LCb0XSF2uJlXq8l1SZMePmYuIgFPPhNp9dJ4AWthYJZ8pvWfrQBl8nkWPGKb09JudCkt2VyqhZ1aeXfF51oNLv700CXYagkC4',
    :secret_key      => 'sk_test_51LCb0XSF2uJlXq8l7gIvEqbwpcg6ZkM4P7Hnll5hG39TmJNIxdW59HkVTApOXQad94PXS4oklPZ9X7EItXhgyQ7t00r5plrrgu'
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]