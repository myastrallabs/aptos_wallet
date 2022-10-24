import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :aptos_wallet, AptosWalletWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3vqSTVC69jT2XayBBAywda7E6Szxpum3w9vI4rdbgud/aVa5pAuHRGpAiHEx5+ii",
  server: false

# In test we don't send emails.
config :aptos_wallet, AptosWallet.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
