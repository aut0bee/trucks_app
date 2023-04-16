defmodule TruckBrowserWeb.TruckInfo do
  use TruckBrowserWeb, :live_view

  require Logger

  def mount(_params, _session, socket) do
    send(self(), :get_data)
    {:ok, assign(socket, data: [])}
  end

  def handle_info(:get_data, socket) do
    data = TruckSched.get_schedule()
    {:noreply, assign(socket, :data, data)}
  end

  def render(assigns) do
    ~L"""
    <div phx-update="log">
    <center>
    <h1> Current Bay Area Food Trucks</h1>
    </center>
    <table>
    <thead>
      <tr>
        <th>Truck</th>
        <th>Locations</th>
        <th>Day of Week</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>What's Good?</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <%= for data <- assigns[:data] do %>
        <tr>
          <td><%= data["applicant"] %></td>
          <td><%= data["location"] %></td>
          <td><%= data["dayofweekstr"] %></td>
          <td><%= data["starttime"] %></td>
          <td><%= data["endtime"] %></td>
          <td><%= data["optionaltext"] %></td>
          <td></td>
        </tr>
      <% end %>
    </tbody>
    </table>
    </div>

    """
  end
end
