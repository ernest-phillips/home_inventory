# Home Inventory App

A simple Ruby on Rails API application to manage home inventory, allowing users to track residences and items stored within them.

![CI](https://github.com/ernest-phillips/home_inventory/actions/workflows/ci.yml/badge.svg)
![Ruby Version](https://img.shields.io/badge/Ruby-3.1-red.svg)
![Rails Version](https://img.shields.io/badge/Rails-7.1-blue.svg)

## Tech Stack

- Ruby 3.2
- Ruby on Rails 7
- PostgreSQL (or SQLite if local)
- RSpec (for testing)
- FactoryBot (for test data)
- Rubocop (for code linting)

## Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/ernest-phillips/home_inventory.git
   cd home_inventory

2. Install dependencies
```bash
  bundle install
  yarn install --check-files
```
3. Set up the database
```bash
  rails db:create db:migrate db:seed
```
4. Start the Rails server:
```bash
  rails server
````
Visit http://localhost:3000.

### Running Tests
Run the full test suite using:
```bash
  bundle exec rspec
````
You can also check code style with:
```bash
  bundle exec rubocop
```
