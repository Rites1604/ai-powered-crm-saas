CREATE TABLE users(id UUID PRIMARY KEY,email TEXT UNIQUE NOT NULL,password_hash TEXT NOT NULL,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE leads(id UUID PRIMARY KEY,user_id UUID REFERENCES users(id),name TEXT NOT NULL,company TEXT,email TEXT,phone TEXT,status TEXT DEFAULT 'New',source TEXT,value NUMERIC DEFAULT 0,ai_score INTEGER,notes TEXT,follow_up_at TIMESTAMPTZ,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE activities(id UUID PRIMARY KEY,lead_id UUID REFERENCES leads(id),type TEXT NOT NULL,content TEXT,created_at TIMESTAMPTZ DEFAULT now());
CREATE INDEX leads_status_idx ON leads(status); CREATE INDEX leads_score_idx ON leads(ai_score);
