# require modules here
require 'yaml'

def load_library(file_path)
 library = YAML.load(File.read(file_path))
 translator = {}
  library.each do |inner_key, names|
    translator[inner_key] = { 
      :english => names[0], 
      :japanese => names[1] 
    }
    end
    translator
  end

def get_japanese_emoticon(file_path, emoticon)
  hashtable = load_library(file_path)
  j_emo = ""
  #if the english is == to emoticon, puts japanese value
  hashtable.each do |key, value|
    if value[:english] == emoticon
      j_emo = value[:japanese]
    end
  end
  
  if j_emo == ""
    "Sorry, that emoticon was not found"
  else
    j_emo
  end
end

def get_english_meaning(file_path, emoticon)
  hashtable = load_library(file_path)
  meaning = ""
  hashtable.each do |key, value|
    # if the japanese value of the given key (ex:"wink") matches emoticon, make meaning that value
    if value[:japanese] == emoticon
      meaning = key
    end
  end
  
  if meaning == ""
    "Sorry, that emoticon was not found"
  else
    meaning
  end
end