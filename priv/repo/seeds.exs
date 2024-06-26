# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskManager.Repo.insert!(%TaskManager.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TaskManager.Schemas.User

seed_user = %{ name: "Victor Costa", email: "victor.dev@ex.com", password: "4cLWv79Y" }


if TaskManager.Repo.get_by(User, %{ email: seed_user.email }) do
  IO.inspect("This user already exist!")
else
  User.changeset(seed_user)
  |>TaskManager.Repo.insert!()

  IO.inspect("User inserted into database")
end
