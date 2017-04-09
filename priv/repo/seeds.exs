# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SqrlBlog.Repo.insert!(%SqrlBlog.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SqrlBlog.User

admin_user = Application.get_env(:sqrl_blog,:admin_user)

case SqrlBlog.Repo.get_by(User, email: admin_user[:email]) do
  :nil ->
    with_pw = admin_user ++
      [
        password_hash: User.encrypt_password(admin_user[:password]),
        admin: :true
      ]
    SqrlBlog.Repo.insert!(struct(User,with_pw))
  _ ->
    :ok
end
