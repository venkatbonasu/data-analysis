import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Venkat@3655"
)
mycursor = mydb.cursor()
mycursor.execute("CREATE DATABASE IF NOT EXISTS Library")
print("Database created or already exists.")

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Venkat@3655",
    database="Library"
)
mycursor = mydb.cursor()

mycursor.execute("DROP TABLE IF EXISTS books")
mycursor.execute("""
CREATE TABLE books (
    id VARCHAR(10),
    bookname VARCHAR(100),
    author VARCHAR(100),
    date_of_publication VARCHAR(20),
    price FLOAT
)
""")
print("Table 'books' created.")

sql = "INSERT INTO books (id, bookname, author, date_of_publication, price) VALUES (%s, %s, %s, %s, %s)"
values = [
    ("B001", "The Alchemist", "Paulo Coelho", "01-05-1988", 299.99),
    ("B002", "Wings of Fire", "A.P.J Abdul Kalam", "15-07-1999", 399.50),
    ("B003", "The Hobbit", "J.R.R. Tolkien", "21-09-1937", 250.75)
]
mycursor.executemany(sql, values)
mydb.commit()
print("Records inserted.")

print("\n All books in library:")
mycursor.execute("SELECT * FROM books")
for row in mycursor.fetchall():
    print(row)

update_sql = "UPDATE books SET price = %s WHERE id = %s"
mycursor.execute(update_sql, (499.99, "B002"))
mydb.commit()
print("\n Book price updated.")


delete_sql = "DELETE FROM books WHERE id = %s"
mycursor.execute(delete_sql, ("B003",))
mydb.commit()
print("\n Book deleted.")


print("\n Final books in library:")
mycursor.execute("SELECT * FROM books")
for row in mycursor.fetchall():
    print(row)

mycursor.close()
mydb.close()
