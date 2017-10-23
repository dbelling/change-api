# README

This is an [API-only](http://edgeguides.rubyonrails.org/api_app.html#why-use-rails-for-json-apis-questionmark) Ruby on Rails application for optimizing the combination of coins to make change for a specified amount.
Currently, there are 2 methods to interact with this API:

* A `GET` request may be issued to `/change.json?amount=#{}` where amount is a float (ie. 1.05).

* A `POST` request may be issued to `/make_change.json` with a JSON-formatted payload containing an "amount" field, ie:

```json
{
  "amount": 2.35
}
```

For appropriately formatted payloads or parameters, these requests should return 200/201 respectively. Feel free to kick the tires on the [demo](https://change-api.herokuapp.com/).

Hope you find this useful! Get at me with any questions by [opening an issue](https://github.com/dbelling/change-api/issues) here, or emailing me at [danhbelling@gmail.com](mailto:danhbelling@gmail.com).
