CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(30) NOT NULL
);
CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date TIMESTAMP NOT NULL,
  location VARCHAR(255) NOT NULL,
  description TEXT
);
CREATE TABLE rehearsal_members (
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  RSVP_status VARCHAR(30),
  attendance BOOLEAN,
  PRIMARY KEY (rehearsal_id, user_id)
);
CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  type VARCHAR(50),
  sent_at TIMESTAMP,
  payload JSONB
);
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER REFERENCES users(id),
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  content TEXT,
  timestamp TIMESTAMP
);