defmodule Blackjack.Hand do
  @doc """
  Convert the value of our hand.

  (This doesn't fully take into account aces!)
  """
  def to_value(hand) when is_list(hand) do
    before_value =
      Enum.reduce(hand, 0, fn({_suit, rank}, current_value) ->
        current_value + rank_to_value(rank, false)
      end)

    if before_value > 21 do
      Enum.reduce(hand, 0, fn({_suit, rank}, current_value) ->
        current_value + rank_to_value(rank, true)
      end)
    else
      before_value
    end
  end

  def rank_to_value(number, _is_bust) when is_integer(number) do
    number
  end

  def rank_to_value(:jack, _is_bust), do: 10
  def rank_to_value(:queen, _is_bust), do: 10
  def rank_to_value(:king, _is_bust), do: 10
  def rank_to_value(:ace, true), do: 1
  def rank_to_value(:ace, false), do: 11
end
