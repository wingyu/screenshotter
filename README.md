# Screenshotter
A project to experiment with Elixir and OTP. Screenshotter takes a screenshot of a website and then uploads it to your S3 bucket (Just a learning exercise for Elixir)

## Set Up
1. Install dependencies with `mix deps.get`
2. Setup your `AWS_ACCESS_KEY_ID`, `AWS_REGION` & `AWS_SECRET_ACCESS_KEY` environment variables
3. Get PhantomJS running with `phantomjs --wd`
4. Configure your S3 bucket and path details in the config files

#### Running via mix
Run `iex -S mix` and then...
```
Screenshotter.sync_run("www.google.com") #fetches from a URL synchronously

Screenshotter.async_run("www.google.com") #fetch from a URL asynchronously

Screenshotter.bulk_run(["www.google.com","www.reddit.com"]) #fetch a list of URLs asynchronously
```

#### Running synchronously via script
1. Run `mix escript.build`
2. Run `./screenshotter <url> `.

Passing in `--h` or `--help` as the only arguments will return instructions
##### TODO: implement for #bulk_run

## Running Test
To run the default test suite, run `mix test`

To run tagged tests (tests that interact with API's or manipulate files)...
Run `mix test --only tagged_test` (replace `tagged_test` with the name of the tag)

Tests that communicate with the AWS API will requires your API key/secret to be set. Tests, such
as `fetch_screenshot` will require PhantomJS running
