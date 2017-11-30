MEMORANDUM

To:                Wade Fergus DBM/380

From:                Nicholas Evans

Date:                November 2, 2015

Subject:        Database Environment Proposal

Working in restaurants for the past twelve years, I have found that the heart of any well running restaurant is its POS. This is the system which facilitates communication between servers and the kitchen or bar. At the core of a POS is a database with data for inventory, customers, and employees.

In designing a database for a restaurant POS there are a number of problems in the database environment which need to be addressed:

-
  - Orders need to be communicated between the servers and the kitchen/bar.
  - Each item costs a specific amount, these prices need to be tied to the items in the database.
  - Some items have limited quantity which need to be tracked and the item made unavailable when its stock is out.
  - Some items will require modifiers like steak temperature.
  - The capability to add modifiers, including custom instructions, to orders is needed by servers.
  - The items ordered by each customer need to be tracked and compiled into a bill.
  - Employee&#39;s hours and sales need to be tracked.

The objectives of the database will be to address each of these problems.

- Data entries for each menu item and modification will be created.
- When items are ordered, a ticket needs to print in the appropriate preparation area so it is made.
- When a customer orders an item it is added to a list. This list will be the check at the end.
- The quantity of items will be settable via management interface and will decrease as they are ordered.
- Employees will be assigned an ID which will be used to log into the system and clock in/out.

This database will integrate with a POS system providing employee and management interfaces. The system will communicate orders input by servers to the appropriate preparation area(s). The users of the system will be all employees as it will track hours worked. POS terminals will be used extensively by servers as the primary tool for inputting orders, printing checks, and processing payments. Payment processing is handled by the POS, outside the database.

Here is some sample data from the Menu\_Item table:

| ID | Name | Price | Req\_Option | Printer | Quantity |
| --- | --- | --- | --- | --- | --- |
| 0012 | Ribeye | 38.00 | Steak\_Temp | Kitc\_Hot |   |
| 0088 | Crème Brulee | 8.00 |   | Kitc\_Dessert | 13 |
| 0124 | Shirley Temple | 2.75 |   | Bar |   |
