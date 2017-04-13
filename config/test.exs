use Mix.Config

config :screenshotter, :fetcher, Screenshotter.FetcherMock
config :screenshotter, :cleaner, Screenshotter.CleanerMock
config :screenshotter, :ex_aws_client, Screenshotter.ExAwsClientMock

config :screenshotter, :screenshot_dir, "./test/screenshots"
config :screenshotter, :bucket, "vwong-bucket"
config :screenshotter, :bucket_path, ""

config :screenshotter, :size, 2
config :screenshotter, :max_overflow, 1


