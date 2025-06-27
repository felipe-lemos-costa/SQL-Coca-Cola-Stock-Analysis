# Coca Cola Stock Analysis
![Img1](https://github.com/felipe-lemos-costa/SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img1.jpg)

# Summary
In this project, I built a relational database in MySQL using historical stock data from Coca-Cola (KO) between 2019 and 2024. I performed data import, validation (including null checks and outlier detection), and exploratory analysis. The project includes insights on daily price variation, monthly averages, trading volume, and the creation of analytical views using SQL window functions such as RANK, LEAD, and LAG. It serves as a solid foundation for time series analysis, financial insights, and future data visualization.

# Key Insights
1. I developed a monthly analysis of Coca-Cola’s stock prices using SQL, grouping the data by month to calculate the average closing prices and identify the highest price recorded in each period. This approach provides a clear view of trends and monthly variations over time:
   
![Img2](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img2.jpg)

2. Here, I developed a query that calculates the daily variation of Coca-Cola’s stock price, showing both the difference between closing and opening prices and the percentage change relative to the opening price. The results are ordered by date to facilitate analysis of daily fluctuations:
   
![Img3](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img3.jpg)

3. Here are queries to identify the top 5 days with the highest trading volume and the top 5 days with the lowest trading volume for Coca-Cola’s stock. This analysis highlights periods of peak and minimal market activity by ordering the data in descending and ascending order of volume, respectively:

![Img4](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img4.jpg)

![Img5](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img5.jpg)

4. This SQL view selects all dates and closing prices where the closing price is higher than the overall historical average closing price of Coca-Cola stock. It provides an easy way to identify periods when the stock performed above its long-term average:

![Img6](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img6.jpg)

5. This SQL view ranks Coca-Cola’s closing prices from highest to lowest using the RANK() window function. It allows easy identification of the top-performing days based on closing price:

![Img7](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img7.jpg)

6. And to finalize, this SQL view employs the window functions LAG() and LEAD() to display the previous and next day’s closing prices alongside each date’s closing price. This facilitates the analysis of price trends and fluctuations by enabling direct comparison of consecutive trading days:

![Img8](https://github.com/felipe-lemos-costa//SQL-Coca-Cola-Stock-Analysis/raw/main/images/Img8.jpg)


# License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
