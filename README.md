# Neli To Do List

## Ruby Version

This application requires Ruby version 3.1.2. Ensure that you have the correct Ruby version installed. You can use [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/) to manage Ruby versions.

## Configuration

1. **Clone the repository:**

    ```bash
    git clone https://github.com/nelicreative/neli-todo
    cd neli-todo
    ```

2. **Install Ruby dependencies:**

    ```bash
    bundle install
    ```

3. **Configure the database:**

    Create a `.env` file in the root directory of the project and add your database configuration. You can use the `.env.example` file as a reference:

    ```bash
    cp .env.example .env
    ```

    Update `.env` with your PostgreSQL database credentials.

4. **Create and migrate the database:**

    ```bash
    bin/rails db:create
    bin/rails db:migrate
    bin/rails db:seed
    ```

5. **Install JavaScript dependencies:**

    ```bash
    yarn install
    ```

6. **Precompile assets (if needed):**

    ```bash
    bin/rails assets:precompile
    ```

## Database Creation

To create the database, run:

    ```bash
    bin/rails db:create
    ```
To set up the database with the necessary tables and seed data, run:

    ```bash
    bin/rails db:migrate
    bin/rails db:seed
    ```