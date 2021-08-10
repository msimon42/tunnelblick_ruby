require './lib/tunnelblick_ruby'
require 'rake'
require 'optparse'
require 'pry'

namespace :tunnelblick do
  # desc 'tunnelblick_ruby connect'
  task :connect, [:address] do |t, args|
    options = {}
    opts = OptionParser.new
    opts.banner = "Open VPN Connection"

    opts.on("address") { |a|
      options[:address] = a
    }

    args = opts.order!(ARGV) {}
    opts.parse!(args)
    unless TunnelblickRb.connected?
      exit 0 if initiate_connection(args[1])
      raise 'Failed to connect.'
    end
    raise 'Connection already exists!'
  end

  task :disconnect, [:address] do |t, args|
    options = {}
    opts = OptionParser.new
    opts.banner = "Close VPN Connection"

    opts.on("address") { |a|
      options[:address] = a
    }

    args = opts.order!(ARGV) {}
    opts.parse!(args)
    if TunnelblickRb.connected?
      if end_connection(args[1])
        puts 'Disconnected!'
        exit 0
      end
      raise 'Failed to disconnect.'
    end
    raise 'Connection does not currently exist!'
  end
end



## HELPER METHODS ##

def initiate_connection(address)
  begin
    TunnelblickRb.start(address)
    return true
  rescue
    return false
  end
end

def end_connection(address)
  begin
    TunnelblickRb.stop(address)
    return true
  rescue
    return false
  end
end
