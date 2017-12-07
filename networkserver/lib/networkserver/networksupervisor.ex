defmodule BillingService.Supervisor do
    use Supervisor

    @name BillingService.Supervisor
    def start_link(options) do      
      Supervisor.start_link(__MODULE__, :ok, options)
    end
    def init(:ok) do
      children = [
        {BillingService.Server,name: BillingService.Server}
      ]
      # We also changed the `strategy` to `simple_one_for_one`.
      # With this strategy, we define just a "template" for a child,
      # no process is started during the Supervisor initialization,
      # just when we call `start_child/2`
      Supervisor.init(children,strategy: :one_for_one)
      #supervise(children, strategy: :simple_one_for_one)
    end
  end