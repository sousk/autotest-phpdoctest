require "growl" # http://github.com/visionmedia/growl/tree/master
require "autotest/phpdoctest/message"

class Autotest::Phpdoctest::GrowlNotify
  
  AUTOTEST_IMAGE_ROOT = "~/.autotest_images"
  
  class << self
        
    include Growl
    include Autotest::Phpdoctest::Message
    
    def turn_on
      Autotest.add_hook :ran_command, &self.run_growl_proc
    end
    
    def run_growl_proc
      lambda do |at|
        # at.class is Autotest::YourStyle
        output = [at.results].flatten.join("\n")

        if has_no_error? output
          notify_ok filter_passmsg(output)
        else
          notify_error filter_failmsg(output)
        end
      end
    end
  end
  
  self.turn_on
end
