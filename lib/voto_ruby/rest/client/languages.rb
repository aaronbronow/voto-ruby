module VotoMobile
  module Languages
    def languages(full_path = nil)
      list = LanguagesList.new(self, 'languages')
      get_data(list, 'languages', full_path)
    end
  end

  class LanguagesList < BaseList
    ENTITY = Language
  end
end
