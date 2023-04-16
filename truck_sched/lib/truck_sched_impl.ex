defmodule TruckSchedImpl do
  @behaviour TruckSchedBehaviour

  @url "https://data.sfgov.org/resource/jjew-r69b.json?"

  def get_schedule() do
    url = @url
    headers = [{"Accept", "application/json"}]

    case HTTPoison.get(url, headers) do
      {:ok, %{body: body}} ->
        Poison.decode(body) |> handle_response()

      {:error, reason} ->
        {:error, reason}
    end
  end

  def handle_response({:ok, data}) do
    data
  end

  def handle_response({:error, reason}) do
    {:error, reason}
  end
end
