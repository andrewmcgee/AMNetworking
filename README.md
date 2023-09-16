# AMNetworking

## Background 

A simple package used to encapsulate networking functionality for my projects. Essentially it is a fully tested and mockable wrapper around URLSession.

## Installation

### Swift Package

AMNetworking can be added to an Xcode project as a swift package. Using the regular Xcode tool, search for the following URL:

https://github.com/andrewmcgee/AMNetworking.git

## Usage

Create an instance of a SingleEndpoint by specifying the various URL and request parameters. Alternatively, define your own type conforming to the Endpoint protocol. For example, you may wish to group related endpoints for a single host together, using an enum conforming to the Endpoint protocol.

Once you have an Endpoint, use an instance of a DefaultHttpClient to perform requests by passing the Endpoint value to performRequest(to:cachePolicy:timeoutInterval:).
