defmodule LiveViewCounterWeb.Simple do
    use Phoenix.LiveView

    @topic "live"

  
    # mount/3 (arity 3)
    # Called when liveview is initialized
    # Will invoke and pass arguments to render/1 behind the scenes
    def mount(_params, _session, socket) do
      {:ok, assign(socket, :val, 0)}
    end
  
    # handle_event/3
    # pattern matches string "inc", applies successor
    def handle_event("inc", _, socket) do
      new_state = update(socket, :val, &(&1 + 1))
      {:noreply, new_state}
    end
  
    # handle_event/3
    def handle_event("dec", _, socket) do
      new_state = update(socket, :val, &(&1 - 1))
      {:noreply, new_state}
    end
  
    # render/1
    # assigns consists of :val state
    # renders template
    def render(assigns) do
      ~L"""
      <div>
        <h1>Hej Bricco!</h1>
        <h1>The count is: <%= @val %></h1>
        <button phx-click="dec">-</button>
        <button phx-click="inc">+</button>
      </div>
      """
    end
  end
