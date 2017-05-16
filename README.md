# Momentum

This is the test App WiFiesta.

# Architecture

This app was developed using MVVM and using Alamofire to handle the network requests and SwiftyJSON  to parse the network responses.
Regarding the view controllers, all of them were developed keeping in mind the 400 lines of code constraint, and all of the protocol implementations were developed on separte extensions.
Regarding the persistence requirement, this app uses Core Data to save the application's list. Additionally, this app has an autoSave method that is triggered every 3 seconds to keep updated with what the user's done. 

# Application Flow
1. Donwload data.
2. Parse data.
3. Inform the Loading View Controller that the data is ready.
4. Show the tab bar with the table view on one tab and the collection view on the other.
5. If the user taps on one application, show the detail
6. In order to delete an application, the user must swipe  (table case) or long press (collection case) the app. 

