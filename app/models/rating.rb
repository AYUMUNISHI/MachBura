class Rating < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '☆１' },
   { id: 3, name: '☆1.5' },
   { id: 4, name: '☆2.0' },
   { id: 5, name: '☆2.5' },
   { id: 6, name: '☆3.0' },
   { id: 7, name: '☆3.5' },
   { id: 8, name: '☆4.0' },
   { id: 9, name: '☆4.5' },
   { id: 10, name: '☆5.0' },
 ]

 include ActiveHash::Associations
 has_many :comments
end