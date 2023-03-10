#!/bin/bash

# Array function to update the system
update_system() {
  # Commands used for update
   pkgupdate="pkg update -y"
    $pkgupdate
     wait
      pkgupgrade="pkg upgrade -y"
      $pkgupgrade
      wait
     aptupdate="apt update -y"
    $aptupdate
   wait
 aptfull="apt full-upgrade -y"
$aptfull
   wait
}

# Confirmation dialog
dialog --title "Termux System update" --yesno "Do you want to update the packages?" 7 60

# Verify code dialog
case $? in
  0) # User choice "Yes"
    dialog --title "Confirm" --yesno "Are you Sure? This gonna take some time." 7 60
    case $? in
      0) # User confirmed the update
        update_system
        dialog --title "Done" --msgbox "Sistem sucessfull updated." 7 60
        ;;
      *) # User cancelled the confirmation
        dialog --title "Cancelled" --msgbox "Update cancelled by user." 7 60
        ;;
    esac
    ;;
  *) # User choice "No"
    dialog --title "Cancelled" --msgbox "Update cancelled." 7 60
    ;;
esac

# End of script
exit 0

