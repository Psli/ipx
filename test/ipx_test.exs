defmodule IpxTest do
  use ExUnit.Case
  doctest Ipx

  test "greets the world" do
    assert Ipx.hello() == :world
  end
end
