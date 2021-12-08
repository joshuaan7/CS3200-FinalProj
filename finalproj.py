"""
Python program that will connect to a MySQL database and executes queries from an application program driven by input from a user.
"""
import pymysql.cursors
import mysql.connector


class PythonToSQL():

    def __init__(self):
        """
        Constructor for the Python to SQL connection.
        """
        self.connection = None
        self.character_name = ""

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

        user_name = input("Enter user name: ")
        password_name = input("Enter password: ")

        self.connection = pymysql.connect(host='localhost',
                             user=user_name,
                             password=password_name,
                             database='lotrfinalanj',
                             cursorclass=pymysql.cursors.DictCursor)
        
        print("Connected to database.")

    def input_char_name(self):
        """
        Prompt the user to enter a particular character name. Store the result in a variable.
        Does data validation on input provided by user.
        """

        rows = self._get_char_names()

        self.character_name = input("Enter a character name from the above list: ")

        if self.character_name not in rows:
            print("Invalid character name, please enter a valid character name: ")
            self.input_char_name()

        else:
            print("Valid character name.")
    

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

    def call_track_characters(self):
        """
        Call track characters procedure.
        """
        print("\nTrack Characters Procedure:")
        try:
            # Cursor object creation
            cursorObject = self.connection.cursor()                                    

            # Execute the sqlQuery
            # cursorObject.callproc('call track_character', (self.character_name))
            stmt = 'call track_character("{}")'.format(self.character_name)
            cursorObject.execute(stmt)

            # Print the result of the executed stored procedure
            for result in cursorObject.fetchall():
                print(result) 

        except Exception as e:
            print("Exeception occured: {}".format(e))

# Main function
if __name__ == "__main__":
    python_to_sql = PythonToSQL()
    python_to_sql.connect_to_database()
    python_to_sql.input_char_name()
    python_to_sql.call_track_characters()
    python_to_sql.disconnect()
