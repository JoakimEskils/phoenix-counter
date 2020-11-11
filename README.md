# LiveViewCounter

## What is this?

This project was made to demonstrate Elixir/Phoenix during a presentation held by me at my workplace. The aim was to teach about Elixir's concurrency model, along with Phoenix MVC structure & how a simple counter application without any Javascript could be improved easily to have a shared state across several processes by a Pub/Sub mechanism. 

## Run the project

To start the project:

- Install dependencies with `mix deps.get`
  
- Start the Phoenix endpoint with `mix phx.server`

- Visit project at http://localhost:4000

- To see the counter, visit http://localhost:4000/simple

- To see the counter with shared states across multiple users, start http://localhost:4000/counter in several tabs/windows in your favourite browser.

