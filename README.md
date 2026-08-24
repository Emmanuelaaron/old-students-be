# HCLV Old Students' Association — API Backend

Rails 7.1 API for the Holy Cross Lake View SSS Old Students' Association system.
Pairs with the React frontend in `../old-students-fe`.

## Setup

Requires PostgreSQL. Locally uses peer auth over the Unix socket (no password). Override with `DATABASE_HOST`, `DATABASE_USERNAME`, and `DATABASE_PASSWORD` when needed.

```bash
cd old-students-be
bundle install
bin/rails db:prepare db:seed
bin/rails server -p 3001
```

Creates databases `lakeview_development` and `lakeview_test`.

API base URL: `http://localhost:3001/api/v1`

## Auth

Use Bearer tokens. Login/register return `{ token, member }`. Send:

```
Authorization: Bearer <token>
```

### Demo accounts (from seed)

| Role   | Email                        | Login                          |
|--------|------------------------------|--------------------------------|
| Admin  | emmanuelisabirye9@gmail.com   | Email or phone, then OTP       |
| Member | emowprinters@gmail.com       | Email or phone, then OTP      |

## Endpoints

| Method | Path | Who | Description |
|--------|------|-----|-------------|
| POST | `/auth/register` | public | Register (pending approval) |
| POST | `/auth/login` | public | Login |
| GET | `/auth/me` | auth | Current member |
| DELETE | `/auth/logout` | auth | Clear token |
| GET | `/stats` | public | Approved count + contribution amounts |
| GET | `/dashboard` | admin | Overview metrics |
| GET | `/members` | admin | Approved members (`?q=` search) |
| GET | `/members/pending` | admin | Pending registrations |
| GET | `/members/:id` | admin/self | Member detail |
| POST | `/members/:id/approve` | admin | Approve member |
| DELETE | `/members/:id` | admin | Reject / remove member |
| GET | `/contributions` | auth | All (admin) or own (member) |
| GET | `/contributions/mine` | auth | Own contributions |
| GET | `/contributions/unpaid_fines` | admin | Outstanding fines |
| POST | `/contributions` | admin | Record payment (`member_id`, `month`, `paid_at`) |
| PATCH | `/contributions/:id/mark_fine_paid` | admin | Settle fine |

## Business rules

- Monthly contribution: **UGX 100,000**
- Late fine: **10% (UGX 10,000)** if paid after the 5th of the following month
- New registrations require admin approval before portal access / contributions

## Example

```bash
# Login
curl -s -X POST http://localhost:3001/api/v1/auth/request_otp \
  -H 'Content-Type: application/json' \
  -d '{"identifier":"emmanuelisabirye9@gmail.com"}'

# Dashboard (replace TOKEN)
curl -s http://localhost:3001/api/v1/dashboard \
  -H 'Authorization: Bearer TOKEN'
```
