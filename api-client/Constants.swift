//
//  Constants.swift
//  api-client
//
//  Created by KaKin Chiu on 1/12/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import Foundation

//Callbacks
//Typealias for callbacks used in Data Service
typealias callback = (_ success:Bool) ->()

//Base URL
let BASE_API_URL = "http://localhost:3005/api/v1"

//Get all food trucks
let GET_ALL_FT_URL = "\(BASE_API_URL)/foodtruck"

//Get all reviews for a specific food truck
let GET_ALL_FT_Reviews = "\(BASE_API_URL)/foodtruck/reviews"

// POST add new Food Truck
let POST_ADD_NEW_TRUCK = "\(BASE_API_URL)/foodtruck/add"

//POST add review for a specific food truck
let POST_ADD_NEW_REVIEW = "\(BASE_API_URL)/foodtruck/reviews/add"


//Boolean auth UserDefaults keya
let DEFAULTS_REGISTERED = "isRegistered"
let DEFAULTS_AUTHENTICATED = "isAuthenticated"

//Auth Email
let DEFAULTS_EMAIL = "email"

//Auth Token
let DEFAULTS_TOKEN = "authToken"

//REGISTER url
let POST_REGISTER_ACCT = "\(BASE_API_URL)/account/register"

let POST_LOGIN_ACCT = "\(BASE_API_URL)/account/login"






















