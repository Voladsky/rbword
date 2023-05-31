# frozen_string_literal: true
require "test/unit"
require_relative "../lib/rbword"
require "set"

class RbwordTest < Test::Unit::TestCase
  def setup
    @analyzer = Rbword::Analyzer.new(folder_path: "test/test_folder", stop_list: Set.new, lemmatization: true)
  end
  test "VERSION" do
    assert do
       ::Rbword.const_defined?(:VERSION)
     end
   end
   test "test_read_file" do
     @analyzer.read_file("test/test_folder/test.txt")
     assert_equal(3, @analyzer.occurences("test"))
     assert_equal(2, @analyzer.occurences("file"))
     assert_equal(1, @analyzer.occurences("word"))
   end
   test "test_read_folder" do
    @analyzer.read_folder
    assert_equal(3*2, @analyzer.occurences("test"))
    assert_equal(2*2, @analyzer.occurences("file"))
    assert_equal(1*2, @analyzer.occurences("word"))
   end
   test "test_add_stop_word" do
     @analyzer.add_stop_word("stop")
     assert_true(@analyzer.stop_list.include?("stop"))
     @analyzer.read_file("test/test_folder/test_stop.txt")
     assert_equal(3, @analyzer.occurences("test"))
     assert_equal(2, @analyzer.occurences("file"))
     assert_equal(1, @analyzer.occurences("word"))
     assert_equal(0, @analyzer.occurences("stop"))
   end
   test "test_remove_stop_word" do
     @analyzer.add_stop_word("stop")
     @analyzer.remove_stop_word("stop")
     assert_false(@analyzer.words_list.include?("stop"))
     @analyzer.read_file("test/test_folder/test_stop.txt")
     assert_equal(3, @analyzer.occurences("test"))
     assert_equal(2, @analyzer.occurences("file"))
     assert_equal(1, @analyzer.occurences("word"))
     assert_equal(1, @analyzer.occurences("stop"))
   end

   test "test_change_folder" do
     @analyzer.change_folder("./new_folder")
     assert_equal("./new_folder", @analyzer.instance_variable_get(:@folder_path))
   end

   test "test_occurrences" do
     @analyzer.read_file("./test/test_folder/test.txt")
     assert_equal(3, @analyzer.occurences("test"))
     assert_equal(0, @analyzer.occurences("nonexistent"))
   end

   test "no_lemmatization" do
    no_lemmatization = Rbword::Analyzer.new(folder_path: "test/test_folder", lemmatization: false)
    no_lemmatization.read_file("./test/test_folder/test.txt")
    assert_equal(1, no_lemmatization.occurences("test"))
    assert_equal(1, no_lemmatization.occurences("testing"))
    assert_equal(1, no_lemmatization.occurences("tests"))
    assert_equal(1, no_lemmatization.occurences("files"))
    assert_equal(1, no_lemmatization.occurences("file"))
    assert_equal(1, no_lemmatization.occurences("words"))
   end
  end
