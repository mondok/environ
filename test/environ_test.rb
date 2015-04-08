require 'minitest_helper'

class EnvironTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Environ::VERSION
  end

  def test_it_can_get_path
    path = Environ.env_path
    refute_nil path
  end

  def test_it_can_get_all_vars
    all = Environ.all
    refute_empty all
  end

  def test_it_can_call_bad_method
    bad = Environ.env_nothing
    assert_nil bad
  end

  def test_it_can_set_path
    Environ.env_path = "test"
    
  end
end
