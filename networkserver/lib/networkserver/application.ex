defmodule BillingService.Application do
    # See http://elixir-lang.org/docs/stable/elixir/Application.html
    # for more information on OTP Applications
    @moduledoc false
  
    use Application
  
    def start(_type, _args) do
        #NetworkSupervisor.start_link()
        BillingService.Supervisor.start_link(name: BillingService.Supervisor)
    end
  end