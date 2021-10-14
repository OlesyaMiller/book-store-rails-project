Book.destroy_all
Genre.destroy_all

Genre.create!([{
  name: "Science"
},
{
  name: "Fiction"
},
{
  name: "Textbook"
}
])

