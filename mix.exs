defmodule NervesTime.RTC.NXP.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/nerves-time/nerves_time_rtc_nxp"

  def project do
    [
      app: :nerves_time_rtc_nxp,
      version: @version,
      elixir: "~> 1.11",
      description: description(),
      package: package(),
      source_url: @source_url,
      docs: docs(),
      dialyzer: [
        flags: [:unmatched_returns, :error_handling, :missing_return, :extra_return, :underspecs]
      ],
      deps: deps(),
      preferred_cli_env: %{
        docs: :docs,
        "hex.publish": :docs,
        "hex.build": :docs
      }
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:circuits_i2c, "~> 1.0"},
      {:nerves_time, "~> 0.4"},
      {:ex_doc, "~> 0.19", only: :docs, runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

  def description, do: "NervesTime.RTC implementations for common NXP chips"

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  def docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end
end
