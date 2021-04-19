defmodule ATaleOfCoffeesWeb.IndexTest do
  use ATaleOfCoffeesWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders form" do
    assert render_component(ATaleOfCoffeesWeb.Tasting.Index, id: 1) =~ "title"
  end

  test "full live view", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "title"
  end
end
