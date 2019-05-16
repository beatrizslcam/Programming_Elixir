#Exercise: WorkingWithMultipleProcesses-5
#Repeat the two, changing spawn_link to spawn_monitor .

defmodule SpawnLink do

  import :timer, only: [sleep: 1]


  def child(pidparent)do

    send(pidparent,"oi")
    raise RuntimeError # raise an exception
  #  exit(:boom)        # kill the child
  end

  def parent do
    Process.flag(:trap_exit,true)
    spawn_monitor(__MODULE__, :child, [self()])
    sleep 500

    receive do
    msg ->
      IO.puts("Received:#{inspect msg}")
    after 1 ->
      IO.puts("Ops!")
    end
  end
end

SpawnLink.parent


