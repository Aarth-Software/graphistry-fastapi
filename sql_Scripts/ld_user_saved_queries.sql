CREATE TABLE IF NOT EXISTS ld_user_saved_queries (
    uuid uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT NOT NULL,
    query_name TEXT NOT NULL,
	selection_type varchar(50) NOT NULL,
    node1 TEXT NOT NULL,
    keyword1 TEXT,
    node2 TEXT,
    keyword2 TEXT,
    node3 TEXT,
    keyword3 TEXT,
    dataset TEXT,
    save_time TIMESTAMP DEFAULT NOW()
);