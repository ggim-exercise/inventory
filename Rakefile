require './constants'

task :produce do
  SOURCES.each do |r|
    sh <<-EOS
ogr2ogr -mapFieldType Date=String -f GeoJSONSeq \
/vsistdout #{r[:path]} | \
LAYER=#{r[:layer]} ruby filter.rb | \
tippecanoe -f --output-to-directory=docs/zxy \
--minimum-zoom=0 --maximum-zoom=0
    EOS
  end
end

task :host do
  sh "budo -d docs"
end

