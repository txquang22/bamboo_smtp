defmodule BambooSmtp.Mixfile do
  use Mix.Project

  @project_url "https://github.com/txquang22/bamboo_smtp"

  def project do
    [app: :bamboo_smtp,
     version: "1.5.0-rc.1",
     elixir: "~> 1.4.0",
     source_url: @project_url,
     homepage_url: @project_url,
     name: "Bamboo SMTP Adapter",
     description: "A Bamboo adapter for SMTP",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     package: package(),
     deps: deps(),
     docs: [main: "README", extras: ["README.md"]]]
  end

  def application do
    [applications: [:gen_smtp, :logger, :bamboo]]
  end

  defp deps do
    [
      {:bamboo, git: "https://github.com/thoughtbot/bamboo.git", override: true},
      {:credo, "~> 0.8.2", only: [:dev, :test]},
      {:earmark, ">= 1.0.3", only: :dev},
      {:ex_doc, "~> 0.16.2", only: :dev},
      {:excoveralls, "~> 0.7.1", only: :test},
      {:gen_smtp, "~> 0.12.0"},
      {:inch_ex, "~> 0.5.5", only: :docs}
    ]
  end

  defp package do
    [
      maintainers: ["Kevin Disneur", "Thomas Gautier"],
      licenses: ["MIT"],
      links: %{"GitHub" => @project_url}
    ]
  end
end
