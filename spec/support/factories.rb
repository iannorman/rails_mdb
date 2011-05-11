Factory.define :film do |film|
  
  film.name 'test film name'
  film.url 'www.test.com'
  film.description 'test desc'
  film.rating '0'
  
  
end

Factory.define :admin do |admin|
  admin.email 'test@xyz.co.uk'
  admin.password 'adcdef'
end  