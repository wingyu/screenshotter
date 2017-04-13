defmodule Screenshotter.CLI do

  @moduledoc """
    Handle the command line parsing and the dispatch to the functions
    initiate the Screenshotter
  """


  @doc """
    `argv` can be -h or --help, which returns :help.
    Otherwise it is a URL, the name of your S3 bucket, and
    the path to the directory in the bucket
  """

  def main(argv) do
    parse_args(argv)
    |> process
  end


  defp parse_args(argv) do
    parse = OptionParser.parse(
      argv,
      switches: [ help: :boolean],
      aliases: [ h: :help ]
    )

    case parse do
      { [ help: true ], _, _ }
        -> :help
      { _, [ url ], _ }
        -> url
      _
        -> :help
    end
  end

  defp process(:help) do
    IO.puts """
      usage: screenshotter <url> <bucket> </path/to/directory>
    """
  end

  defp process(url) do
    Screenshotter.Instructor.run(url)
  end
end
