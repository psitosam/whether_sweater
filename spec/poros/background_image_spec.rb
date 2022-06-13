require 'rails_helper'

RSpec.describe BackgroundImage do

    let(:data) {
      {
            "id": "v_e3Hha4EBA",
            "created_at": "2018-11-10T12:58:39-05:00",
            "updated_at": "2022-06-13T06:05:14-04:00",
            "promoted_at": nil,
            "width": 3934,
            "height": 2832,
            "color": "#0c2626",
            "blur_hash": "LVF#m$t6WB%1~URkIpxZodRkRjNH",
            "description": "Feb. 17, 2010, U.S. President Barack Obama, accompanied by members of Congress and middle school children, waves as he talks on the phone from the Roosevelt Room of the White House to astronauts on the International Space Station.",
            "alt_description": "Barack Obama",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1541872703-74c5e44368f9?ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1541872703-74c5e44368f9?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2&ixlib=rb-1.2.1&q=80",
                "regular": "https://images.unsplash.com/photo-1541872703-74c5e44368f9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1541872703-74c5e44368f9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1541872703-74c5e44368f9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2&ixlib=rb-1.2.1&q=80&w=200",
                "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1541872703-74c5e44368f9"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/v_e3Hha4EBA",
                "html": "https://unsplash.com/photos/v_e3Hha4EBA",
                "download": "https://unsplash.com/photos/v_e3Hha4EBA/download?ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2",
                "download_location": "https://api.unsplash.com/photos/v_e3Hha4EBA/download?ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2"
            },
            "categories": [],
            "likes": 324,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": nil,
            "topic_submissions": {
                "history": {
                    "status": "approved",
                    "approved_on": "2020-06-16T09:06:53-04:00"
                }
            },
            "user": {
                "id": "XOV3VL2RAKk",
                "updated_at": "2022-06-12T14:33:31-04:00",
                "username": "historyhd",
                "name": "History in HD",
                "first_name": "History in HD",
                "last_name": nil,
                "twitter_username": nil,
                "portfolio_url": nil,
                "bio": "Important people and events from history updated for the 21st-century using the latest in recolourization and upscaling artificial intelligence techniques. ",
                "location": "Earth",
                "links": {
                    "self": "https://api.unsplash.com/users/historyhd",
                    "html": "https://unsplash.com/@historyhd",
                    "photos": "https://api.unsplash.com/users/historyhd/photos",
                    "likes": "https://api.unsplash.com/users/historyhd/likes",
                    "portfolio": "https://api.unsplash.com/users/historyhd/portfolio",
                    "following": "https://api.unsplash.com/users/historyhd/following",
                    "followers": "https://api.unsplash.com/users/historyhd/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1541725625858-8b45e61d2ada?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                    "medium": "https://images.unsplash.com/profile-1541725625858-8b45e61d2ada?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                    "large": "https://images.unsplash.com/profile-1541725625858-8b45e61d2ada?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                },
                "instagram_username": nil,
                "total_collections": 0,
                "total_likes": 0,
                "total_photos": 17,
                "accepted_tos": true,
                "for_hire": false,
                "social": {
                    "instagram_username": nil,
                    "portfolio_url": nil,
                    "twitter_username": nil,
                    "paypal_email": nil
                }
            },
            "tags": [
                {
                    "type": "search",
                    "title": "barack obama"
                },
                {
                    "type": "search",
                    "title": "washington dc"
                },
                {
                    "type": "search",
                    "title": "president of the united states of america"
                }
            ]
        }
    }

  let(:image) { BackgroundImage.new(data) }

  it 'exists and has readable attributes' do
    expect(image).to be_a BackgroundImage
    expect(image.website_source).to eq('https://unsplash.com')
    expect(image.image_id).to eq("v_e3Hha4EBA")
    expect(image.description).to eq("Feb. 17, 2010, U.S. President Barack Obama, accompanied by members of Congress and middle school children, waves as he talks on the phone from the Roosevelt Room of the White House to astronauts on the International Space Station.")
    expect(image.url).to eq("https://images.unsplash.com/photo-1541872703-74c5e44368f9?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzczMDV8MHwxfHNlYXJjaHwxfHxXYXNoaW5ndG9uJTJDREN8ZW58MHx8fHwxNjU1MTM5OTk2&ixlib=rb-1.2.1&q=80")
    expect(image.photographer).to eq("History in HD")
    expect(image.photographer_profile).to eq("https://api.unsplash.com/users/historyhd")
  end
end
