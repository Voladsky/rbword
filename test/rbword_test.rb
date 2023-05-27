# frozen_string_literal: true

require "test/unit"

class RbwordTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Rbword.const_defined?(:VERSION)
    end
  end

  test "read_file" do
    assert true
  end

  test "something useful" do
    assert_equal("expected", "actual")
  end
end
