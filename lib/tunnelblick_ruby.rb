require 'vpn_service'

class Tunnelblick
  :attr_reader

  def initialize
    @service = VpnService.new
  end

  def connected?
    @service.address != nil
  end

  def start(address)
    @service.connect(address)
  end

  def switch_ip(address)
    @service.switch(address)
  end

  def stop
    @service.disconnect
  end      
end
