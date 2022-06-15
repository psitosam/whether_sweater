

![languages](https://img.shields.io/github/languages/top/psitosam/whether_sweater?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/psitosam/whether_sweater)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<div align="center">


# WELCOME TO WHETHER SWEATER
![alt text](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iRZS-IM5zL8H5VjKhjVV1odwY2jjOj_pvg&usqp=CAU)

</div>

## Description

Whether Sweater is a backend application to expose several API endpoints.The data exposed regards forecasts for a certain area, road trip directions and photography search. You can also find the weather at your end destination that is accurate to your time of arrival.This application is meant to be used either individually using [<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://learning.postman.com/docs/getting-started/introduction/) or in conjunction with a Front End application. If using a front end application, all end points should provide sufficient data to renders views and a functional user interface.


## Learning Goals

- Consume two or more external APIs
- Build APIs that return JSON responses
- Refactor code for better code organization/readability
- Create an application for use in mircroservices for a smealess, separate frontend view and backend database.
- Utilize quality workflow practices: small commits, descriptive pull requests, and code reviews
- Write thorough, understandable documentation



## Requirements and Setup (for Mac):

### Ruby and Rails
- Ruby Version 2.7.2
- Rails Version 5.2.6

### Gems Utilized
- RSpec
- Pry
- SimpleCov
- Capybara
- Shoulda-Matchers
- Faker
- jsonapi-serialize
- Figaro
- Webmock
- VCR

## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:psitosam/whether_sweater.git
```

- using https <br>
```shell
$ git clone https://github.com/psitosam/whether_sweater
```

Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory:<br>
In terminal, use `$cd` to navigate to the backend Application project directory.

```shell
$ cd whether_sweater
```

3. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

There should be be verbose text diplayed of the installation process...followed by something that looks like this:

```shell
Bundle complete! 21 Gemfile dependencies, 83 gems now installed.
```

If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

4. Database Migration<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db:{:drop,:create,:migrate,:seed}
```


5. Startup and Access<br>
Finally, in order to use the web app you will have to start the server locally and access the app through a web browser.
- Start server

```shell
$ rails s
```

- Open web browser and visit link
    http://localhost:3000/api/v1/users

At this point you should be taken to a page with an example JSON response for a user

6. After verifying that the Figaro gem has been bundled and running 'bundle exec figaro install', we are ready to start making calls to APIs. This repo uses the following APIs:
- [Map Quest's GeoCoding API](https://developer.mapquest.com/documentation/geocoding-api/) <br>
- [OpenWeather One Call API ](https://openweathermap.org/api/one-call-api) <br>
- [Unsplash Image Service API](https://unsplash.com/documentation#creating-a-developer-account) <br>

### After obtaining keys, your application.yml file should look like this :arrow_down:
```ruby  
open_weather_key: <YOUR KEY HERE >
map_quest_key: <YOUR KEY HERE >
pexels_key: <YOUR KEY HERE >
```

## Calling Endpoints
<div align="center">
 <h2> Retrieve weather for a city <h2>
</div>
</div>
<div align="left">

  ```ruby  
  GET /api/v1/forecast?location=keywest, fl
  Content-Type: application/json
  Accept: application/json
  ```
   ### Response
  ```json  
{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-04-27T11:38:05.000-04:00",
                "sunrise": "2022-04-27T06:54:52.000-04:00",
                "sunset": "2022-04-27T19:54:22.000-04:00",
                "temp": 82.49,
                "feels_like": 85.98,
                "humidity": 64,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2022-04-27",
                    "sunrise": "2022-04-27T06:54:52.000-04:00",
                    "sunset": "2022-04-27T19:54:22.000-04:00",
                    "max_temp": 82.49,
                    "min_temp": 76.41,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2022-04-28",
                    "sunrise": "2022-04-28T06:54:07.000-04:00",
                    "sunset": "2022-04-28T19:54:51.000-04:00",
                    "max_temp": 77.52,
                    "min_temp": 76.75,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-04-29",
                    "sunrise": "2022-04-29T06:53:22.000-04:00",
                    "sunset": "2022-04-29T19:55:21.000-04:00",
                    "max_temp": 77.52,
                    "min_temp": 76.82,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-04-30",
                    "sunrise": "2022-04-30T06:52:38.000-04:00",
                    "sunset": "2022-04-30T19:55:50.000-04:00",
                    "max_temp": 78.13,
                    "min_temp": 77.14,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-05-01",
                    "sunrise": "2022-05-01T06:51:55.000-04:00",
                    "sunset": "2022-05-01T19:56:20.000-04:00",
                    "max_temp": 78.28,
                    "min_temp": 77.45,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "11:00:00",
                    "temperature": 81.45,
                    "min_temp": 81.45,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "12:00:00",
                    "temperature": 82.49,
                    "min_temp": 82.49,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "time": "13:00:00",
                    "temperature": 81.5,
                    "min_temp": 81.5,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "14:00:00",
                    "temperature": 80.55,
                    "min_temp": 80.55,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "15:00:00",
                    "temperature": 79.59,
                    "min_temp": 79.59,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "16:00:00",
                    "temperature": 78.6,
                    "min_temp": 78.6,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "17:00:00",
                    "temperature": 77.7,
                    "min_temp": 77.7,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "18:00:00",
                    "temperature": 77.72,
                    "min_temp": 77.72,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
  ```
</div>
<div align="center">
 <h2> Retrieve image for a city <h2>
</div>
<div align="left">

  ```ruby  
  GET /api/v1/backgrounds?location=richmond,va
  Content-Type: application/json
  Accept: application/json
  ```
   ### Response
  ```json  
  {
      "data": {
          "type": "image",
          "id": null,
          "attributes": {
              "image": {
                  "image_id": "qxNbd5sBWvA",
                  "description": "Richmond, pac-man.",
                  "url": "https://images.unsplash.com/photo-1596818880803-d53d87d24c75?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxyaWNobW9uZCUyQ3ZhfGVufDB8fHx8MTY1NTMyMzM2Mg&ixlib=rb-1.2.1&q=80"
              },
              "credit": {
                  "website_source": "https://unsplash.com",
                  "photographer": "STEPHEN POORE",
                  "photographer_profile": "https://api.unsplash.com/users/stephenpoore804"
              }
          }
      }
  }
  ```
</div>

<div align="center">
 <h2> Register A User <h2>
</div>
<div align="left">

  ```ruby  
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
  ```
   ### Response
  ```json  
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
  ```
</div>

<div align="center">
 <h2> Log In A User <h2>
</div>
<div align="left">

  ```ruby  
POST /api/v1/users
Content-Type: application/json
Accept: application/json

POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
  ```
   ### Response
  ```json  
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
  ```
</div>

<div align="center">
 <h2> Plan A Road Trip <h2>
</div>
<div align="left">

  ```ruby  
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
  ```
   ### Response
  ```json  
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
  ```
</div>




## **Contributors** 

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>

  <tr>

   <td align="center"><a href="https://github.com/psitosam"><img src="https://avatars.githubusercontent.com/u/95240894?s=400&u=ac9638ff6700dfed2d28d9f9df934fcd1be02635&v=4" width="100px;" alt=""/><br /><sub><b>Alex (he/him)</b></sub></a><br />

    </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
