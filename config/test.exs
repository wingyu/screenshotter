use Mix.Config

config :screenshotter, :fetcher, Screenshotter.FetcherMock
config :screenshotter, :ex_aws_client, Screenshotter.ExAwsClientMock

config :screenshotter, :screenshot_dir, "./test/screenshots"
