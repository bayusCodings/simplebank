-- name: CreateEntry :one
INSERT INTO entries (
  account_id,
  amount
) VALUES (
  $1, $2
) RETURNING *;

-- name: GetEntry :one
SELECT * from entries
where id = $1 LIMIT 1;

-- name: ListEntries :many
SELECT * from entries
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateEntry :one
UPDATE entries
SET amount = $2
where id = $1
RETURNING *;

-- name: DeleteEntry :exec
DELETE from entries
where id = $1;
