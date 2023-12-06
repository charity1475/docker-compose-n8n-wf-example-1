
# [n8n Workflow with MySQL Database and REST API Integration](https://www.chakray.com/automating-processes-n8n/)

This guide demonstrates a simple n8n workflow that involves retrieving data from a MySQL database, performing data transformation, and making a POST request to a REST API using the transformed data. The workflow is orchestrated using n8n, a low-code process automation tool that allows users to create custom processes and automate tasks across various applications and services.

## Prerequisites

Before proceeding, ensure you have a basic understanding of the following technologies:

- Docker
- Docker Compose
- MySQL

## What is n8n?

[n8n](https://n8n.io/) is a low-code process automation tool that empowers users to create custom workflows and automate tasks across different applications and services. It can be self-hosted at no cost, and n8n also provides enterprise support for self-hosted installations and a cloud service for those who prefer not to maintain an n8n installation in their infrastructure.



## Set Up n8n with Docker Compose

Using Docker Compose is a convenient way to run the n8n server and backend services (database and REST API) in a single, easily manageable local environment.

### Docker Compose Configuration

To set up n8n with Docker Compose, define the necessary services in a `docker-compose.yml` file. The file specifies images, environment variables, configurations, and service connections. The services include:

- **n8n service:** Orchestrates the workflow and integrates different services.
- **MySQL service:** Manages product registration and retrieval in a database.
- **API service:** Provides an endpoint (`http://api:3000/products/mysql`) for creating a new product and returns a JSON response (`{"status": "success"}`).

Here's an example `docker-compose.yml`:

```yaml
version: '3.8'
services:
  # n8n
  n8n:
    image: n8nio/n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH=true
      - N8N_BASIC_AUTH_USERNAME=myusername
      - N8N_BASIC_AUTH_PASSWORD=mypassword

  # MySQL
  mysql:
    image: mysql:latest
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=mypassword
      - MYSQL_DATABASE=mydatabase
      - MYSQL_USER=myuser
      - MYSQL_PASSWORD=mypassword
    ports:
      - "3306:3306"
    volumes:
      - ./scripts/mysql:/docker-entrypoint-initdb.d

  # API REST
  api:
    build:
      context: ./simple-api-rest
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    command: npm run start
```

### Set Up and Run

1. Clone the repository [docker-compose-n8n-wf-example-1](https://github.com/ChakrayES/docker-compose-n8n-wf-example-1).

2. Navigate to the `n8n-application-post` folder and run:

    ```bash
    docker compose build
    ```

3. Pull the images of n8n and MySQL with the latest version:

    ```bash
    docker compose pull
    ```

4. Start the services:

    ```bash
    docker compose up
    ```

## n8n Workflow

The example workflow comprises connected nodes that periodically gather information about products created in the last day from a MySQL database. The workflow then transforms the data to generate a JSON request, sending it to a specific endpoint via an HTTP POST request. The workflow is triggered daily at 8 am.

### Workflow Configuration

1. Open your n8n instance in a browser (http://localhost:5678/).

2. Skip the setup and click on "Start a new workflow from scratch."

3. In settings, click "Import from URL" and enter the URL to the JSON configuration stored in GitHub: [Workflow.json](https://raw.githubusercontent.com/ChakrayES/docker-compose-n8n-wf-example-1/main/Workflow.json).

4. Save the workflow.

For a detailed explanation of article creation, see the [Chakray documentation](https://www.chakray.com/automating-processes-n8n/).

Happy automating!


