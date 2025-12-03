#! usr/bin/bash

source ~/final_bash_project/connectDB
source ~/final_bash_project/dropDB
source ~/final_bash_project/create_database
source ~/final_bash_project/list_database
source ~/final_bash_project/create_tables
source ~/final_bash_project/list_tables
source ~/final_bash_project/drop_table
source ~/final_bash_project/insert_data
source ~/final_bash_project/update_table
source ~/final_bash_project/Select_From_Table
source ~/final_bash_project/Delete_From_Table
#source ~/final_bash_project/table_menu


main_menu() {

echo "Which way do you want to use?"
echo "1- press (1) for MENU with numbers
2- pres (2) for SQL queries"
read -r ch

if [[ "$ch" == 1 ]]
then
    # ADDED: Set mode to menu mode
    mode="menu"
   export MODE="$mode"
    
    while true
    do
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
           1) create_database "$mode" ;;
           2) list_database "$mode" ;;
           3) connecting_database "$mode" ;;
           4) dropDB "$mode" ;;
           5) break ;;
           *) echo "Invalid option please choose an option from 1 to 5 ! " ;;
        esac
     done 

else
    # ADDED: Set mode to query (SQL) mode
    mode="sql"
    export MODE="$mode"

    while true
    do
        echo "----------------------------------"
        echo "Main queries"
        echo "----------------------------------"
        echo "1.Create Database"
        echo "2.List Databases"
        echo "3.Connect To Database"
        echo "4.Drop Database"
        echo "5.Exit"

        read -r -p'Enter your command : ' op
        
        set -- $op
        op=$(echo "$op" | tr '[:upper:]' '[:lower:]')

        if [[ "$1" == "create" ]]
        then
          #source ~/final_bash_project/create_database
          create_database "$mode" "$2"  #
          
        elif [[ "$1" == "show" ]]
        then
          source ~/final_bash_project/list_database
          list_database "$mode" "$2"
        
        elif [[ "$1" == "use" ]]
        then
          connecting_database "$mode" "$2"

        elif [[ "$1" == "drop" ]]
        then
          source ~/final_bash_project/dropDB
          dropDB "$mode" "$2"
        
        else
          echo "there is no command matchs your input"
        fi      
    done
fi
}

main_menu
