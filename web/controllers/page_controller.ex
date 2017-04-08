defmodule SqrlBlog.PageController do
  use SqrlBlog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
