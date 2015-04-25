require 'mechanize'
require 'csv'

class Scrape

  attr_accessor :url, :path, :results

  def initialize
    @results = {} #save results to hash
    @agent = Mechanize.new #create Mechanize agent
  end

  def main
    #@agent sends get request to url
    page = @agent.get(@url + @path)
    puts "Scraping #{@url}#{@path}"

    #stores all link obj into links array
    links = page.search('a')

    #loops through each of the links
    links.each do |link|
      begin
        #stores link name and link contents in @results hash
        @results[link.text] = scrape(link.attr('href'))
        puts "scraping #{@url}+#{link.attr('href')}"
      rescue
        puts "Error while scraping #{@url}+#{link.attr('href')}"
      end
    end
  end

  def scrape(link)
    a = Mechanize.new
    page = a.get(@url+link)
    #you can get specific data from page
    return page.body
  end

  def make_csv(filename)
    puts "Making csv file..."
    CSV.open(filename, "w") do |csv|
      csv << ["Link", "Content"]
      @results.each do |key, value|
        csv << [key, value]
      end
    end
  end

end

#create new instance of Scrape
scrape = Scrape.new
scrape.url = "http://www.walmart.com/"
scrape.path = "/search?q=reviews"

#pass it hostname and path
scrape.main
#create csv file with data
#scrape.make_csv("walmart.csv")



