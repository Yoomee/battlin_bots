ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BattlinBots.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BattlinBots.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BattlinBots.Repo)

