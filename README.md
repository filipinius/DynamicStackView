<h1 align="center"> DynamicStackView 📐</h1>  
<h3 align="center"> Easily create and customize dynamic stack views in your SwiftUI app. 🚀</h3>

<p align="center">
    <img src="https://github.com/filipinius/SDKAssets/blob/main/Screenshot%202025-02-02%20at%2012.18.19%E2%80%AFAM.png" alt="Image Leading" width="30%" />
    <img src="https://github.com/filipinius/SDKAssets/blob/main/Screenshot%202025-02-02%20at%2012.18.53%E2%80%AFAM.png" alt="Image Center" width="30%" />
    <img src="https://github.com/filipinius/SDKAssets/blob/main/Screenshot%202025-02-02%20at%2012.19.39%E2%80%AFAM.png" alt="Image Trailing" width="30%" />
</p>
<p align="center">
    <img src="https://github.com/filipinius/SDKAssets/blob/main/Screenshot%202025-02-02%20at%2012.19.13%E2%80%AFAM.png" alt="Image Center High Spacing" width="30%" />
</p>

## Get Started

1. Add `DynamicStackView` to your project. See the [installation guide](#install).

2. Import `DynamicStackView` in your SwiftUI file:

   ```swift
   import SwiftUI
   import DynamicStackView
   ```

3. Use `DynamicStackView` to dynamically arrange views with custom spacing and alignment:

   ```swift
   struct Language: Identifiable {
       let id: UUID = UUID()
       let name: String  
   }
   
   let languages = [
       Language(name: "Swift"),
       Language(name: "Kotlin"),
       Language(name: "Dart"),
       Language(name: "JavaScript")
   ]
   
   struct ContentView: View {
       var body: some View {
           DynamicStackView(
               data: languages,
               spacing: 10,
               fillWidth: false,
               content: { language in
                   Text(language.name)
                       .padding()
                       .background(Color.blue.opacity(0.2))
                       .cornerRadius(8)
               }
           )
           .dynamicAlignment(.leading)
           .rowSpacing(10)
       }
   }
   ```

4. Enjoy a flexible and customizable dynamic stack layout!

## Examples

### Basic Dynamic Stack Example ✨

Pass an array of items and render them dynamically:

```swift
DynamicStackView(
    data: [
        Language(name: "Apple"),
        Language(name: "Microsoft"),
        Language(name: "Google")
    ],
    spacing: 8,
    fillWidth: true,
    content: { company in
        Text(company.name)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
    }
)
.dynamicAlignment(.center)
.rowSpacing(12)
```

## Customize

`DynamicStackView` offers a range of customization options:

| Property           | Description                                        |
| ------------------ | -------------------------------------------------- |
| `data`             | Array of items to be displayed.                    |
| `spacing`          | Spacing between elements.                          |
| `fillWidth`        | Whether views should expand to fill width.         |
| `dynamicAlignment` | Aligns views (`.leading`, `.center`, `.trailing`). |
| `rowSpacing`       | Custom spacing between rows.                       |

## Features

| Feature               | Description                                  |
| --------------------- | -------------------------------------------- |
| 📦 Dynamic Content    | Auto-layout for any data-driven content.     |
| 🔄 Flexible Alignment | Adjusts items dynamically within the stack.  |
| 🎨 Custom Spacing     | Control gaps between items and rows.         |
| 🚀 Auto Sizing        | Adapts to different screen sizes seamlessly. |
| ✨ SwiftUI Friendly    | Easily integrates into any SwiftUI project.  |

## Install

### Swift Package Manager (SPM)

1. In Xcode, go to `File > Add Packages`.
2. Enter the URL for `DynamicStackView`:
   ```
   https://github.com/filipinius/DynamicStackView.git
   ```
3. Select the latest version and add the package to your project.

### Manual Installation

Clone the repository and copy the `DynamicStackView` directory into your project.

### Swift Package Manager Dependencies

```swift
dependencies: [
    .package(url: "https://github.com/filipinius/DynamicStackView.git", .upToNextMinor(from: "1.0.0"))
]
```
