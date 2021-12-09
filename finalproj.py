"""
Python GUI program that encompasses our hospital procedure project.
The program will connect to a MySQL database and executes queries from an application program driven by input from a user.
Users will be able to create a profile as either a user searching for hospital procedures or a user on behalf of a hospital.
Users searching for hospital procedures will be able to query from the database based on input specified by the user.
Users acting on behalf of a hospital will be able to create, update, delete their specific hospital procedures.
"""
import pymysql.cursors
import mysql.connector


class HospitalProceduresProgram():

    def __init__(self):
        """
        Constructor for the Python to SQL connection.
        """
        self.connection = None
        self.character_name = ""
        self.email = ""
        self.connect_to_database()
        self.go()
        self.disconnect()

    def disconnect(self):
        """
        Disconnect from database and end program.
        """

        self.connection.close()
        print("\nEnd of program. Thanks for using!")

    def connect_to_database(self):
        """
        Prompt the user for the MySQL username and password and use 
        to connect to the lotrfinal database.
        """

        #user_name = input("Enter user name: ") # root
        #password_name = input("Enter password: ") # Supasupa123!

        self.connection = pymysql.connect(host='localhost',
                             user='root',
                             password='Supasupa123!',
                             database='hospital_procedures_final_proj',
                             cursorclass=pymysql.cursors.DictCursor)
        
        print("Connected to database.\n")
    
    def go(self):
        """
        Method that will run the entire program.
        """

        print("===========================================\nWelcome to our hospital procedures program!\n===========================================")

        # Ask if they are using the program for the first time or not. Eventually log in to the program
        print("\nAre you a first time user or a returning user?")
        self._old_new_user()

        # Should be logged in at this point
        # Determine if email is a requester or hospital user via a procedure
        if self._check_email_type(): # indicates it is a hospital user
            self._hospital_user_actions()

        else: # indicates it is a requester
            self._requester_actions()        

    def _check_email_type(self):
        """
        Check if the user who is logged in is a requester or a hospital user
        """
        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            stmt = 'SELECT check_email_type("{}")'.format(self.email)
            cursorObject.execute(stmt)

        except Exception as e:
            print("Exeception occured: {}".format(e))

        return cursorObject.fetchone()

    def _old_new_user(self):
        """
        Determine whether or not the user is returning or a new user.
        """
        user_bool = input("Enter 1 if you are a returning user, or 0 if you are a new user: ")
        if (user_bool == "1"):
            self._log_in()
            
        elif (user_bool == "0"):
            # make them sign up
            self._create_new_user()
            
        else:
            print("Invalid response. Please try again.")
            self._old_new_user()

    def _log_in(self):
        """
        Check log in information
        """
        print("Welcome back! Please log in.")
       
        self._log_in_email()
        self._log_in_pw()
        print("Log in successful.")

    def _log_in_email(self):
        """
        Check email
        """
        email = input("Enter email: ")
        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            stmt = 'SELECT check_email_exists("{}")'.format(email)
            cursorObject.execute(stmt)

            ## cahnge this logic 
            if (not cursorObject.fetchone()):
                print("Email not found. Please try again.")
                self._log_in_email()

        except Exception as e:
            print("Exeception occured: {}".format(e))
        
        self.email = email

    def _log_in_pw(self):
        """
        Check if password corresponds to email.
        """
        password = input("Enter password: ")
        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            stmt = 'SELECT check_password_matches("{}, {}")'.format(self.email, password)
            cursorObject.execute(stmt)

            if (not cursorObject):
                print("Password incorrect. Please try again.")
                self._log_in_pw()

        except Exception as e:
            print("Exeception occured: {}".format(e))

    def _create_new_user(self):
        """
        Create a new user
        """
        print("Creating a new user.")

        name = input("Please enter your name: ")
        email = input("Please enter your email address: ")
        password = input("Please enter a password: ")
        
        self._create_new_user_type(name, email, password)
        print("Thank you for registering! We will now redirect you to the log in page.")
        self._log_in()

    def _create_new_user_type(self, name, email, password):
        user_type = input("Enter 1 if you want to be a user who requests information, or enter 0 if you are editing information on behalf of a hospital")

        if user_type == "1":
            insurance = input("Please enter your insurance: ")
            try:
                # Cursor object creation
                cursorObject = self.connection.cursor()                                    

                # Execute the sqlQuery
                stmt = 'CALL create_new_requester("{}, {}, {}, {}")'.format(name, email, password, insurance)
                cursorObject.execute(stmt)

            except Exception as e:
                print("Exeception occured: {}".format(e))

        elif user_type == "0":
            cur = self.connection.cursor()                                    
            hospitals = []
            stmt_select = "select character_name from lotr_character order by character_name"
            cur.execute(stmt_select)

            characters = cur.fetchall()

            for char_dict in characters:
                for _, value in char_dict.items():
                    hospitals.append(value)

            print("\nList of characters: ")
            print(hospitals)
            hospital_name = "Please enter the name of the hospital you work for from the above list. If not listed, add your new hospital: "
            try:
                # Cursor object creation
                cursorObject = self.connection.cursor()                                    

                # Execute the sqlQuery
                stmt = 'CALL create_new_hospital_user("{}, {}, {}, {}")'.format(name, email, password, hospital_name)
                cursorObject.execute(stmt)

            except Exception as e:
                print("Exeception occured: {}".format(e))
        
        else:
            print("Invalid response. Please try again.")
            self._create_new_user_type(name, email, password)

    def _requester_actions(self):
        """
        All the functionality that a requester would be able to access
        """
        print("=====================\nRequester Portal\n=====================\n")
        print("As a requester, you have the ability to look at all types of procedures covered under your insurance.")
        print("You will be prompted with a list of filters of how you want to view your data.")

        viewables = ""
        additional_filters = ""
        procedure = ""

        while (True):
            # print list of procedures
            procedure = input("Enter procedure you would like to view")
            # ensure procedure is in the list

            requester_view_command = input("Enter\n1: View all procedure attributes \n2: View certain procedure attributes \nq: to quit the program\n")
            if (requester_view_command == "1"):
                viewables = "*"
            elif requester_view_command == "2":
                self._requester_actions_specifics(viewables)
            elif requester_view_command == "q":
                break
            else:
                print("Invalid command. Enter another command")

            requester_filter_command = input("Enter\n1. Order from least to greatest cost\n2. Order from greatest to least cost\n3. Specify a range of cost\n")
            if (requester_filter_command == "1"):
                additional_filters = "ORDER BY procedure_cost DESC"
            
            elif requester_filter_command == "2":
                additional_filters = "ORDER BY procedure_cost"
            
            elif requester_filter_command == "3":
                least = input("Enter minimum range of cost: ")
                greatest = input("Enter mamximum range of cost: ")
                additional_filters = "AND procedure_cost < {} AND procedure_cost > {}".format(least, greatest)

            elif requester_filter_command == "q":
                break

            else:
                print("Invalid command. Enter another command")

            try:
                # Cursor object creation
                cursorObject = self.connection.cursor()                                    

                # Execute the sqlQuery
                stmt = "SELECT {} FROM procedures WHERE procedure_name = {} {}".format(viewables, procedure, additional_filters)
                cursorObject.execute(stmt)

            except Exception as e:
                print("Exeception occured: {}".format(e))

    def _requester_actions_specifics(self, viewables):

        specifics = input("Enter\n a: procedure name\nb: procedure cost\n c. hospital name\nq: exit out of filter specifications")
        if (specifics == "a"):
            name = "procedure_name, "
            if name not in viewables:
                viewables += name
            else:
                print("Attribute already added.")
        elif (specifics == "b"):
            cost = "procedure_cost, "
            if cost not in viewables:
                viewables += cost
            else:
                print("Attribute already added.")

        elif (specifics == "c"):
            h_name = "hospital_name, "
            if h_name not in viewables:
                viewables += h_name
            else:
                print("Attribute already added.")

        elif (specifics == "q"):
            return viewables[:-2]

        else:
            print("Invalid command.")
        self._requester_actions_specifics(viewables)

        return viewables

    def _hospital_user_actions(self):
        """
        All the functionality that a hospital user would be able to access
        """
        print("=====================\Hospital User Portal\n=====================\n")
        print("As a hospital user, you have the ability to edit all types of information.")
        q = True

        while (q):
            hospital_command = input("Enter\n1: Add new procedure entry.\n2: Update existing procedure entry\n3: Delete existing procedure entry.\nq: to quit the program\n")
            if hospital_command == "1":
                self._hospital_user_actions_add()
            elif hospital_command == "2":
                self._hospital_user_actions_update()
            elif hospital_command == "3":
                self._hospital_user_actions_delete()
            elif hospital_command == "q":
                break
            else:
                print("Invalid command. Enter another command")

    def _hospital_user_actions_add(self):
        """
        Add to hospital procedures
        """
        procedure = input("Input procedure you want to add: ")
        procedure_cost = input("Input cost of the procedure: ")
        procedure_duration = input("Input duration of the procedure: ")

        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            stmt = 'call create_new_procedure("{}, {}, {}")'.format(procedure, procedure_cost, procedure_duration)
            cursorObject.execute(stmt)

        except Exception as e:
            print("Exeception occured: {}".format(e))

    def _hospital_user_actions_update(self):
        """
        Update specified hospital procedure
        """
        procedure = input("Input procedure you would like to update: ")
        procedure_cost = input("Input updated cost of the procedure (enter 0 if you do not want to update): ")
        procedure_duration = input("Input updated duration of the procedure (enter 0 if you do not want to update): ")

        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            stmt = 'call update_procedure("{}, {}, {}")'.format(procedure, procedure_cost, procedure_duration)
            cursorObject.execute(stmt)

        except Exception as e:
            print("Exeception occured: {}".format(e))

    def _hospital_user_actions_delete(self):
        """
        Delete specified procedure associated with the hospital
        """
        procedure = input("Input procedure you would like to delete: ")

        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            stmt = 'call delete_procedure("{}")'.format(procedure)
            cursorObject.execute(stmt)

        except Exception as e:
            print("Exeception occured: {}".format(e))

    def _get_char_names(self) -> list:
        """
        Get character names from database.
        """
        character_names_list = []
        cur = self.connection.cursor()
        stmt_select = "select character_name from lotr_character order by character_name"
        cur.execute(stmt_select)

        characters = cur.fetchall()

        for char_dict in characters:
            for key, value in char_dict.items():
                character_names_list.append(value)

        print("\nList of characters: ")
        print(character_names_list)
        
        return character_names_list

# Main function
if __name__ == "__main__":
    program = HospitalProceduresProgram()
    program.go()

