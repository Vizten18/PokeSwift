# PokeSwift 🚀

A SwiftUI-based Pokémon application demonstrating **Clean Architecture** and **MVVM** design patterns. This project serves as a learning resource and reference implementation for iOS developers looking to understand modern architectural patterns in SwiftUI.

> **Note:** This repository is created for educational purposes - to learn and share best practices, architecture patterns, and SwiftUI development tips.

## 📱 Features

- Browse a paginated list of Pokémon
- View detailed information about each Pokémon
- Infinite scrolling with pagination
- Pull-to-refresh functionality
- Async/await networking
- Dependency injection pattern

## 🏗️ Architecture

This project follows **Clean Architecture** principles combined with the **MVVM (Model-View-ViewModel)** pattern, ensuring:

- **Separation of Concerns**: Each layer has a single responsibility
- **Testability**: Business logic is decoupled from UI and frameworks
- **Maintainability**: Clear structure makes the codebase easy to understand and modify
- **Scalability**: Easy to add new features without affecting existing code

### Layer Structure

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│    (Views + ViewModels - MVVM)          │
│  PokemonListView, PokemonDetailView     │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│          Domain Layer                   │
│     (Entities + Repository Protocols)   │
│    Pokemon, PokemonRepository           │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│           Data Layer                    │
│  (Repository Implementations + API)     │
│   PokemonRepositoryImpl, DTOs           │
└─────────────────────────────────────────┘
```

## 📂 Project Structure

```
PokeSwift/
├── App/
│   ├── PokeSwiftApp.swift           # App entry point
│   └── DependecyContainer.swift     # Dependency injection container
│
├── Core/
│   └── Config/
│       └── APIConfig.swift          # API configuration protocol
│
├── Domain/                          # Business Logic Layer
│   ├── Entities/
│   │   ├── Pokemon.swift            # Domain model for Pokemon
│   │   └── PokemonList.swift        # Domain model for list
│   └── Repositories/
│       └── PokemonRepository.swift  # Repository protocol (abstraction)
│
├── Data/                            # Data Access Layer
│   ├── API/
│   │   ├── PokeEndpoint.swift       # API endpoints definition
│   │   └── DTOs/                    # Data Transfer Objects
│   │       ├── PokemonDTO.swift     # Pokemon API response
│   │       ├── PokemonDetailDTO.swift
│   │       └── PokemonListDTO.swift
│   └── Repositories/
│       └── PokemonRepositoryImpl.swift  # Repository implementation
│
├── Presentation/                    # UI Layer (MVVM)
│   └── Modules/
│       ├── PokemonList/
│       │   ├── PokemonListView.swift      # SwiftUI View
│       │   └── PokemonListViewModel.swift # ViewModel
│       └── PokemonDetail/
│           ├── PokemonDetailView.swift
│           └── PokemonDetailViewModel.swift
│
└── Assets & Colors/                 # UI Resources
```

## 🔄 Data Flow

1. **View** → User interacts with the UI
2. **ViewModel** → Handles user actions and business logic
3. **Repository Protocol** → Abstracts data operations
4. **Repository Implementation** → Fetches data from API
5. **DTO** → Transforms API response to Domain Entity
6. **Domain Entity** → Pure business model
7. **ViewModel** → Updates published properties
8. **View** → Automatically refreshes via SwiftUI bindings

## 🛠️ Technologies & Concepts

- **SwiftUI** - Modern declarative UI framework
- **Async/Await** - Modern concurrency in Swift
- **URLSession** - Native networking
- **Combine** - Reactive programming with `@Published` properties
- **Protocol-Oriented Programming** - Abstractions for testability
- **Dependency Injection** - Via DependencyContainer
- **Clean Architecture** - Separation of layers
- **MVVM Pattern** - Presentation layer architecture

## 🎯 Key Design Patterns

### 1. **Dependency Injection**
The `DependecyContainer` class manages dependencies and provides factory methods for creating views with their dependencies:

```swift
@MainActor
func makePokemonListView() -> PokemonListView {
    let viewModel = PokemonListViewModel(repository: pokemonRepository)
    return PokemonListView(viewModel: viewModel, container: self)
}
```

### 2. **Repository Pattern**
Abstracts data sources behind a protocol, making it easy to swap implementations:

```swift
protocol PokemonRepository {
    func fetchPokemonList(offset: Int, limit: Int) async throws -> PokemonList
    func getPokemonDetail(id: Int) async throws -> Pokemon
}
```

### 3. **DTO to Entity Mapping**
API responses (DTOs) are transformed into clean domain entities:

```swift
func toEntity() -> Pokemon {
    return Pokemon(id: id ?? 0, name: name, imageUrl: imageUrl)
}
```

## 🌐 API

This app uses the free [PokéAPI](https://pokeapi.co/) to fetch Pokémon data.

## 📸 Screenshots

  

  

## 🚀 Getting Started

1. Clone the repository
2. Open `PokeSwift.xcodeproj` in Xcode
3. Build and run the project (⌘ + R)

No additional dependencies or setup required!

## 📚 Learning Resources

This project demonstrates:
- ✅ Clean Architecture implementation in SwiftUI
- ✅ MVVM pattern with `@StateObject` and `@Published`
- ✅ Async/await for asynchronous operations
- ✅ Protocol-oriented design for testability
- ✅ Dependency injection patterns
- ✅ Pagination and infinite scrolling
- ✅ Navigation with NavigationStack
- ✅ Error handling in async contexts

## 🤝 Contributing

This is an educational project. Feel free to:
- Fork the repository
- Experiment with the code
- Suggest improvements
- Share your learnings

## 📝 License

This project is open source and available for educational purposes.

---

**Happy Coding! 🎉**

*This project is maintained as a learning resource for the Swift development community.*