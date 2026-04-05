# 📱 **Product List App (Flutter)**

A scalable Flutter application demonstrating **Product Listing, Search, and Favorites**, built using **BLoC architecture**, **MVC structure**, and **AutoRoute** for smooth and maintainable navigation.

---

## 🚀 **Features**

* 🛍️ **Product Listing** (API-based)
* 🔍 **Product Search** (real-time API)
* ❤️ **Add / Remove Favorites**
* 💾 **Persistent Favorites using SharedPreferences**
* ⚡ **Smooth Navigation using AutoRoute**
* 🧠 **State Management using BLoC / Cubit**
* 🧩 **Clean MVC + Feature-based architecture**

---

## 🏗️ **Architecture**

### 🔹 **BLoC (Cubit) Architecture**

* Separates **business logic** from UI
* Uses **Cubit** for lightweight state management
* Improves **scalability, testability, and maintainability**

### 🔹 **MVC Pattern**

* **Model** → Product & API response models
* **View** → UI Screens
* **Controller** → Cubits (business logic)

---

## 📂 **Project Structure**

```
lib/
│
├── controller/
│   ├── auth_repository/
│   ├── constants/
│   ├── cubits/              # Product, Search, Favorites Cubits
│   ├── router/              # AutoRoute configuration
│   ├── states/
│   └── utility/
│
├── model/                   # Data models
│
├── view/
│   ├── common_widgets/
│   └── screens/
│       ├── product_list/
│       ├── search/
│       └── favorites/
│
└── main.dart
```

---

## 🌐 **API Integration**

Using **DummyJSON API**:

* 📦 **Product List**
  https://dummyjson.com/products

* 🔍 **Search Products**
  https://dummyjson.com/products/search?q={query}

---

## 📱 **Screens**

### 🛍️ **Product List Screen**

* Fetches products from API
* Displays product image, title, and price
* Allows users to **add/remove favorites**

---

### 🔍 **Search Screen**

* Real-time product search using API
* Displays **filtered results dynamically**

---

### ❤️ **Favorites Screen**

* Displays all **favorite products**
* Data persists even after app restart
* Powered by **SharedPreferences**

---

## ❤️ **Favorites Feature (SharedPreferences)**

### 🔹 **How It Works**

* When a user taps the **favorite (❤️)** button:

  *  serialized product data is stored in **SharedPreferences**

* Favorites are stored locally as:

  * A list of **JSON strings**

* On  screen load:

  * **SharedPreferences** retrieves stored data
  * UI updates automatically

---

### 🔹 **Data Flow**

```
User taps ❤️
      ↓
FavoritesCubit updates state
      ↓
Data saved in SharedPreferences
      ↓
Favorites reloaded from storage
      ↓
UI updates automatically
```

---

### 🔹 **Advantages**

* 💾 Persistent local storage
* ⚡ Fast access (no network required)
* 🔄 Seamless sync with Cubit state
* 📱 Works offline

---

## 🧠 **State Management (Cubit)**

* **ProductCubit**

  * Fetches product list from API

* **SearchCubit**

  * Handles search queries and results

* **FavoritesCubit**

  * Manages favorite items
  * Syncs with SharedPreferences

---

## 🔄 **Navigation (AutoRoute)**

* ✅ Type-safe navigation
* ✅ Clean and scalable routing
* ✅ Smooth screen transitions

---

## 🛠️ **Tech Stack**

* Flutter
* Dart
* BLoC / Cubit
* AutoRoute
* SharedPreferences
* REST API (DummyJSON)

---



## ⭐ **Why This Project?**

This project demonstrates:

* ✅ Clean architecture (**MVC + BLoC**)
* ✅ Real-world API integration
* ✅ Persistent local storage
* ✅ Scalable navigation
* ✅ Production-ready structure

---
