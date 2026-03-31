# HearHub Backend

Node.js + Express backend for HearHub authentication, using MongoDB and JWT.

## Tech Stack

- Express.js
- MongoDB + Mongoose
- bcryptjs (password hashing)
- jsonwebtoken (JWT auth)
- dotenv
- cors
- nodemon

## Setup

1. Install dependencies:

```bash
npm install
```

2. Create `.env` from `.env.example`:

```bash
cp .env.example .env
```

3. Fill `.env` values:

- `PORT`
- `MONGODB_URI`
- `JWT_SECRET`
- `JWT_EXPIRES_IN`

4. Run in development:

```bash
npm run dev
```

5. Run in production mode:

```bash
npm start
```

## API Endpoints

Base URL: `http://localhost:5001`

### Health Check

- `GET /api/health`

### Auth

- `POST /api/auth/register`
- `POST /api/auth/login`
- `GET /api/auth/me` (protected, Bearer token required)

## Example Request Bodies

### Register

`POST /api/auth/register`

```json
{
  "name": "Rishita Bhatt",
  "email": "rishita@example.com",
  "password": "StrongPass123"
}
```

### Login

`POST /api/auth/login`

```json
{
  "email": "rishita@example.com",
  "password": "StrongPass123"
}
```

### Me (Protected)

`GET /api/auth/me`

Header:

```text
Authorization: Bearer <your_jwt_token>
```

## cURL Examples

```bash
curl -X POST http://localhost:5001/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Rishita Bhatt","email":"rishita@example.com","password":"StrongPass123"}'
```

```bash
curl -X POST http://localhost:5001/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"rishita@example.com","password":"StrongPass123"}'
```

```bash
curl http://localhost:5001/api/auth/me \
  -H "Authorization: Bearer <your_jwt_token>"
```
