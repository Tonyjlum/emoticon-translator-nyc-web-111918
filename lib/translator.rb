require 'yaml'
require 'pry'

def load_library(file_path)
  data_hsh = YAML.load_file(file_path)
  emoji_hsh = {"get_meaning" => {}, "get_emoticon" => {}}
  #get_meaning returns the word
  #get_emoticon returns the english meaning
  data_hsh.each do |word, face_array|
    emoji_hsh["get_emoticon"].merge!(face_array.first => face_array.last)
    emoji_hsh["get_meaning"].merge!(face_array.last => word)
  end
  emoji_hsh
end

def get_japanese_emoticon(file_path, emoticon)
  emoji_hsh = load_library(file_path)
  jap_emoji = emoji_hsh["get_emoticon"][emoticon]
  jap_emoji.nil? ? "Sorry, that emoticon was not found" : jap_emoji
end

def get_english_meaning(file_path,emoticon)
  emoji_hsh = load_library(file_path)
  eng_meaning = emoji_hsh["get_meaning"][emoticon]
  eng_meaning.nil? ? "Sorry, that emoticon was not found" : eng_meaning
end
