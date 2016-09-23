# Screenshotter
##WORK IN PROGRESS
**TODO: Add description**
* Put behind HTTP server
* OTP-ify
* Delete file when finished uploading
* Use pipes more in Instructor? use pattern matting to deal with the tuples? or put uploader into fetcher?
* Clean up tests
* Clean up README
* Monitoring
*Crop image?

## Usage
Set AWS env vars
Must have PhantomJS running
```
phantomjs --wd
```

## Running Test

Must have AWS and phantom js running 
when doing direct API stuff..
to include Fetcer test

mix test --include fetch_image

Or run only the tagged tests:

mix test --only fetch_image

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

