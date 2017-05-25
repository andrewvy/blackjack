




defmodule Blackjack.Types do
  @type suit :: :heart | :diamond | :club | :spade
  @type rank :: 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9  | 10 | :jack | :queen | :king | :ace

  @type card :: {suit, rank}
  @type hand :: [card]
  @type deck :: [card]
end
