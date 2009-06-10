require File.dirname(__FILE__) + '/../../spec_helper'

describe "autotest notification" do
  def runner
    @runner ||= RunnerTestClass.new
  end

  def mocked_at
    mock(Autotest, :results => result_of(:pass))
  end
  
  def klass
    Autotest::Phpdoctest::GrowlNotify
  end
  
  it "should turn on growl notification" do
    # runner.class.should respond_to
    klass.should respond_to(:turn_on)
  end
  
  it "should hook ran-event and run growl" do
    # klass.should respond_to(:run_growl_proc)
    # proc = klass.run_growl_proc
    # proc.call(mocked_at)
  end
end
