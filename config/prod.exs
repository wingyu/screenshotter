use Mix.Config

config :screenshotter, :fetcher, Screenshotter.Fetcher
config :screenshotter, :cleaner, Screenshotter.Cleaner
config :screenshotter, :ex_aws_client, Screenshotter.ExAwsClient

config :screenshotter, :screenshot_dir, "./screenshots"
