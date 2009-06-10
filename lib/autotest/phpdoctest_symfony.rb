# require "autotest"
# require "autotest/phpdoctest"
require "autotest/phpdoctest/base"

SYMFONY = '/opt/local/bin/symfony'

$target_patterns = %r%^(apps/|batch/|bin/|lib/).*\.php$%
$exception_patterns = [
  %r%^(\.\/?)?(cache|config|data|plugins|autotest|doc|log|symfony|web)/%,
  %r%apps/.*/templates/%
]

Autotest.add_hook :initialize do |at|
  ($exception_patterns || []).each do |regexp|
    at.add_exception regexp
  end
  
  at.clear_mappings
  at.add_mapping($target_patterns) do |filename, _|
    filename
  end
end


class Autotest::PhpdoctestSymfony < Autotest::Phpdoctest::Base
  def appname
    'frontend'
  end
  
  def doctest(target)
    "#{SYMFONY} doctest #{appname} #{target}"
  end
  
  def doctest_coverage(file)
    "#{SYMFONY} doctest-coverage #{appname} #{file}"
  end
  
  def make_test_cmd(files_to_test)
    cmd = []
    unless files_to_test.empty?
      tg = files_to_test.keys.join(' ')
      cmd << doctest_coverage(tg)
      cmd << doctest(tg)
    end
    cmd.join(';')
  end
  
end
