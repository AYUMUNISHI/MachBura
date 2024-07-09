class Count < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '1回目' },
   { id: 3, name: '2回目' },
   { id: 4, name: '3回目' },
   { id: 5, name: '4回目' },
   { id: 6, name: '5回目' },
   { id: 7, name: '6回目' },
   { id: 8, name: '7回目' },
   { id: 9, name: '8回目' },
   { id: 10, name: '9回目' },
   { id: 11, name: '10回目' },
   { id: 12, name: '11回目' },
   { id: 13, name: '12回目' },
   { id: 14, name: '13回目' },
   { id: 15, name: '14回目' },
   { id: 16, name: '15回目' },
   { id: 17, name: '16回以上' },
 ]

 include ActiveHash::Associations
 has_many :comments
end