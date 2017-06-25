require "yaml"
require "pry"
emoticons = YAML.load_file("./lib/emoticons.yml")
def load_library(path)
    emoticons = YAML.load_file(path)
    results = {"get_meaning" => {}, "get_emoticon" => {}}
    emoticons.each do |meaning, data|
        #binding.pry
        japan = data[1]
        eng = data[0]
        results["get_meaning"][japan] = meaning
        results["get_emoticon"][eng] = japan
    end
    results
end

def get_japanese_emoticon(path, emoticon)
    library = load_library(path)
    if library['get_emoticon'].keys.include?(emoticon)
        library['get_emoticon'][emoticon]
    else
        "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(path, emoticon)
    if load_library(path)['get_emoticon'].values.include?(emoticon)
        load_library(path)['get_meaning'][emoticon]
    else
        "Sorry, that emoticon was not found"
    end
end














