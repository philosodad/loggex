defmodule Loggex.Mixfile do
  use Mix.Project

  def project do
    [app: :loggex,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :plug, :postgrex, :ecto, :httpoison, :elixometer]]
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
      {:httpoison, "~> 0.8.0"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:exjsx, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 1.1.2"},
      {:hackney, ~r/.*/, [git: "git://github.com/benoitc/hackney.git", branch: "master", manager: :rebar, override: true]},
      {:elixometer, github: "atlantaelixir/elixometer", override: true},
      {:uuid, "~> 0.1.1"},
      {:excoveralls, "~> 0.4", only: :test}
    ]
  end
end
