defmodule NetworkserverTest do
  use ExUnit.Case
  doctest Networkserver

  test "greets the world" do
    assert Networkserver.hello() == :world
  end
end
