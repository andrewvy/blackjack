defmodule Blackjack.HandTest do
  use ExUnit.Case

  test "Can get value of hand" do
    hand = [
      {:heart, 2},
      {:diamond, 7},
      {:diamond, 6},
    ]

    assert Blackjack.Hand.to_value(hand) == 15
  end
end
