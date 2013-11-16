San Fransisco Filming Locations
==============

I scoped this mini-project to ~7 hours due to time constraints from multiple school/work projects.

[Resume](https://drive.google.com/file/d/0B_cOclhBCzfUR2I4U1UtR2ZXNzg/edit?usp=sharing)

Other Code Sample
: [https://github.com/jgerbasi/237-term-project](https://github.com/jgerbasi/237-term-project)

* Used node.js and socket.io to create multiplayer, multiplatform shooting game
* Team of three (I worked on complete server side, socket, and client javascript logic)
* [Youtube Demo](http://www.youtube.com/watch?v=-YT8ZU4Z3vU&feature=c4-overview&list=UU5XgAnzbTgBxxHd7-f8ZSxQ)

Technical Stack
---
* Ruby backend
  * I chose a scripting language for the backend due to the application's simplicity. I am also most familiar with ruby and the rubygems available for use. In my personal opinion, ruby has a highly self-explanatory syntax.

* Sinatra framework
  * I am pretty familiar with using the Rails framework but I had no prior experience using Sinatra. I chose Sinatra over Rails since this was a very simple application - there was no need for the overhead/boilerplate code that Rails produces. The main reason for using a framework was to simplify routing + speed up development time.

* PostgreSQL database
  * Originally during development I was using a Sqlite3 database but I switched to Postgres for Heroku deployment. This application could have simply used a JSON file or even API requests to the data source rather than a database layer but I felt speed and reliability were increased if I hosted the data source myself. Wrapping the ActiveRecord ORM over the data also makes the model code easier to read + understand.

* HTML5/CSS3/JQuery frontend
  * Pretty much the standard, JQuery simplifies Javascript a ton

* Heroku hosting
  * Free & supports rack-style applications

Third Party API's
---
* Google Maps API
  * Used for generating the map & markers

* Google Geocoding Service
  * Geocoder gem abstracted this, used for getting coordinate information

Libraries
---
* Twitter Bootstrap typeahead.js
  * Dual purpose of autocomplete + typeahead in search box
