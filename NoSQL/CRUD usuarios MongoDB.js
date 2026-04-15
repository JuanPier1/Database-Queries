//Insertar
//Insertar Uno
db.usuarios.insertOne({
  nombre: "Jorge Gutierritos",
  email: "gutierritos@email.com",
  edad: 30,
  ciudad: "México",
  activo: true,
  fechaRegistro: new Date()
})
//Insertar Varios
db.usuarios.insertMany([
  {
    nombre: "Ana López",
    email: "ana@email.com",
    edad: 32,
    ciudad: "Guadalajara",
    activo: true,
    fechaRegistro: new Date()
  },
  {
    nombre: "Carlos Ruiz",
    email: "carlos@email.com",
    edad: 24,
    ciudad: "Monterrey",
    activo: false,
    fechaRegistro: new Date()
  }
])

//Buscar
//Obtener todos
db.usuarios.find()
//Condición
db.usuarios.find({ activo: true })
//Obtener uno
db.usuarios.findOne({ email: "carlos@email.com" })
//Campos específicos
db.usuarios.find({}, { nombre: 1, email: 1, _id: 0 })

//Actualizar
//actualizar uno
db.usuarios.updateOne(
  { email: "gutierritos@email.com" },
  { $set: { edad: 32 } }
)
//actualizar varios
db.usuarios.updateMany(
  { activo: false },
  { $set: { activo: true } }
)
//Eliminar
//Eliminar uno
db.usuarios.deleteOne({ email: "carlos@email.com" })
//Eliminar varios
db.usuarios.deleteMany({ activo: false })

db.students.insertMany([
  { id: 1, name: 'Ryan', gender: 'M' },
  { id: 2, name: 'Joanna', gender: 'F' }
]);
db.students.find({ gender: 'F' });