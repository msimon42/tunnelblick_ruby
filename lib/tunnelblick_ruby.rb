require_relative 'vpn_service'

class TunnelblickRb
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

  def stop(address)
    @service.disconnect(address)
  end
end
