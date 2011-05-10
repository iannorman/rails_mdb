require File.dirname(__FILE__) + '/../spec_helper'

describe Film do
  it "should be valid with a name, url and description" do
    film = Factory(:film, :name=> 'test', :url => 'www.test.co.uk', :description => 'desc')
    film.should be_valid
  end
  
end

describe 'cleaning the url' do
  it 'should clean the leading http:// when saved' do
    film = Factory(:film, :url => 'http://some/url')
    film.save!
    film.url.should == 'some/url'
  
  end
end

describe 'cleaning the url' do
  it 'should not clean any leading http:// when there is no http://' do
    film = Factory(:film, :url => 'some/url')
    film.save!
    film.url.should == 'some/url'
  
  end
end


describe 'cleaning the url' do
  it 'should do nothing when the url is nil' do
    film = Factory.build(:film, :url => nil)
    film.valid?
    film.url.should be_nil
  
  end
end