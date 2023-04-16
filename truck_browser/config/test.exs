import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :truck_browser, TruckBrowserWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QE6gOrUlGyP32rGeYslpp1ZjiZb1tJdRB8cOD3oWc7V/8heXt7glBhvXHZ0Snxug",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
