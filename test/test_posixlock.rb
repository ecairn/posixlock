require "test/unit"
require "tempfile"
require "posixlock"

class PosilockTest < Test::Unit::TestCase
  def test_method_definition
    Tempfile.open('testfile') do |file|
      assert_respond_to file, :lockf
      assert_respond_to file, :posixlock
    end
  end

  def test_lockf
    Tempfile.open('testfile') do |file|
      pid = 0

      Signal.trap("USR2") {
        assert_equal pid, file.lockf(File::F_TEST, 0)
        Process.kill('USR1', pid)
      }

      pid = fork {
        Signal.trap("USR1") { exit }

        file.lockf(File::F_LOCK, 0)

        Process.kill('USR2', Process.ppid())
        loop { sleep(1) }
      }

      Process.wait
    end
  end

  def test_posixlock
    Tempfile.open('testfile') do |file|
      pid = 0

      Signal.trap("USR2") {
        assert_equal pid, file.lockf(File::F_TEST, 0)
        Process.kill('USR1', pid)
        assert file.posixlock(File::LOCK_EX)
      }

      pid = fork {
        Signal.trap("USR1") { exit }

        file.posixlock(File::LOCK_EX)

        Process.kill('USR2', Process.ppid())
        loop { sleep(1) }
      }

      Process.wait
    end
  end
end
