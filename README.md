# Recipe Unlimited Flutter Coding Challenge

Thank you for your interest in Recipe Unlimited's engineering team. The purposes of this challenge is to assess your knowledge of Flutter and application design.

You will we reviewed based on the following items:

- Building a responsive app with Flutter.

- Write clean, easy to understand code.

- Proper separation of concerns between UI, Business Logic and Network Requests.

- Effective use of Unit Tests.

- You're free to add new dependencies.

This challenge should take no longer than 2-3 hours to complete

## Recipe Restaurants

You have the code base for a simple app. The page loads a list of restaurants from all over Canada. You are required to make the following modifications:

- Implement Geolocation to get user's coordinates and get only the stores around the user.

- Implement Restaurant Details Page. When the user taps on a restaurant from the list, make the appropriate API call (i.e: /getStoreDetails?storeNumber=1103&numberOfStoreHours=7&lang=EN)

- The Store Details should include the following information:
  - Show a view of the location using Google Maps Plugin (any)
  - Store Name
  - Full Address
  - Phone Number
  - List of Hours
- Feel free to design the screens however you want

## Getting Started

To get started, clone this repo to your local machine. Build the app against the stable Flutter channel.

## Submission

To submit your coding challenge, commit all your changes to the master branch and run the following command:

`git bundle create coding-challenge.bundle HEAD master`

Email the the generated coding-challenge.bundle file to engineering@recipeunlimited.com. We do our best to review and respond to submissions within 1-2 business days.

Thanks for taking the time to do this coding challenge and here's hoping we talk soon!
