<h1 align="center"> Movies App </h1>
<h3 align="center"> Mobile app for iOS showcasing movies using TMDb API</h3>
<br>

This app enables users to browse and search for movies, view detailed movie information, and refresh data in real time. It’s built using modern iOS development practices, utilizing **SwiftData** for local storage, **async/await** for smooth asynchronous operations, and follows the **MVVM** architecture to ensure clean, modular code. The app also integrates design patterns. The user interface is primarily based on a **Figma** design, with a few custom adjustments made to improve the user experience.

## Table of contents 
- [Used technologies, libraries and important links](https://github.com/VrickPL/IMDbApp/edit/main/README.md#used-technologies-libraries-and-important-links)
- [Home](https://github.com/VrickPL/IMDbApp/edit/main/README.md#home)
- [Movie Details](https://github.com/VrickPL/IMDbApp/edit/main/README.md#movie-details)
- [Search](https://github.com/VrickPL/IMDbApp/edit/main/README.md#search)
- [Watch list](https://github.com/VrickPL/IMDbApp/edit/main/README.md#watch-list)

## Used technologies, libraries and important links
- **[Swift](https://www.swift.org/documentation/)**,  
- **[SwiftUI](https://developer.apple.com/tutorials/swiftui)**,
- **[SwiftData](https://developer.apple.com/documentation/swiftdata)**, 
- **[Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)**, 
- **[TMDb API](https://developer.themoviedb.org/reference/intro/getting-started)**, 
- **[Figma design - Francisco Santos](https://www.figma.com/community/file/1124835379376527920)**


## Home
In the Home section, users can explore a wide range of movies fetched in real-time from the **TMDb API**. This list is continuously updated with a pull-to-refresh feature, ensuring users always have access to the latest titles.
<br>

Additionally, a custom search bar allows users to easily search for movies by title.
<br>

At the center of the view, there's a picker that allows users switch between different movie categories. Movies from the selected category are loaded upon selection and remain accessible when switching between categories.


## Movie details
Clicking on a movie leads users to a detailed view that highlights key information, including the title, description, release date, and popularity. The intuitive layout presents movie details in a clean, user-friendly format. Here, users can add or remove a movie from their **Watch List** with a single tap.
<br>

The view also features a picker, allowing users to toggle between the movie's description and user reviews. By selecting reviews, users can browse through numerous comments, with the option to expand individual reviews for more detailed insights.



## Search
In the Search section, users can effortlessly find movies by entering their titles. The responsive search function provides instant results from **TMDb's** extensive database, and users can scroll through these results just as they would in the main movie listings.





## Watch list
The Watch List section displays movies that users have added to their personal list. These selections are stored locally using **SwiftData** for quick access.






