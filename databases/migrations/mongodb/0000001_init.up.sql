if (!db.getCollectionNames().includes("orders")) {
    db.createCollection("orders");
}

db.orders.insertMany([
    {
        id: "order1",
        price: 100.0,
        tax: 10.0,
        final_price: 110.0
    },
    {
        id: "order2",
        price: 200.0,
        tax: 20.0,
        final_price: 220.0
    }
]);
