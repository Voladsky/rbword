# frozen_string_literal: true

require_relative "rbword/version"
#require lemmatizer

module Rbword
  class Error < StandardError; end
  # Your code goes here...
  class Analyzer
    # folder_path: string
    #words: Hash<string, int>
    #lemmatizer: Lemmatizer
    #stop_list: Set<string>()
    #lemmatization: bool

    def initialize(folder_path: "./", stop_list: Set<string>(), lemmatization: false)
      @folder_path = folder_path
      @stop_list = stop_words
      @lemmatization = lemmatization
    end

    def read_file()
      # TODO: Reads single file, splits words into @words, lemmatize if specified
    end


    def read_folder()
      # TODO: Reads files from folder located by folder_path
    end

    def add_stop_word(word)
      # TODO: Add stop word to @stop_list
    end

    def remove_stop_word(word)
      # TODO: Remove stop word from @stop_list
    end

    set_folder(new_path)
      # TODO: Sets folder to read files from
    end

    def get_count(word)
      # TODO: Gets number of occurrences of a word given
    end

    def get_words()
      # TODO: Get words in a text as an array
    end

  end

end
