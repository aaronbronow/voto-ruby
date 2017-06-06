module VotoMobile
  module Trees
    def trees(full_path = nil)
      list = TreesList.new(self, 'trees')
      get_data(list, 'trees', full_path)
    end
  end

  class TreesList < BaseList
    ENTITY = Tree
  end
end
