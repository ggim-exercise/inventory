require 'json'
LAYER = ENV['LAYER']

while gets
  f = JSON.parse($_.strip)
#  f['properties'] = {
#    'a' => 1
#  }
  f['tippecanoe'] = {
    'layer' => LAYER,
    'minzoom' => 0,
    'maxzoom' => 0
  }
  print "\x1e#{JSON.dump(f)}\n" unless 
    f['geometry']['coordinates'] == [0.0, 0.0]
end

