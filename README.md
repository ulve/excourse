# Excourse

A simple [Discourse API](https://www.discourse.org/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `excourse` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:excourse, "~> 0.1.0"}]
    end
    ```

  2. Ensure `excourse` is started before your application:

    ```elixir
    def application do
      [applications: [:excourse]]
    end
    ```

## Config

The following config must be set

``` elixir
config :excourse, api_key: "CHANGE ME"
config :excourse, api_username: "CHANGE ME"
config :excourse, discourse_url: "CHANGE ME" 
```


