require "test/unit"
require "posixlock"

class PosilockTest < Test::Unit::TestCase
  def test_method_definition
    file = File.open(File.expand_path('../resources/file', __FILE__))

    assert_respond_to file, :lockf
    assert_respond_to file, :posixlock
  end
end
