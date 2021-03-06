import sqlite3
import json
from models import Entry
from models import Mood

ENTRIES = []

def get_all_entries():
    # Open a connection to the database
    with sqlite3.connect("./dailyjournal.db") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            e.id,
            e.date,
            e.concept,
            e.text,
            m.id as moodId,
            m.mood
        FROM entries e
        JOIN Moods m on e.moodId = m.id
        """)

        # Initialize an empty list to hold all entry representations
        entries = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an entry instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # Entry class above.
            entry = Entry(row['id'], row['date'], row['concept'],
                            row['text'], row['moodId'])

            taco = Mood(row['moodId'], row['mood'])    
            entry.mood = taco.__dict__            

            entries.append(entry.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(entries)

def get_single_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            e.id,
            e.date,
            e.concept,
            e.text,
            e.moodId
        FROM entries e
        WHERE e.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create an entry instance from the current row
        entry = Entry(data['id'], data['date'], data['concept'],
                            data['text'], data['moodId'])

        mood = Mood(data['id'], data['mood'])                      

        return json.dumps(entry.__dict__)    

def delete_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM entries
        WHERE id = ?
        """, (id, ))        

def get_entry_by_search(terms):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            e.id,
            e.date,
            e.concept,
            e.text,
            e.moodId
        FROM Entries e
        LEFT JOIN Moods m
            ON m.id = e.moodId
        WHERE e.concept LIKE ?
        """, ( terms, ))

        entries = []
        dataset = db_cursor.fetchall()

        for row in dataset:
            # Create an entry instance from the current row
            entry = Entry(row['id'], row['date'], row['concept'],
                        row['text'], row['moodId'])



            entries.append(entry.__dict__)

    return json.dumps(entries)

