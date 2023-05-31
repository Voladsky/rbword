# frozen_string_literal: true

require_relative "rbword/version"
require "lemmatizer"
require "set"

module Rbword
  class Error < StandardError; end

  class Analyzer
    def initialize(folder_path: "./", stop_list: Set.new, lemmatization: false)
      @folder_path = folder_path
      @stop_list = stop_list
      @lemmatization = lemmatization
      @lemmatizer = Lemmatizer.new
      @words = {}
    end

    def read_file(file)
      words = File.read(file).split

      words.each do |word|
        next if @stop_list.include? word
        if @lemmatization
          new_word = @lemmatizer.lemma(word)
          if @words.key? new_word
            @words[new_word] += 1
          else
            @words[new_word] = 1
          end
        else
          if @words.key? word
            @words[word] += 1
          else
            @words[word] = 1
          end
        end
      end
    end

    attr_reader :folder_path

    def read_folder
      files = Dir.entries(@folder_path).select { |file| File.file? @folder_path + "/" + file}
      files.select! { |file| file.end_with? ".txt" }
      files.map! { |file| folder_path + "/" + file }
      files.each { |file| read_file(file) }
    end

    def add_stop_word(word)
      @stop_list.add(word)
    end

    def remove_stop_word(word)
      @stop_list.delete(word)
    end

    attr_reader :stop_list

    def change_folder(new_path)
      @folder_path = new_path
    end

    def occurences(word)
      if @words.key? word
        @words[word]
      else
        0
      end
    end

    def words_list
      @words.keys
    end
  end
end
