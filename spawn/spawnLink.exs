#Use spawn_link to start a process, and have that process send a message
#to the parent and then exit immediately. Meanwhile, sleep for 500 ms in
#the parent, then receive as many messages as are waiting. Trace what
#you receive. Does it matter that you weren’t waiting for the notification
#from the child when it exited?

defmodule SpawnLink do

  import :timer, only: [sleep: 1]


  def child(pidparent)do
  #  sleep 500
    send(pidparent,"oi")

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


