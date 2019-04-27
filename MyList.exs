defmodule MyList do
  def len([]), do: 0

  def len([ _head | tail ]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([ head | tail ]), do: [ head+1 | add_1(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]


  def mapsum([], _fun), do: 0
  def mapsum([ head | tail ], fun) do
    fun.(head) + mapsum(tail, fun)
  end

  #Write a max(list) that returns the element with the maximum value in the list. (This is slightly trickier than it sounds.
  def max([]), do: 0
  def max([ head | tail ]) do
    maxi([ head | tail ], head)
  end

  def maxi([], maximo), do: maximo
  def maxi([ head | tail ], maximo) do
    m = maximo < head
    compara(m, [ head | tail ], maximo)
  end

  def compara(true, [ head | tail ], _maximo), do:  maxi(tail, head)
  def compara(false, [ _head | tail ], maximo), do:  maxi(tail, maximo)

end
