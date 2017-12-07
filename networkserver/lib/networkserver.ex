defmodule BillingService.Server do
  use GenServer
  alias Couchdb.Connector
  # API
  def start_link(options) do
    GenServer.start_link(__MODULE__,:ok, options)
  end
  def register(number) do
    GenServer.call(__MODULE__, {:register, number})
  end
  def register_phone(pid, phone) do
    GenServer.cast(__MODULE__, {:register_phone,pid, phone})
  end
  def balance_phone(pid, phone) do
    GenServer.cast(__MODULE__, {:balance_phone,pid, phone})
  end
  
  #def balance_phone(pid,phone) do
  #  GenServer.call(__MODULE__,{:balance_phone,pid,phone})
  #end
  # SERVER
  def init(:ok) do
    {:ok, []}
  end
  def handle_cast({:register_phone,pid, phone}, []) do
    #db_props = %{protocol: "http", hostname: "localhost", database: "billing_db",port: 5984}
    
    db_props = %{protocol: "http", hostname: "localhost", database: "test_db",port: 5984}
    #"{\"phoneNo\": \"666\", \"balance\": \"333\"}", "123")
    [a,b,c,d] = ["\"phoneNo\": \"", phone, "\", \"balance\":", "\"500\"" ]
    arg = "{#{a}#{b}#{c}#{d}}"
    Couchdb.Connector.Writer.create(db_props, arg, phone)
    send pid, :PhoneRegistered
    #Couchdb.Connector.Writer.create(db_props, "{\"phoneNo\": "+ new_phone +", \"balance\": \"1000\"}", pid)
    #IO.puts(Couchdb.Connector.Storage.storage_up(db_props))    
    #IO.puts(Couchdb.Connector.Writer.create_generate(db_props, "{\"key\": \"value\"}"))
    #IO.puts(Couchdb.Connector.create(db_props, %{"key2" => "value2"},"billing"))
    #IO.puts(Connector.get(db_props, "billing"))
    {:noreply, []}
  end

  def handle_cast({:balance_phone,pid,phone}, []) do
    db_props = %{protocol: "http", hostname: "localhost", database: "test_db",port: 5984}
    id = phone
    {:ok, reloaded} = Connector.get(db_props, id)
    key = String.to_integer(reloaded["balance"])
    #value = Integer.to_string(newBalance)
    send pid, key#Couchdb.Connector.Reader.get(db_props, "billing")
    {:noreply, []}
  end


#  def handle_call({:balance_phone,pid,phone}, _from,[]) do
#    {:reply, phone, []}
#  end

  def handle_call({:register,number}, _from, []) do
    {:reply, number, []}
  end


end

