use Mix.Config

config :screenshotter, :fetcher, Screenshotter.Fetcher
config :screenshotter, :cleaner, Screenshotter.Cleaner
config :screenshotter, :ex_aws_client, Screenshotter.ExAwsClient

config :screenshotter, :screenshot_dir, "./screenshots"
config :screenshotter, :bucket, "vwong-bucket"
config :screenshotter, :bucket_path, ""

config :screenshotter, :size, 5
config :screenshotter, :max_overflow, 2

