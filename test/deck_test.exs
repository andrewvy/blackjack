defmodule Blackjack.DeckTest do
  use ExUnit.Case

  test "Generating a deck makes 52 cards" do
    deck = Blackjack.Deck.generate()

    assert Enum.count(deck) == 52
  end

  test "Generating random deck is actually random" do
    deck1 = Blackjack.Deck.generate_random()
    deck2 = Blackjack.Deck.generate_random()

    assert deck1 != deck2
  end

  test "Shuffling a deck shuffles" do
    deck = Blackjack.Deck.generate_random()

    assert Blackjack.Deck.shuffle_deck(deck) != deck
  end

  test "Take a card from the deck" do
    deck = [
      {:heart, 2},
      {:diamond, :queen}
    ]

    {card, _new_deck} = Blackjack.Deck.take_card(deck)

    assert card == {:heart, 2}
  end
end
