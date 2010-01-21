# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'net/http'
require 'uri'
require 'rubygems'
require 'tld'


print "Enter the URL to update dynamic IP at \nhttp://"
url = "http://" + gets

def validate(url)
  begin
    regexp = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
    if regexp =~ url
      puts "match"
      return 1
    else
      puts "Not a valid URL\nFinished"
      return 0
    end
#    uri = URI.parse(url)
#    if uri.class != URI::HTTP
#      puts "Not a valid URL"
#      exit
#    end
    return 1
  end
end



while validate(url) == 1 do
  #validate(url)
  puts url
  Net::HTTP.get_print URI.parse("#{url}")
  #puts "http://preperat:0AngewNE@members.easydns.com/dyn/dyndns.php?hostname=relax.com.au&myip=1.1.1.1"
  sleep(10)

end
