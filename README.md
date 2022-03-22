# MVVMApplication
### Architecture
This is my view for MVVM architecure with Coorinator (for assembling and routing) also I used Combine . 
The structure is: 
###### - Coordinator
######- View
######- ViewController
######- ViewModel
######- Model
 **Coordinator** - for assembling and routing.
 **View** - for building UI elements (this is not required. I use it as prefer write UI by code and in this case VC is getting messive.),
***View Controller***  It only performs things related to UI — Show/get information, handled by lifecycle, handle the state of the ViewModel events.
***View Model***  - It receives information from VC, handles all this information, and sends it back to VC.
***Model*** - This is only your model, nothing much here. It’s the same model as in MVC. It is used by VM and updates whenever VM sends new updates
 
In this example I use service for business logic. My idea was show only the Presentation layer.  To my mind for data and domain logic the are a lot of better solutions.
In this progect you could research this application on example of 3 screens and tabbar. 
###### Thank you for your attention.
