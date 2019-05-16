#Exercise: WorkingWithMultipleProcesses-4
#Do the same, but have the child raise an exception. What difference do
#you see in the tracing?


defmodule SpawnLink do

  import :timer, only: [sleep: 1]


  def child(pidparent)do

    send(pidparent,"oi")
    raise RuntimeError

  end

  def parent do
    Process.flag(:trap_exit,true)
    spawn_link(__MODULE__, :child, [self()])
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


