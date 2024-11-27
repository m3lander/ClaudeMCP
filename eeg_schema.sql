-- Drop existing tables first
DROP TABLE IF EXISTS eeg_data;
DROP TABLE IF EXISTS participants;
DROP TABLE IF EXISTS channels;
DROP TABLE IF EXISTS cognitive_states;

-- Create tables for participants, channels, cognitive states, and EEG data

-- Table for participants
CREATE TABLE participants (
    participant_id INTEGER PRIMARY KEY,
    name TEXT
);

-- Table for EEG channels
CREATE TABLE channels (
    channel_id INTEGER PRIMARY KEY,
    channel_name TEXT
);

-- Table for cognitive states
CREATE TABLE cognitive_states (
    state_id INTEGER PRIMARY KEY,
    state_name TEXT
);

-- Table for EEG data
CREATE TABLE eeg_data (
    data_id INTEGER PRIMARY KEY,
    participant_id INTEGER,
    channel_id INTEGER,
    timestamp REAL,
    eeg_value REAL,
    state_id INTEGER,
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
    FOREIGN KEY (state_id) REFERENCES cognitive_states(state_id)
);

-- Insert participants
INSERT INTO participants (participant_id, name) VALUES
    (1, "Participant_1"),
    (2, "Participant_2"),
    (3, "Participant_3");

-- Insert EEG channels
INSERT INTO channels (channel_id, channel_name) VALUES
    (1, "Fp1"),
    (2, "Fp2"),
    (3, "F3"),
    (4, "F4"),
    (5, "C3"),
    (6, "C4"),
    (7, "P3"),
    (8, "P4"),
    (9, "O1"),
    (10, "O2"),
    (11, "F7"),
    (12, "F8"),
    (13, "T3"),
    (14, "T4");

-- Insert cognitive states
INSERT INTO cognitive_states (state_id, state_name) VALUES
    (1, "unfocused"),
    (2, "focused"),
    (3, "hyperactive");

-- Insert mock EEG data
INSERT INTO eeg_data (participant_id, channel_id, timestamp, eeg_value, state_id) VALUES
    (1, 1, 0.000, 50.5, 1),
    (1, 1, 0.004, 51.0, 1),
    (1, 1, 0.008, 49.8, 1),
    (1, 1, 0.012, 50.2, 1),
    (1, 1, 0.016, 50.7, 1),
    (1, 1, 100.000, 55.5, 2),
    (1, 1, 100.004, 56.0, 2),
    (1, 1, 100.008, 55.8, 2),
    (1, 1, 100.012, 56.2, 2),
    (1, 1, 100.016, 55.7, 2),
    (2, 3, 50.000, 60.5, 3),
    (2, 3, 50.004, 61.0, 3),
    (2, 3, 50.008, 60.8, 3),
    (2, 3, 50.012, 61.2, 3),
    (2, 3, 50.016, 60.7, 3);
