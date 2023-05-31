# Rbword

Rbword is a Ruby library for analyzing text files. It allows you to read files, create a list of stop words, get a list of all words in the file, and also get the count of each word occurrence in the file. The library also supports word lemmatization.

## Installation

To install Rbword, you need to have Ruby installed on your computer. If Ruby is not installed yet, you can download it from the official website https://www.ruby-lang.org/en/downloads/.

After installing Ruby, you need to follow these steps:

> + Copy a repository writing ```$ git clone https://github.com/Voladsky/rbword.git``` in folder of your choice 
> + Install gem "lemmatizer" using the command ```$ gem install lemmatizer``` in your IDE terminal.
> + Write ```$ gem build rbword.gemspec```
> + Write ```$ gem install ./rbword-x.x.x.gem``` (depending on your build version)  


## Usage

To use Rbword, you need to create an Analyzer class object and call its methods.

### ▪️ Creating an Analyzer class object and reading a file:

```ruby
analyzer = Rbword::Analyzer.new
analyzer.read_file("text.txt")
```


### ▪️ Reading all files in a specified folder:

```ruby
analyzer.read_folder
```


### ▪️ Adding a word to the stop words list:

```ruby
analyzer.add_stop_word("the")
```


### ▪️ Removing a word from the stop words list:

```ruby
analyzer.remove_stop_word("a")
```


### ▪️ Changing the path to the folder with files:

```ruby
analyzer.change_folder("./new_folder")
```


### ▪️ Getting the count of a word occurrence:

```ruby
analyzer.occurrences("dog")
```


### ▪️ Getting a list of all words:

```ruby
analyzer.words_list
```


### ▪️ Word lemmatization (if the lemmatization parameter was passed when creating the object):

```ruby
analyzer.read_file("text.txt")
puts analyzer.words_list # ["cat", "run", "jumped"]
```


## Authors

Rbword was created by a team of Ruby developers: Vladislav Krylov, Bogdan Gnatenko, Dmitry Anuchin, Vladimir Unkovsky, Grigory Mirocedi.

## License

Rbword is distributed under the MIT license. See `LICENSE` for details.
