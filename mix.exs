defmodule Screenshotter.Mixfile do
  use Mix.Project

  def project do
    [
      app: :screenshotter,
      version: "0.1.1",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      escript: escript_config(),
      start_permanent: Mix.env == :prod,
      description: "A application that takes a screenshot of a website then uploads it into S3",
      docs: [extras: ["README.md"]],
      deps: deps(),
      package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :hound,:ex_aws, :hackney, :poison, :logger],
     #mod: {Screenshotter, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:hound, "~> 1.0"},
      {:ex_aws, "~> 1.0.0-beta0"},
      {:poison, "~> 2.0"},
      {:hackney, "~> 1.6"},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp escript_config do
    [ main_module: Screenshotter.CLI ]
  end

  defp package do
    [
      files: ["lib", "mix.exs"],
      maintainers: ["Vincent Wong"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/wingyu/screenshotter"}
    ]
  end
end
