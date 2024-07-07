class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '日本料理' },
   { id: 3, name: '居酒屋' },
   { id: 4, name: 'イタリアン' },
   { id: 5, name: '中華料理' },
   { id: 6, name: 'バー' },
   { id: 7, name: 'フレンチ' },
   { id: 8, name: '郷土料理' },
   { id: 9, name: 'うどん' },
   { id: 10, name: 'そば' },
   { id: 11, name: '料理旅館' },
   { id: 12, name: 'ラーメン' },
   { id: 13, name: 'タイ料理' },
   { id: 14, name: 'ステーキ' },
   { id: 15, name: '焼き鳥' },
   { id: 16, name: 'ケーキ' },
   { id: 17, name: '喫茶店' },
   { id: 18, name: 'カフェ' },
   { id: 19, name: 'パン屋' },
   { id: 20, name: '洋食' },
   { id: 21, name: 'その他' },
 ]

 include ActiveHash::Associations
  has_many :stores

 end