require './constants'

task :produce do
  sh <<-EOS
rake stream | \
tippecanoe -f --output-to-directory=docs/zxy \
--no-tile-compression \
--minimum-zoom=0 --maximum-zoom=0
  EOS
end

task :geojson do
  sh <<-EOS
rake stream | tippecanoe-json-tool --wrap > docs/inventory.geojson
  EOS
end

task :stream do
  cmds = []
  SOURCES.each do |r|
    cmds << <<-EOS
(ogr2ogr -mapFieldType Date=String -f GeoJSONSeq \
/vsistdout #{r[:path]} | \
LAYER=#{r[:layer]} ruby filter.rb)
    EOS
  end
  sh <<-EOS
(#{cmds.join('; ').gsub("\n", '')})
  EOS
end

task :host do
  sh "budo -d docs"
end

task :style do
  sh "charites --provider mapbox build style.yml docs/style.json"
end

