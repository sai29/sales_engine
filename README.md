## Sales Engine
* Build a sales engine which takes an input of csvs of customers, transactions, invoices, merchants. Build a system to query data to monitor sales


Data source

 
We have several files of source data including:

* ```customers.csv``` - customer names and other attributes
* ```transactions.csv``` - individual transactions with a marker relating a customer, merchant, invoice, and credit card
* ```invoices.csv``` - invoices that link transactions to invoice items and hold a status
* invoice_items.csv``` - the item, quantity, and unit price paid for an item in a transaction
* ```items.csv``` - items available for sale at the merchants
* ```merchants.csv``` - merchant names and identifying information


Understandings

* The data was created from customer orders where:
* One invoice connects the customer to multiple invoice items, one or more transactions, and one merchant
* At least one transaction where their credit card is charged. If the charge fails, more transactions may be created for that single invoice.
* One or more invoice items: one for each item that they ordered
* The transaction references only the invoice
* The invoice item references an item and an invoice
* The item is connected to many invoice items and one merchant
* The merchant is connected to many invoices and many items
* Prices, as represented in the CSVs, are in cents. Anytime you return a revenue total (like in Merchant#revenue) you must return a BigDecimal representating dollars and cents (two decimals, rounded to the nearest cent).


Restrictions

Project implementation may not use:

* Databases (sqlite3, PostgreSQL, MySQL, MongoDB, Redis, etc)
* Rails’ ActiveRecord library or a similar object-relational mappers (including Sequel, DataMapper, etc)
* Your implementation may not use Struct or OpenStruct
* Metaprogramming (method_missing, define_method, etc)
