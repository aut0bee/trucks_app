defmodule TruckSched do
  def get_schedule() do
    truck_sched_impl().get_schedule()
  end

  defp truck_sched_impl() do
    Application.get_env(:truck_sched, :sched, TruckSchedImpl)
  end
end
