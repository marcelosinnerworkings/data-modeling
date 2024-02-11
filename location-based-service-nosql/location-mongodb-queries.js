// First, define a collection for users
db.createCollection("users")

// The document structure for the users collection might look like this
db.users.insertMany([
  {
    _id: ObjectId("5f986d037c2116c94c9d76d7"), 
    username: "john_doe_moe",
    email: "john@domain.net",
    location: {
      type: "Point",
      coordinates: [-73.9857, 40.7484] 
    },
    habits: ["running", "coffee"],
    purchasePatterns: {
      lastPurchaseDate: ISODate("2023-01-15T12:00:00Z"),
      favoriteStores: ["Starbucks", "Nike Store"],
      purchaseHistory: [
        {
          date: ISODate("2023-01-10T12:00:00Z"),
          item: "Running Shoes",
          price: 100
        },
        {
          date: ISODate("2023-01-12T12:00:00Z"),
          item: "Coffee Beans",
          price: 10
        }
      ]
    }
  },
  {
    _id: ObjectId("4f986d037c2116c94c9d76d8"), 
    username: "beatrice_doe_moe",
    email: "beatrice@domain.net",
    location: {
      type: "Point",
      coordinates: [-73.9857, 40.7484] 
    },
    habits: ["jogging", "tea"],
    purchasePatterns: {
      lastPurchaseDate: ISODate("2023-01-15T12:00:00Z"),
      favoriteStores: ["Tim Hortons", "Adidas Store"],
      purchaseHistory: [
        {
          date: ISODate("2023-01-10T12:00:00Z"),
          item: "Running Shoes",
          price: 100
        },
        {
          date: ISODate("2023-01-12T12:00:00Z"),
          item: "Tea Box",
          price: 10
        }
      ]
    }
  }
])

// You can also create a 2dsphere index on the location field for geospatial queries
// However, you might also want to think about the specific requirements of your application
db.users.createIndex({ location: "2dsphere" })
