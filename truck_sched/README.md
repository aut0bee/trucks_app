Simple Elixir and Phoenix LiveView application that grabs the most up to date information on food trucks for hungry Bay Area developers.

Uses the API provided by DataSF - https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b

## Local usage-

1. Clone this repo.

2. In preferred terminal:

```
cd truck_sched
mix deps.get
mix test
cd ..
cd truck_browser
mix deps.get
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
