#Webscraper.rb

To use, simply `require 'webscrape'` in your ruby project and
create an instance of Scrape. You can pass in a base URL string and a path like so:

    require 'webscrape'

    scrape = Scrape.new
    scrape.url = 'http://www.walmart.com'
    scrape.path = '/'

    #To execute
    scrape.main

    #store scrape results in hash
    hash = scrape.results

    #export results to csv
    scrape.make_csv('filename.csv')



Scrape will pull all the links off of the seed page and store the body contents of each link in a hash.






