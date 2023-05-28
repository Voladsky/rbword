# frozen_string_literal: true

require_relative "rbword/version"
require "lemmatizer"

module Rbword
  class Error < StandardError; end
  class Analyzer
    def initialize(folder_path: "./", stop_list: Set<string>(), lemmatization: false)
      @folder_path = folder_path
      @stop_list = stop_list
      @lemmatization = lemmatization
      @lemmatizer = Lemmatizer.new
      @words = Hash.new
    end

    def read_file(file)
      words = File.read(file).split(' ')

      words.each do |word|
        if @stop_list.include? word
          next
        end

        if @lemmatization
          new_word = @lemmatizer.lemma(word)
          @words[new_word] += 1
        else
          @words[word] += 1
        end
      end
    end

    def read_folder
      files = Dir.entries(@folder_path).select { |file| File.file? File.join(@folder_path, file) }
      files.select { |file| file.end_with? '.txt' }

      files.each { |file| read_file(file) }
    end

    def add_stop_word(word)
      @stop_list.insert(word)
    end

    def remove_stop_word(word)
      @stop_list.remove(word)
    end

    def set_folder(new_path)
      @folder_path = new_path
    end

    def get_count(word)
      @words[word]
    end

    def get_words()
      @words.keys
    end
  end
end
