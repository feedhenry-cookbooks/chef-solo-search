require "rubygems"
require "test/unit"
require "chef"

class TestNoFolder < Test::Unit::TestCase

  def test_no_folders_in_libraries
    libraries = File.expand_path('../../libraries/', __FILE__)
    results = Dir.entries(libraries).select {|f| File.directory? File.join(libraries, f)}
    assert_equal results.sort, [".", ".."], "Knife cookbook upload fails if the directory structure of the project isn't flat (see issue #54)"
  end

end