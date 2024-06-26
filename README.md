# Task Manager

This project aims to put into practice what I'm learning while studying Elixir, particularly focusing on web development with the Phoenix framework.

The idea is to create an application to manage tasks efficiently, leveraging various tools to enhance its functionality and performance.

## Functionalities:
* Create, read, update, and delete tasks.
* Track task status (pending, in-progress, completed, etc.).
* Assign tasks to different users.
* Generate reports on tasks.
* User authentication and authorization.
* Schedule tasks to be executed automatically.
* Upload and share files related to tasks.
* User roles and permissions management.
* Refresh tokens for session management.
* Logout functionality.

### Features

#### Authentication
- [ ] It should be able to authenticate using email & password.
- [ ] It should be able to authenticate using social networks.
- [ ] It should be able to recover password using email.
- [ ] It should be able to change email.
- [ ] It should be able to create an account (email, name, and password).
- [ ] It should support refresh tokens for session management.
- [ ] It should support logout functionality.

#### User Roles and Permissions
- [ ] Define roles such as Admin, Manager, and User.
- [ ] Assign roles to users.
- [ ] Restrict access to certain features based on roles.
- [ ] Implement role-based access control (RBAC).

#### Task Management
- [ ] It should be able to create a new task.
- [ ] It should be able to read details of a task.
- [ ] It should be able to update an existing task.
- [ ] It should be able to delete a task.
- [ ] It should be able to list tasks and filter by status.
- [ ] It should be able to assign tasks to users.
- [ ] It should be able to track task status (pending, in-progress, completed, etc.).
- [ ] It should be able to generate reports on tasks.
- [ ] It should be able to upload and share files related to tasks.

#### Scheduling
- [ ] It should be able to schedule tasks to be executed at specific times.

### Task Status
1. Pending
2. In progress
3. Completed
4. Canceled
5. In definition

## Instructions:
* Clone the repository.
* Creat a .env file and fill in using .env.example as base.
* Install dependencies with `mix deps.get`.
* Set up the database with `mix ecto.setup`.
* Start the Phoenix server with `mix phx.server`.
* Access the application at [http://localhost:4000](http://localhost:4000).

## Using Docker:
1. Clone the repository.
2. Build the Docker image with `docker-compose build`.
3. Start the application with `docker-compose up`.
4. Access the application at [http://localhost:4000](http://localhost:4000).

## Additional Tools
* **PostgreSQL**: Primary database for storing task data.
* **Mailhog**: Development tool for capturing email notifications.

## Notes:
* Ensure Docker is installed on your local machine before running the application.
* The application is for demonstration purposes and may lack some features found in production-ready software.

## Learn more

  * Official website: [https://www.phoenixframework.org/](https://www.phoenixframework.org/)
  * Guides: [https://hexdocs.pm/phoenix/overview.html](https://hexdocs.pm/phoenix/overview.html)
  * Docs: [https://hexdocs.pm/phoenix](https://hexdocs.pm/phoenix)
  * Forum: [https://elixirforum.com/c/phoenix-forum](https://elixirforum.com/c/phoenix-forum)
  * Source: [https://github.com/phoenixframework/phoenix](https://github.com/phoenixframework/phoenix)
