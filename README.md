[![Build Status Travis](https://travis-ci.org/ulve/excourse.svg?branch=master)](https://travis-ci.org/ulve/excourse)
[![Build Status Circle](https://circleci.com/gh/ulve/excourse.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/ulve/excourse)


# Excourse

A simple [Discourse API](https://www.discourse.org/)

## Installation

  1. Add `excourse` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:excourse, git: "https://github.com/ulve/excourse.git"}]
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


