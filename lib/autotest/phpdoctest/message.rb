module Autotest::Phpdoctest
  module Message
    def has_no_error?(o)
      o.match(Regexp.union(
        /Parse error: syntax error, ([^\n]+)\n/
      )) ? false : true
    end
    
    def summarize(expect)
      # case expect.to_sym
      # when :pass summarize_pass(msg)
      # when :fail
      # end
    end
    
    def filter_passmsg(o)
      res = ['Pass:']
      
      if o.match(/TOTAL.*COVERAGE([^\n]+)/mu)
        res << $~.to_s
      end
      
      n = o.split('file:').size - 1
      res << "tested: #{n < 0 ? 0:n} files"
      
      res.join("\n")
    end
    
    def filter_failmsg(o)
      res = ['Fail:']
      
      # parse syntax error msg
      o.split("\n").each { |line| 
        if line.match(/Parse error: syntax error, (.+) in (.+) on line ([0-9]+)/)
          _msg, _path, _line = $~.captures
          _path = _path.match(/\/(apps\/.+)/) ? $~.captures.to_s : _path
          res << "syntax err: #{_msg} @#{_path}:#{_line}"
        end
      }
      
      res.join("\n")
    end
  end
end