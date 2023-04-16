defmodule TruckSchedBehaviour do
  @callback get_schedule() :: {:ok, any} | {:error, any}
end
