defmodule Blackjack.Player do
  @moduledoc """
  This module represents the player state.
  """

  defstruct [
    name: "",
    hand: [],
    chips: 1_000
  ]

  @type t :: %__MODULE__{
    name: String.t,
    hand: Blackjack.Types.hand,
    chips: non_neg_integer()
  }
end
