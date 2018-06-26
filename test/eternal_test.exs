defmodule EternalTest do
  use ExUnit.Case
  doctest Eternal

  test "greets the world" do
    assert Eternal.hello() == :world
  end
end
