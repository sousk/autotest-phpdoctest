require "autotest/phpdoctest"
require "autotest/phpdoctest/growl_notify"

module Autotest::Phpdoctest
  class Base < Autotest
    class << self
      # def growl_on
      #   GrowlNotify.turn_on
      # end
    end
  end
end
