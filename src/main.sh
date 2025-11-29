#! /bin/bash
source ~/scr/connectDB
source ~/scr/dropDB

main_menu() {
    while true; do
        echo "----------------------------------"
        echo "Main menu"
        echo "----------------------------------"
        echo "1.Create Database"
        echo "2.List Databases"
        echo "3.Connect To Database"
        echo "4.Drop Database"
        echo "5.Exit"
        read -r -p'Enter your option : ' opt
        case $opt in
            1) create_db ;;
            2) listDB ;;
            3) connecting_database ;;
            4) drop_db ;;
            5) break ;;
            *) echo "Invalid option please choose an option from 1 to 5 ! " ;;
        esac
        
    done
}
 
main_menu
