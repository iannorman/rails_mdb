class SearchController < ApplicationController
def create
    search = "%#{params[:search_for]}%"
    #% is SQL like, #{} are how text is isnterted. The parameter search_for is passed. So inserts Ian into code, if searching for 'Ian' then "%Ian%"
    #search is a variable
    #@films is an instance level variable
    
    @films = Film.find(:all, :conditions => ['name LIKE ?', search])
end
end