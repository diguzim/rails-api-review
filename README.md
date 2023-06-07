# Rails API Project

This is a Rails API-only project that serves as a backend. It provides endpoints to manage creatures, items, drops, and user authentication. The project utilizes various gems and tools to enhance its functionality and development process.

## Features

- API-only application built with Rails
- Background job processing with Sidekiq
- Environment variable management with dotenv-rails
- User authentication with Devise and Devise-JWT
- Models: User, Creature, Item, Drop (with N x N relationship)
- Web scraping with Nokogiri to fetch content for creatures
- Testing with RSpec, VCR, Faker, Factory Bot, and SimpleCov
- Code style enforcement with Rubocop
- Containerization with Docker

## Getting Started

Follow the steps below to get the project up and running:

1. Clone the repository:
```console
git clone git@github.com:diguzim/rails-api-review.git
```
2. Copy the `.env.example` file to `.env`:
```console
cp .env.example .env
```
3. Install the required dependencies:
```console
bundle install
```
4. Start the Docker containers:
```console
docker-compose up -d
```
5. Start the Rails server:
```console
rails s
```


## Testing

The project uses RSpec for testing. To run the tests, use the following command:
```console
rspec
```

The tests are configured to use VCR for request recording and playback. This allows for real HTTP requests during the first test run, which are then cached for subsequent test runs, providing faster test execution.

## Code Quality

The project incorporates Rubocop for code style enforcement. To analyze the code and check for style violations, run the following command:
```console
rubocop
```

## Additional Notes

- Faker gem can be used to generate fake data for testing purposes.
- Factory Bot gem can be used to define factories for creating test objects.
- SimpleCov gem is used for code coverage analysis, generating reports on test coverage.

If you have any further questions, please let me know.
