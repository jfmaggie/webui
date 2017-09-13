defmodule Fw.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(Task, [&start_kiosk/0], restart: :permanent),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fw.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_kiosk() do
    :os.cmd('qt-webkit-kiosk -platform linuxfb' ++
      '-c /etc/qt-webkit-kiosk.ini -u http://127.0.0.1:4000/')
  end
end
