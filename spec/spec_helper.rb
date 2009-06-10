$:<< File.dirname(__FILE__) +'/../lib'

require "rubygems"
require "autotest/phpdoctest/base"
require "autotest/phpdoctest/growl_notify"
require "autotest/phpdoctest_symfony"


def result_of(type=:pass)
  case type
  when :syntax_error
    "apps/frontend/config/config                                            100%

    apps/frontend/lib/myUser.class                                           0%

    TOTAL COVERAGE:  67%

    # file: apps/frontend/config/config.php

     Looks like everything went fine.                                      



    Parse error: syntax error, unexpected '}' in /Users/sou_sk/workphpdoctest/apps/frontend/lib/myUser.class.php on line 14



    Call Stack:

        0.0006     103088   1. {main}() /Users/sou_sk/workphpdoctest/cache/frontend/test/sfDocTestPlugin/tests/apps/frontend/lib/myUser.class.php:0

    "
  # success
  else
    "apps/frontend/config/config                                            100%

    apps/frontend/lib/myUser.class                                         100%

    TOTAL COVERAGE: 100%

    # file: apps/frontend/config/config.php

     Looks like everything went fine.                                      

    # file: apps/frontend/lib/myUser.class.php

     Looks like everything went fine."
  end
end
