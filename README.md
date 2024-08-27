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

<p align="center"> 
<img src="https://github.com/user-attachments/assets/3dce63ed-5f22-4e44-811c-953976bb1b0b" width="310" height="660">
<img src="https://github.com/user-attachments/assets/52326576-6eaf-4eb6-89cf-9e089ee28c3f" width="310" height="660">
<img src="https://github.com/user-attachments/assets/38b9c87b-7001-41f4-9c38-5206b94e16b9" width="310" height="660">
</p>



## Movie details
Clicking on a movie leads users to a detailed view that highlights key information, including the title, description, release date, and popularity. The intuitive layout presents movie details in a clean, user-friendly format. Here, users can add or remove a movie from their **Watch List** with a single tap.
<br>

The view also features a picker, allowing users to toggle between the movie's description and user reviews. By selecting reviews, users can browse through numerous comments, with the option to expand individual reviews for more detailed insights.

<p align="center"> 
<img src="https://github.com/user-attachments/assets/24a269f7-c03c-4962-99ce-50cff0010a61" width="310" height="660">
<img src="https://github.com/user-attachments/assets/14c2b7eb-c9b3-486d-9b14-07088b9a24b2" width="310" height="660">
</p>


## Search
In the Search section, users can effortlessly find movies by entering their titles. The responsive search function provides instant results from **TMDb's** extensive database, and users can scroll through these results just as they would in the main movie listings.


<p align="center"> 
<img src="https://github.com/user-attachments/assets/1e7a780d-2a24-48e7-b9a9-f9b1d7fd5aac" width="310" height="660">
</p>



## Watch list
The Watch List section displays movies that users have added to their personal list. These selections are stored locally using **SwiftData** for quick access.


<p align="center"> 
<img src="https://github.com/user-attachments/assets/77a2fe5d-d564-482c-b5c9-a2abd4f0c519" width="310" height="660">
</p>




