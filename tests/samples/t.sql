SELECT
  t.id,
  SUM(t.date),
  t.description,
  t.type,
  t.frequency,
  t.is_paid,

  e.id,
  e.amount,
  e.currency,
  e.exchange_rate,
  e.category_id,
  e.subcategory_id,
  e.channel_id,
  e.account_id,

  c.name  AS category_name,
  sc.name AS subcategory_name,
  a.name  AS account_name,
  ch.name AS channel_name,

  t.installment_number,
  ig.total_installments,
  ig.start_date AS installment_start_date,
  t.installment_group_id,
  ig.is_canceled,
  ig.original_amount

FROM transactions t
JOIN entries e ON e.transaction_id = t.id

LEFT JOIN categories c ON c.id = e.category_id
LEFT JOIN subcategories sc ON sc.id = e.subcategory_id
LEFT JOIN accounts a ON a.id = e.account_id
LEFT JOIN channels ch ON ch.id = e.channel_id

LEFT JOIN installment_groups ig ON ig.id = t.installment_group_id

WHERE t.deleted_at IS NULL
AND e.deleted_at IS NULL

ORDER BY t.date DESC;


CREATE TABLE entries (
    id               TEXT PRIMARY KEY,
    transaction_id   TEXT NOT NULL,
	channel_id       TEXT NOT NULL,
    account_id       TEXT, 
    amount       INTEGER NOT NULL,
    currency TEXT NOT NULL,
    exchange_rate    REAL NOT NULL,
    category_id      TEXT,
    subcategory_id   TEXT,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    deleted_at DATETIME,
    FOREIGN KEY(transaction_id) REFERENCES transactions(id) ON DELETE CASCADE,
    FOREIGN KEY(account_id)     REFERENCES accounts(id) ON DELETE RESTRICT,
    FOREIGN KEY(channel_id) REFERENCES channels(id) ON DELETE RESTRICT,
    FOREIGN KEY(category_id)    REFERENCES categories(id) ON DELETE SET NULL,
    FOREIGN KEY(subcategory_id) REFERENCES subcategories(id) ON DELETE SET NULL
);

CREATE INDEX idx_transactions_date        ON transactions(date);
CREATE INDEX idx_transactions_installment ON transactions(installment_group_id);
CREATE INDEX idx_entries_transaction      ON entries(transaction_id);
CREATE INDEX idx_entries_account          ON entries(account_id);
CREATE INDEX idx_entries_category         ON entries(category_id);
CREATE INDEX idx_accounts_channel         ON accounts(channel_id);

DROP INDEX idx_accounts_channel;
DROP INDEX idx_entries_category;
DROP INDEX idx_entries_account;
DROP INDEX idx_entries_transaction;
DROP INDEX idx_transactions_installment;
DROP INDEX idx_transactions_date;
DROP TABLE entries;
DROP TABLE transactions;
DROP TABLE installment_groups;
DROP TABLE subcategories;
DROP TABLE categories;
DROP TABLE accounts;
DROP TABLE channels;
