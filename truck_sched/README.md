# TruckSched

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

3. cmd + f to search for specific food truck attributes (app is for developers remember? 😉)

Project implementation details-

- Global separation of concerns for API business logic (truck_sched) and Phoenix LiveView (truck_browser): "Phoenix is not your application". Keep's our options open in the future for dynamic app scalability...

  - Different front ends for different users to interact with the API, concurrent backend applications like Datasync, Admin, etc.
  - Possibilities for different database repos to be called separately from the Phoenix 'front end'.

- truck_sched

  - Uses some layers of abstraction with the main function TruckSched.get_schedule to decouple the API and http logic from the main function.
  - Mox testing functionality with a built in expected behaviour for the API layer.
  - Two simple tests for TruckSched.get_schedule/0.
  - As the functionality and scope of the app increases, it is already easy and trivial to build on this structure for more testing with mocks, factories, etc.
  - mix_test_watch included in the deps for convenient TDD 🥰

- truck_browser
  - Straightforward, minimal code to take advantage of Phoenix's powerful built in front end capabilites. Use's truck_sched as a dependency.
  - One single live view- truck_info.ex calls and renders TruckSched.get_schedule(), no current need for other templates, LiveView components, or extraneous page controller logic. More front end and style complexity can be added in the future with React, Typescript, etc.

If I had more time + additional features to be added- - More robust error handling for the UI if the food truck API is down and cannot be fetched. - Implement more rigorous typespec testing with Hammox. - Pagination for the data, it's a very large wall of text. - A UX friendly search bar function. - A loading bar state for the brief pause of the data being called and rendered in the live view. - User profiles to save favorite food trucks, write comments, and interact with other users. - Ecto DB for said profile + user data. - Display user comments on LiveView page.
