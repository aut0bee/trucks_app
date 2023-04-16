ExUnit.start()

Mox.defmock(TruckSchedBehaviourMock, for: TruckSchedBehaviour)

Application.put_env(:truck_sched, :sched, TruckSchedBehaviourMock)

Application.ensure_all_started(:mox)
