# Vura

A modern and minimalist music player application built using the **Flutter** framework. It features a comfortable Dark UI, smart categorization of audio files, and a seamless playback control experience.

---

## 📸 Screenshots

| Main Screen | Player Screen |
|---|---|
| ![Main Screen](assets/screenshots/image1.jpeg) | ![Player Screen](assets/screenshots/image2.jpeg) |

---

## ✨ Features

* **Dynamic Asset Loading:** Automatically reads audio files from assets using `AssetManifest` without manual path hardcoding.
* **Smart Sorting & Categorization:** Automatically divides content into 3 main tabs (Regular `Songs`, Classical `Music`, and a comprehensive `All` list).
* **Auto Shuffle:** Tracks are randomly shuffled upon opening each list to provide a fresh listening experience.
* **Advanced Progress Bar Control:** Solves the slider jumping issue during seeking by separating the local drag state from the actual playback state.
* **Memory Management:** Disposes and releases `AudioPlayer` resources immediately upon exiting the player page to prevent memory leaks.

---

## 🛠️ Technical Review

Upon reviewing the project's source code, current strengths (Pros) were identified alongside some structural limitations that open room for future development (Cons):

### Pros
1. **Clean Component Architecture:** UI elements are separated into independent micro-widgets like `CustomCard`, `MusicTitle`, and `VoiceChangerBar`, facilitating code reuse and maintenance.
2. **Interactive UX:** Smart string manipulation to clean up file formats (e.g., removing `_` and `.mp3`) and convert them into readable display names seamlessly.
3. **Stable Performance:** Uses asynchronous calls (`Future/Async`) to fetch data from memory, ensuring the UI doesn't freeze during loading.

### Cons & Limitations
1. **Hardcoded Metadata:** The artist names map and their matching logic are hardcoded within the view files. A more professional approach would be reading from an external `JSON` file or extracting metadata directly from the `mp3` files.
2. **State Loss on Navigation (No Global State):** The `AudioPlayer` object is instantiated locally inside the player page. This means the music stops immediately upon navigating back, and it doesn't support continuous background playback across the app.
3. **Code Duplication:** There is duplication in data fetching and name processing functions across the `All`, `Music`, and `Songs` pages. It is better to isolate these operations into a dedicated `Service Class`.

---

## 🚀 Roadmap
* [ ] Migrate state management to a framework (Bloc or Provider) to enable background playback and seamless navigation.
* [ ] Read song and artist data dynamically using an ID3 Tag reader package.
* [ ] Add the ability to stream music files from the internet (Audio Streaming).
