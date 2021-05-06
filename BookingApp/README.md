### Rules
1. Do not use pods
2. Do not use storyboard
3. Do not create new xib but use the existing one
4. You can fix or improve the existing code
5. App must be universal
6. Fill free to add comments and to improve UI
7. Do not spend to much time on fixing everything, the idea is to discuss about your code :)

### What should be done
1. BookingTableViewController must show a list of 25 bookings
2. BookingTableViewController must be embedded in a UISplitViewController instead of UINavigationController
3. BookingDetailViewController must be the detail of this UISplitViewController and must show booking details.
4. BookingDetailViewController must contains a button which show the BookingStatusController in modal
5. BookingStatusController should be instantiate using the .xib
5. BookingStatusController must allow the user to change the current booking status
6. HomeViewController must present the color of the status of the first booking in the list

#### Bonus
- Prepare the project for both english and french languages
- Add a unit test for the Client class