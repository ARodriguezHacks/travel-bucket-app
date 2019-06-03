# TravelBucket

## Description
TravelBucket is the travel enthusiast's social media app. Users can read and write posts, comment on fellow users' posts and keep the conversation going on all things travel. With so many social media apps out in the interwebs, sometimes it's refreshing to find a place where the topic never changes. Users must sign up for the service in order to start contributing posts and comments with the app providing Standard and Premium memberships. Users first start out as Standard members, but can become Premium members through invitation. Only Premium members can create new topics, but additional features abound for any casual user of TravelBucket.

![Travel Bucket About Page](app/assets/images/travelbucketabout.png)

## Viewing the Project

You can view a working demo on Heroku: https://travelbucketapp.herokuapp.com/

# Getting Started

## Installing

Make sure you have installed Ruby and Ruby on Rails

`git clone git@github.com/ARodriguezHacks/travel-bucket-app.git` or create a fork.

![TravelBucket Comment Video](https://media.giphy.com/media/2uIlk7Mm7jcZhgrCm8/giphy.gif)

## Technologies Used:

* Ruby / Rails
* RSpec 
* Bootstrap 5 (CSS)

## Features

* Complete suite of CRUD actions for posts and comments (and topics for admin users)
* Ability to favorite posts
* Ability to upvote and downvote on comments
* A user profile page which outlines the user's created posts, comments, and favorites
* User avatar generator through Gravatar (You must sign up for a Gravatar account for your avatar to appear)

## Sample Code

The example code below is the User model. Through ActiveRecord associations, User model here is indicating that posts, comments, votes and favorites can only be created by having a user attribute

```
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: true },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  enum role: [:member, :admin]
  
  ...
  
```

## Screenshots

![Travel Bucket Landing Page](app/assets/images/travelbucketlanding.png)

![Travel Bucket Topic Page](app/assets/images/travelbuckettopic.png)

![Travel Bucket Post Page](app/assets/images/travelbucketpost.png)

## How to Contribute

If you would like to contribute to TravelBucket please send an email to angrodri902@gmail.com.
