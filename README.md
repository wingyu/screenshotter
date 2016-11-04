# Screenshotter
A simple app that takes a screenshot of a website and then uploads it to your S3 bucket

##TODOs:
* OTP-ify
* Make executable?

## Usage
1. Install dependencies with `mix deps.get`
2. Setup your `AWS_KEY`, `AWS_REGION` & `AWS_SECRET` environment variables
3. Get PhantomJS running with `phantomjs --wd`
4. Run `iex -S mix`
5. Enter `Screenshotter.Instructor.run(url, bucket, dir_in_bucket)`

## Running Test
To run the default test suite, run `mix test`

To run tagged tests (tests that interact with API's or manipulate files)...
Run `mix test --only tagged_test` (replace `tagged_test` with the name of the tag)

Tests that communicate with the AWS API will requires your API key/secret to be set. Tests, such
as `fetch_screenshot` will require PhantomJS running

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `screenshotter` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:screenshotter, "~> 0.1.0"}]
    end
    ```

  2. Ensure `screenshotter` is started before your application:

    ```elixir
    def application do
      [applications: [:screenshotter]]
    end
    ```

