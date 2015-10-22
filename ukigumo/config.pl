+{
    DBI => [
        'dbi:SQLite:dbname=/opt/ukigumo/ukigumo.db',
        '',
        '',
        +{ sqlite_unicode => 1 }
    ],
    max_num_of_reports => 5000,
    max_num_of_reports_by_branch => 1000,
    enable_compression => 1,
}; 
