defmodule TruckSchedTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  describe "get_schedule/0" do
    test "information should be fetched when available from th food truck api " do
      expect(TruckSchedBehaviourMock, :get_schedule, fn ->
        {:ok, %{body: "Some truck data"}}
      end)

      assert {:ok, _} = TruckSched.get_schedule()
    end

    test "an error should be returned when something went wrong with the food truck api" do
      expect(TruckSchedBehaviourMock, :get_schedule, fn ->
        {:error, %{body: "something went wrong"}}
      end)

      assert {:error, _} = TruckSched.get_schedule()
    end
  end
end
