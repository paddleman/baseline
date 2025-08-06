# Baseline

A Phoenix application created from the Baseline template.

## Getting Started

You can copy the <code> clone_and_rename.exs </code> file and run it (examples in the file). It will clone the repository and rename the application to whatever the user specifies.

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.setup`
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Configuration

This application was generated from the Baseline template. Key components include:

* **Authentication**: User registration, login, and session management
* **User Profiles**: Avatar uploads, profile editing with modal interface
* **Theming**: Custom DaisyUI theme with OKLCH color support
* **Styling**: Tailwind CSS with DaisyUI components
* **Database**: PostgreSQL with Ecto - includes dependency geo_postgis in mix file, and custom postrex type added. User will need to create a postgis extension in the database after the DB is created --- assuming you want spatial capabilities.
* **Mapping Library** The app is intended to be used with a JS mapping library (MapLibre, Leaflet, OpenLayer, etc) - however none is included.
* **Tidewave-AI Ready** Included is the tidewave-ai dependency and setup in the endpoint.ex file.

## Learn More

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix

## Template Source

This application was generated from the Potamoi template:
https://github.com/paddleman/potamoi

---

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).