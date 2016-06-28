# <---- get translation by giving blurb id ---->

# put blurb ids in /input/xx.txt, then run this file
# will export translation of blurbs to output/blurbs_translation.txt


require_relative '../aproject/support/env'

path = File.absolute_path("../output/", File.dirname(__FILE__))
file = File.join(path, "blurbs_translation.txt")
file = File.new(file,"w+") unless File.exist?(file)

blurb_ids = Base.read_file_txt('blurb_ids')
LanguageCultureName = ['en', 'pt-BR', 'zh-CN', 'fr', 'de', 'es', 'it', 'ko-KR', 'ja-JP', 'ru', 'tr-TR', 'th', 'ar', 'zh-HK', 'zh-TW']

File.open(file,"w") do |file|
  blurb_ids.each do |blurb_id|
    file.puts(blurb_id)
    LanguageCultureName.each do |language|
      blurb = BlurbTranslation.new([blurb_id.to_i],language)
      translations = blurb.get_blurbs_translation
        translations.each do |tran|
          file.puts(File::join(language,tran["translation"].insert(0,": ")))
        end
    end
    file.puts(" ")
  end
end
