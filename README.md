# Baseline

This is a starter [Phoenix](https://www.phoenixframework.org/) [live_view](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html) application that includes style authenciation and authorizations.

The app also includes [TailwindCss](https://tailwindcss.com/) and the opensource version of [petal_components](https://petal.build/components) (opting not to use AlpineJS).

Need to have ImageMagick installed on your machine for image uploads (i.e. the avatar). Application uses [mongrify](https://hexdocs.pm/mogrify/readme.html) library.

This application is meant to be a baseline, to be renamed as a new application.

Authentication part leaned heavily on the excellent Blog Series by Anthony Gonzalez - [Let's Build an Instagram Clone with PETAL](https://elixirprogrammer.com/learn/lets-build-an-instagram-clone-with-the-petal-phoenix-elixir-tailwindcss-alpinejs-liveview-stack/), albeit I updated it for newer versions of Phoenix/live_view and tailwind --- and I use the new [Phoenix.LiveView.JS](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.JS.html) functionality instead of AlpineJS.

## Warning:  YMMV.


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
