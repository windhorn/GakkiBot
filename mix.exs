defmodule GakiBot.Mixfile do
  use Mix.Project

  def project do
    [app: :gaki_bot,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :slack]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:slack, "~> 0.2.0"},
      {:websocket_client, git: "https://github.com/jeremyong/websocket_client.git"},
      {:httpoison, "~> 0.7.3"},
      {:floki, "~> 0.4.1"},
      {:poison, "~> 1.5"}
    ]
  end
end
