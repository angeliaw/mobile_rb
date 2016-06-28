require_relative '../support/localizations'

class Language
  attr_accessor :languages, :LanguageCultureName

  def initialize
    @languages = {
        'English' => "English",
        'Portuguese' => "Português",
        'Chinese' => "简体中文",
        'French' => "Français",
        'German' => "Español",
        'Spanish' => "Español",
        'Italian' => "Italiano",
        'Korean' => "한국어",
        'Japanese' => "日本語",
        'Russian' => "Русский",
        'Turkish' => "Türkçe",
        'Thai' => "ภาษาไทย",
        'Arabic' => "العربية",
        'HKChinese' => "繁體中文（香港）",
        'TWChinese' => "繁體中文（台灣）"
    }

    @LanguageCultureName = {
        'English' => "en",
        'Portuguese' => "pt-BR",
        'Chinese' => "zh-CN",
        'French' => "fr",
        'German' => "de",
        'Spanish' => "es",
        'Italian' => "it",
        'Korean' => "ko-KR",
        'Japanese' => "ja-JP",
        'Russian' => "ru",
        'Turkish' => "tr-TR",
        'Thai' => "th",
        'Arabic' => "ar",
        'HKChinese' => "zh-HK",
        'TWChinese' => "zh-TW）"
    }

  end

  # @param [Object] str
  # @param [Object] language
  def Base::translation(str,language)
    (I18N[language] && I18N[language][str]) ? I18N[language][str] : str
  end

end
