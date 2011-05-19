require 'nokogiri'

desc "Update language translations"
task :update_languages do
  Dir["data/cldr_1.9.1/common/main/**/*"].each do |data_file|
    file_content = File.open(data_file) { |f| f.read.strip }
    language_code = data_file.split('/').last.split('.').first
    file = File.open("languages/#{language_code}.yml", 'w')
    file.puts "#{language_code}:"
    doc = Nokogiri::XML(file_content)
    doc.search('//language').each do |xml_lang|
      code = xml_lang.get_attribute('type')
      file.puts "  \"#{code}\": #{xml_lang.text}"
      puts code + "  #{code}: #{xml_lang.text}"
    end
  end
end

desc "Update territory translations"
task :update_territories do
  Dir["data/cldr_1.9.1/common/main/**/*"].each do |data_file|
    file_content = File.open(data_file) { |f| f.read.strip }
    language_code = data_file.split('/').last.split('.').first
    file = File.open("territories/#{language_code}.yml", 'w')
    file.puts "#{language_code}:"
    doc = Nokogiri::XML(file_content)
    doc.search('//territory').each do |xml_ter|
      code = xml_ter.get_attribute('type')
      file.puts "  \"#{code}\": \"#{xml_ter.text}\""
      puts code + ": #{xml_ter.text}"
    end
  end
end

desc "Update script translations"
task :update_scripts do
  Dir["data/cldr_1.9.1/common/main/**/*"].each do |data_file|
    file_content = File.open(data_file) { |f| f.read.strip }
    language_code = data_file.split('/').last.split('.').first
    file = File.open("scripts/#{language_code}.yml", 'w')
    file.puts "#{language_code}:"
    doc = Nokogiri::XML(file_content)
    doc.search('//script').each do |xml_scr|
      code = xml_scr.get_attribute('type')
      file.puts "  \"#{code}\": \"#{xml_scr.text}\""
      puts code + ": #{xml_scr.text}"
    end
  end
end
