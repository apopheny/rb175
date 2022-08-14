require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = 'The Adventures of Sherlock Holmes'
  
  erb(:home)
end

not_found do 
  redirect "/"
end

get "/search" do

  erb(:search)
end

get "/chapters/:number" do
  redirect "/" unless @contents.size >= params[:number].to_i

  @title = "Chapter " + params[:number]
  @chapter = File.read("data/chp#{params[:number]}.txt")
  erb(:chapter)

end


helpers do
  def in_paragraphs(text)
    text.split("\n\n").map do |paragraph|
    "<p>" + paragraph + "</p>"
    end
  end
end