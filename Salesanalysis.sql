CREATE TABLE Details (
    Order_ID VARCHAR(255),
    Amount DECIMAL,
    Profit DECIMAL,
    Quantity INT,
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
    PaymentMode VARCHAR(255)
);

CREATE TABLE Orders (
    Order_ID VARCHAR(255),
    Order_Date DATE,
    CustomerName VARCHAR(255),
    State VARCHAR(255),
    City VARCHAR(255)
);

SELECT
    Orders.Order_ID,
    Orders.Order_Date,
    Orders.CustomerName,
    Orders.State,
    Orders.City,
    Details.Amount,
    Details.Profit,
    Details.Quantity,
    Details.Category,
    Details.Sub_Category,
    Details.PaymentMode
FROM
    Orders
JOIN
    Details
ON
    Orders.Order_ID = Details.Order_ID;
---------------------------------------------------------------
SELECT
    State,
    SUM(Amount) AS Total_Sales_Amount
FROM
    Orders
JOIN
    Details
ON
    Orders.Order_ID = Details.Order_ID
GROUP BY
    State
ORDER BY
    Total_Sales_Amount DESC;
---------------------------------------------------------------
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM
    Details
GROUP BY
    Category
ORDER BY
    Total_Profit DESC;
---------------------------------------------------------------
SELECT
    CustomerName,
    SUM(Amount) AS Total_Sales_Amount
FROM
    Orders
JOIN
    Details
ON
    Orders.Order_ID = Details.Order_ID
GROUP BY
    CustomerName
ORDER BY
    Total_Sales_Amount DESC
LIMIT 5;
