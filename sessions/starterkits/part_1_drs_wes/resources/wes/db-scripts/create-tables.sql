CREATE TABLE wes_run (
    id TEXT PRIMARY KEY,
    workflow_type TEXT NOT NULL,
    workflow_type_version TEXT,
    workflow_url TEXT NOT NULL,
    workflow_params TEXT NOT NULL,
    workflow_engine TEXT NOT NULL,
    workflow_engine_version TEXT,
    cromwell_run_id TEXT,
    final_run_log_json TEXT
);