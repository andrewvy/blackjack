defmodule Blackjack.Deck do
  @suits [:heart, :diamond, :club, :spade]
  @ranks [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

  def generate() do
    for suit <- @suits, rank <- @ranks do
      {suit, rank}
    end
  end

  def generate_random() do
    generate()
    |> shuffle_deck()
  end

  def shuffle_deck(deck) when is_list(deck) do
    deck
    |> Enum.shuffle()
  end

  def take_card([]) do
    {:empty_deck, []}
  end

  def take_card([first_card | rest_of_deck]) do
    {first_card, rest_of_deck}
  end
end
