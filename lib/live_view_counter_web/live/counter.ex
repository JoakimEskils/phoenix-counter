defmodule LiveViewCounterWeb.Counter do
    use Phoenix.LiveView

    @topic "live"

  
    # mount/3 (arity 3)
    # Called when liveview is initialized
    # Will invoke and pass arguments to render/1 behind the scenes
    def mount(_params, _session, socket) do
       LiveViewCounterWeb.Endpoint.subscribe(@topic) # subscribe to the channel
      {:ok, assign(socket, :val, 0)}
    end
  
    # handle_event/3
    # pattern matches string "inc", applies successor
    def handle_event("inc", _, socket) do
      new_state = update(socket, :val, &(&1 + 1))
      LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "inc", new_state.assigns) 
      {:noreply, new_state}
    end
  
    # handle_event/3
    def handle_event("dec", _, socket) do
      new_state = update(socket, :val, &(&1 - 1))
      LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "dec", new_state.assigns) 
      {:noreply, new_state}
    end

    # handle_info/2
    # handles received messages
    def handle_info(msg, socket) do
      {:noreply, assign(socket, val: msg.payload.val)}
    end
  
    # render/1
    # assigns consists of :val state
    # renders template
    def render(assigns) do
      ~L"""
      <div>
        <h1>The count is: <%= @val %></h1>
        <button phx-click="dec">-</button>
        <button phx-click="inc">+</button>
      </div>
      """
    end
  end



  #FYI
  #Phoenix.LiveView.Socket<
  #assigns: %{
  #  flash: %{},
  #  live_view_action: nil,
  #  live_view_module: LiveViewCounterWeb.Counter,
  #  val: 1
  #},