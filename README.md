# AMNetworking

## Background 

A simple package used to encapsulate the networking functionality of my projects. Essentially it is a fully tested and mockable wrapper around URLSession.

## Installation

### Swift Package

AMNetworking can be added to an Xcode project as a swift package. Using the regular Xcode tool, search for the following URL:

https://github.com/andrewmcgee/AMNetworking.git

## Usage

Create an instance of an HttpClient and perform requests by passing Endpoint values to performRequest(to:cachePolicy:timeoutInterval:). Clients should either create instances of a SingleEndpoint in simple use-cases, but are also free to define their own types conforming to the Endpoint protocol. For example, you may wish to group related endpoints for a single host together, using an enum conforming to the protocol.
