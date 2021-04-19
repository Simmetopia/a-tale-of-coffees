defmodule ATaleOfCoffeesWeb.PageLiveTest do
  use ATaleOfCoffeesWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Save it"
    assert render(page_live) =~ "Save it"
  end
end
