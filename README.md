# Factoring Rate Calculator

The Factoring Rate Calculator is a sample web app developed using Ruby on Rails. It is designed to calculate the amount that a customer would receive if he discounts a trade bill for a given rate.

## Ruby Version

This application was created using Ruby 2.3 and Rails 5.1.

# Database

This app uses a MySQL database by default with the following schemas:

*   factoring_rate_calculator_development
*   factoring_rate_calculator_test
*   factoring_rate_calculator_production

## Tables

Each schema contains the following tables:

*   **Companies:** Contains the names of the companies which have requested a trade bill rate through one of their employees. Each company can contain many customers.
*   **Customers:** Contains the names and e-mails of the customers that have requested a trade bill rate. Each customer belongs to one company and can own several requests.
*   **Rates:** Contains all the rates that can be used by this app. Currently there is only the default rate of 1.65% each 10 days, however more rates can be added to this table in the future.
*   **Requests:** Contains all the requests that were made. Each request belongs to a customer and uses a rate (currently only the default rate is supported).

## Database Initialization

This app contains a `seed.rb` file that contains sample data for the development and test environments and data for the production environment.
