Please see this file in edit mode because it is not showing all the things in read mode.

This is simple booking application of hall or lawnns for events

Schema for this application is following



  Hall          |
---------------- 
Name            |
Capacity        |
Rate            |
Location(City)  |
Address         |         polymorphic association
id              | -------------- --
-----------------                 |
                                  |
                                  |          Lisitng Views  |             Booking   |                 
                                  |         ----------------            -------------
                                  |         id              |-----------  List_id   |
                                   -------- Imageable_id    |             Client_id | --------
                                  |         Imageable_type  |             Start Date|         |
                                  |         -----------------             End Date  |         |
                                  |                                       Status    |         |
                                  |                                       Id        |         |
  Lawn          |                 |                                                           |
----------------                  |                                                           |
Name            |                 |                         Client_id   |                     |
Capacity        |                 |                     -----------------                     |
Rate            |                 |                       Name          |                     |
Location(City)  |                 |                       Address       |                     |
Address         |                 |                       Email_id      |                     |
id              |  ---------------                        contact_no    |                     |
-----------------                                         Status        |                     |
                                                          Id            | ---------------------




Status has been taken in client and booking for keeping record of client and booking. We are not deleting this record when user will be deleted. Status will set INACTIVE when user will ask for deleting his record.

Hall and lawn has one association with listing views.
Listing view has polymorphic relation with hall and lawns.
