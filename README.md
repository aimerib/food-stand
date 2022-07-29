# README

This application uses scheduled background jobs to retrieve data from the SF api daily and update the records with any new entries not yet in the database.
The scheduled job kicks of an [Interactor](https://github.com/collectiveidea/interactor/) organizer - `GetApiDataAndGenerateFoodStands` - that breaks up each step of retrieving, parsing, and using the SF api data to create new Stand records. Breaking up the business logic in steps like this makes it easier to think about each of the steps individually, as well as refactor the code later.

There are two controllers that are responsible for handling user interactions:
- `PublicController` - root route. When querying the app for a specific cuisine nearest to Union Square, this controller is also responsible to re-directing the user to the `StandsController` with the results of the query for display. Route responds to both HTML and JSON.
Example json query:
```json
// POST /
// headers:
// "Accept application/json"
// "ContentType application/json"
// body:
{
    "search_term": "japanese"
}
```
- `StandsController` - responsible for displaying Stand records. This controller responds to both html and json requests.

The Stand model includes `act_as_mapable` from the [GeoKit](https://github.com/geokit/geokit-rails) gem. This gem extends records which include latitude and longitude information to allow geolocation operations on these records. We can then use the provided scope `.closest` to find the nearest Stand record to a given coordinate.

Views are styled using `TailwindCSS`, and flash notices are dismissed after a timeout event controlled by a `Stimulus` controller.


## Development environment

### System dependencies
- Ruby 3.0.2
- SQLite3

### Install the dependencies

```shell
bundle install
```

### Run database migrations

```shell
bin/rails db:migrate
```

### Start the server locally

```shell
./bin/dev
```

Open `http://localhost:3000` in a browser.

### Run tests

```shell
./bin/rails test
```

## Caveats and Improvements

- Currently, the SF api data is retrieved directly from the `GetApiData` interactor. For an application this small with a dataset that changes only once a day, this is sufficient, but in production a better strategy would be to write an API client class to encapsulate each relevant endpoint around specific actions needed by the system.
- I'm using the pythagorean equation to calculate distances between each coordinates. This works for flat surfaces, but it will provide unreliable results when calculating distant points on a sphere, such as two cities accross longitudes. For an intra-city application, this works ok, but not really ideal. For a production app, I would reach out to an api such as Google Maps to make these calculations for me with better accuracy. I chose not to do that here to keep the development environment simple and not require an API key from a third party service.
- SQLite3 works perfectly fine for many types of applications, and is well suited for this project, but on a larger project I would have chosen a more robust engine, such as Postgresql and planned for a more robust environment.
- I'm using the [Delayed::Job](https://github.com/collectiveidea/delayed_job) adapter for ActiveJob along with the [delayed_job_recurring](https://github.com/amitree/delayed_job_recurring) plugin to avoid adding another system dependency such as `Redis` and use the database to queue jobs, but in production I would likely use a `Sidekiq/Redis` combo to schedule jobs.
- The data provided from the API doesn't include any categorization for the food stands, aside from what is provided on the description of each stand. To search for a specific cuisine, such as "Japanese", I have to use a regex match on the Stand description field. SQLite doesn't include a regex function, so I could see two alternatives here: 
    - Get each active record, select only the ones where the description matched the regex, and then use a function to calculate the distance between each point and Union Square using the pythagorean equation and sort the records manually by distance
    - Continue using the GeoKit gem for the distance calculation, and extend SQLite with a regex function. I chose this option for simplicity sake, however a big caveat of this approach is that when matching agains a description, we will also recieve partial matches. A search consisting of "nese" would match "Japanese ramen cart", "Vietnamese pho", and "Dairy Spa, where one find oneself". For this reason, this approach only works for full word search.

Alternatively, the issue with how to seach for a specific food stall cuisine could be handled by breaking up the description into tags/categories. This could be accomplished by splitin the string on  "`/:| - |\//`", then adding each item of the array to the Stand as a tag/category. While this would work, it is very brittle, and the formatting of the description is very inconsistent.