-- name: CreateAccouts :one
INSERT INTO accounts(
    owner, balance, currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

--name: GetAccount :one
SELECT * FROM accounts
WHERE ID=$1 LIMIT 1;

--name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

--name: Updateaccount :exec
UPDATE accounts
SET balance = $2
WHERE id = $1;


--name: DeletAccount :exec
DELETE accounts
WHERE id= $1;
