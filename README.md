# 🎬 CineTrace

CineTrace is a movie discovery application built with **Flutter**. It features a robust architecture designed for scalability and a smooth user experience.

The app interfaces with the [CineTrace API](https://github.com/om1cael/cinetrace-api) to manage user-generated content like reviews, while fetching global movie data through the **TMDB API**.

## ✨ Features
- **Dynamic Movie Feed**: Browsing the latest titles with data fetched from the [CineTrace API](https://github.com/om1cael/cinetrace-api).
- **Deep Details**: Full overview, release dates, and metadata for every movie.
- **Hybrid Review System**: Integrated user reviews with a star-rating system.

## 🏗️ Architecture
This project follows **Clean Architecture** principles to ensure maintainability:
- **Data Layer**: API models and repository implementations.
- **Domain Layer**: Plain entities and business logic definitions.
- **Presentation Layer (UI)**: Reusable widgets, ViewModels (State Management), and feature-based folder structure.

## 🛠️ Tech Stack
- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router)
- **HTTP Client**: [Dio](https://pub.dev/packages/dio)
- **Icons**: Material Design Icons

## 📸 Preview
| Movie Details | User Reviews |
|---|---|
| ![HomePage](https://github.com/user-attachments/assets/9902038b-afcb-4887-90aa-4b6ea1b400fa) | ![Movie Page](https://github.com/user-attachments/assets/b8588fd0-32be-47d0-a182-ac73205593ed) |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- The [CineTrace API](https://github.com/om1cael/cinetrace-api) running locally or hosted.

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/om1cael/CineTrace.git
   ```
2. Install the dependencies:
    ```bash
    flutter pub get
    ```
3. Run the app:
    ```bash
    flutter run
    ```
