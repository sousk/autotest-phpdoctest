require File.dirname(__FILE__) + '/../../spec_helper'

describe Autotest::Phpdoctest::Message do
  include Autotest::Phpdoctest::Message
  
  it "should detect error" do
    klass.should respond_to(:has_no_error?)
    klass.has_no_error?(result_of(:pass)).should be_true
    klass.has_no_error?(result_of(:syntax_error)).should be_false
    klass.should respond_to(:summarize)
  end
  
  it "should return output msg for growl" do
    # msg = klass.summarize(:ok, result_of(:pass))
    # passmsg.should =~ /COVERAGE/
  end
  
  it "should filter message with syntax error" do
    # self.should respond_to(:filter_failmsg)
    # failmsg = self.filter_failmsg result_of(:syntax_error)
    # # syntax error + msg + path + line
    # failmsg.should =~ %r%(syntax err.*unexpected.*apps/frontend.*[0-9]+)%
  end
  
  def klass
    k = mock()
    k.class.send(:include, Autotest::Phpdoctest::Message)
    k
  end
end
