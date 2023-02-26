CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE IF NOT EXISTS ld_user_build_query_log (
    uuid uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT NOT NULL,
    node1 TEXT NOT NULL,
    keyword1 TEXT,
    node2 TEXT,
    keyword2 TEXT,
    node3 TEXT,
    keyword3 TEXT,
    dataset TEXT,
    status boolean,
    error_message TEXT,
    logged_at TIMESTAMP DEFAULT NOW()
);