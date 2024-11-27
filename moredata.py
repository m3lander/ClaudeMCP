import sqlite3
import numpy as np

# Connect to SQLite database (or create it)
conn = sqlite3.connect('eeg_dataset.db')
cursor = conn.cursor()

# Use the same table creation code as above
# ...

# Generate data for Participant 1, Channel Fp1, in 'unfocused' state
participant_id = 1
channel_id = 1
state_id = 1  # Unfocused
fs = 256  # Sampling rate
duration = 100  # Duration in seconds before switching state
timestamps = np.linspace(0, duration, int(duration * fs))
eeg_values = np.random.normal(50, 0.5, len(timestamps))  # Mock EEG values around 50 µV

# Insert data into eeg_data table
data = [(participant_id, channel_id, float(t), float(e), state_id) for t, e in zip(timestamps, eeg_values)]
cursor.executemany('''
    INSERT INTO eeg_data (participant_id, channel_id, timestamp, eeg_value, state_id)
    VALUES (?, ?, ?, ?, ?)
''', data)

conn.commit()
conn.close()
