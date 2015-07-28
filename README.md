# Figaro Elixir

[![Build Status](https://travis-ci.org/KamilLelonek/figaro-elixir.svg)](https://travis-ci.org/KamilLelonek/figaro-elixir)

This project is based on [figaro gem](https://github.com/laserlemon/figaro) for Rails written by [Steve Richert](https://twitter.com/laserlemon).

It's was created to manage `ENV` configuration for `Elixir` applications.

## How does it work?

Figaro parses a git-ignored `YAML` file in your application and loads its values into environmental variables.

This is very handy for production environments when you don't want to store some of credentials in your repository.

## Installation

Add Figaro Elixir as a dependency in your `mix.exs` file.

```elixir
defp deps do
  [
  	 # ...
    { :figaro_elixir, "~> 0.0.1" }
  ]
end
```

You should also update your applications list to include Figaro:

```elixir
def application do
  [
  	 applications: [
  	   # ...
  	   :figaro_elixir
  	 ]
  ]
end
```

Once you've done that, run `mix deps.get` in your command line to fetch the dependency.

## Usage

The basic requirement is to have `application.yml` file in your project `config` directory.

`Figaro` will read it, parse it and use it to store environmental variables.

Please note that `ENV` is a simple key/value store with the following features:

  - all values are converted to strings
  - deeply nested configuration structures are not possible

### Simple example

You can very easily start using `Figaro` for `Elixir`. Just create an appropriate file:


```yaml
# config/application.yml

foo: bar
baz: qux
```

And run `iex -S mix` in your terminal. You will have an access to configuration values via `FigaroElixir.env` or `System` environmental variables:

```elixir
iex(1)> FigaroElixir.env
%{"baz" => "qux", "foo" => "bar"}
iex(2)> FigaroElixir.env["baz"]
"qux"
iex(3)> System.get_env("foo")
nil
iex(4)> System.get_env("FOO")
"bar"
```

**Keep in mind that system environmental variables keys are uppercased.**

### Environment-specific configuration

The power of `Figaro` elixir comes from distinguishing environments based on `Mix.env` property.

You may have a file defined like this:

```elixir
a: a
b: ~

test:
  c: 1
  d: ~
```

And then after running `MIX_ENV=test iex -S mix` you will see:

```elixir
iex(1)> FigaroElixir.env
%{"a" => "a", "b" => "~", "c" => "1", "d" => "~"}
iex(2)> FigaroElixir.env["c"]
"1"
iex(3)> System.get_env("C")
"1"
```

That's it. You don't have to do anything more.

#### Caveats

If you are using [`escript`](http://elixir-lang.org/docs/master/mix/Mix.Tasks.Escript.Build.html) build tool, you need to have `:mix` among your `apps` in `mix.exs` file and copy `application.yml` file to your `rel/project_name/config` directory.

## About the author

My name is Kamil Lelonek, I'm a full-stack developer and polyglot programmer. I love playing with different languages, technologies and tools. You can visit [my website](http://kamil.lelonek.me/) read [my blog](https://medium.com/@KamilLelonek) or follow me on [twitter](https://twitter.com/KamilLelonek). In case of any problems or suggestions do not hesitate and create a pull request.
