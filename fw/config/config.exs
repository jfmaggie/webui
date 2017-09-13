# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

# Use bootloader to start the main application. See the bootloader
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :bootloader,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: :fw

config :nerves_firmware_ssh,
authorized_keys: [
  File.read!(Path.join(System.user_home!,
                       ".ssh/id_rsa.pub"))]

config :nerves_init_gadget,
node_name: "nerves"

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
import_config "../../phx_app/config/config.exs"

config :phx_app, PhxAppWeb.Endpoint,
  code_reloader: false,
  server: true

config :nerves_network, :default,
  eth0: [
    ipv4_address_method: :dhcp
  ],
  wlan0: [
    ssid: "nerves1",
    psk: "nervestraining",
    key_mgmt: :"WPA-PSK"
  ]
