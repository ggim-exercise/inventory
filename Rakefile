require './constants'

task :produce do
  cmds = []
  SOURCES.each do |r|
    cmds << <<-EOS
(ogr2ogr -mapFieldType Date=String -f GeoJSONSeq \
/vsistdout #{r[:path]} | \
LAYER=#{r[:layer]} ruby filter.rb)
    EOS
  end
  sh <<-EOS
(#{cmds.join('; ').gsub("\n", '')}) | \
tippecanoe -f --output-to-directory=docs/zxy \
--no-tile-compression \
--minimum-zoom=0 --maximum-zoom=0
  EOS
end

task :host do
  sh "budo -d docs"
end

task :style do
  sh "charites --provider mapbox build style.yml docs/style.json"
end

