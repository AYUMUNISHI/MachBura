class Hours < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: 'ランチ' },
   { id: 3, name: 'ディナー' },
 ]

 include ActiveHash::Associations
 has_many :comments
end