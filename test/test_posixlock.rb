require "test/unit"
require "posixlock"

class PosilockTest < Test::Unit::TestCase
  def setup
    @file = File.new(File.expand_path('../testfile', __FILE__), File::CREAT|File::TRUNC|File::RDWR, 0644)
  end

  def teardown
    File.delete(@file.path)
  end

  def test_method_definition
    assert_respond_to @file, :lockf
    assert_respond_to @file, :posixlock
  end

  def test_lockf
    pid = fork {
      Signal.trap("USR1") { exit }

      @file.lockf(File::F_LOCK, 0)

      Process.kill('USR2', Process.ppid())
      loop { sleep(1) }
    }

    Signal.trap("USR2") {
      assert_equal pid, @file.lockf(File::F_TEST, 0)
      Process.kill('USR1', pid)
    }

    Process.wait
  end

  def test_posixlock
    pid = fork {
      Signal.trap("USR1") { exit }

      @file.posixlock(File::LOCK_EX)

      Process.kill('USR2', Process.ppid())
      loop { sleep(1) }
    }

    Signal.trap("USR2") {
      assert_equal pid, @file.lockf(File::F_TEST, 0)
      Process.kill('USR1', pid)
      assert @file.posixlock(File::LOCK_EX)
    }

    Process.wait
  end
end
