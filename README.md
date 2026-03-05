# 📚 Whatpad — A Wattpad-Inspired Story Platform

A full-stack web application where users can write, publish, and read stories. Built with **React**, **Node.js/Express**, and **MySQL**.

---

## 🚀 Features

- ✍️ Create and publish stories with chapters
- 📖 Read stories with reading progress tracking
- ⭐ Vote on chapters
- 💬 Comment on chapters
- 📚 Create and manage reading lists (public/private)
- 👤 User profiles with avatar and banner
- 🔖 Follow stories and authors
- 🏷️ Browse stories by genre/tag
- 🔍 Search stories and users
- ⭐ Review and rate stories

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React, React Router, Bootstrap 5 |
| Backend | Node.js, Express.js |
| Database | MySQL 8+ |
| Auth | JWT (JSON Web Tokens) |
| File Upload | Cloudinary |

---

## 📁 Project Structure

```
whatpad/
├── backend/
│   ├── database/
│   │   ├── createdb.sql        # Database schema (run first)
│   │   └── seed_stories.sql    # Sample data (run second)
│   ├── migrations/             # DB migration scripts
│   ├── src/
│   │   ├── modules/
│   │   │   ├── auth/           # Login & register
│   │   │   ├── users/          # User profiles
│   │   │   ├── stories/        # Story CRUD
│   │   │   ├── chapters/       # Chapter CRUD
│   │   │   ├── comments/       # Comments
│   │   │   ├── reading-lists/  # Reading lists
│   │   │   ├── reviews/        # Story reviews
│   │   │   ├── follows/        # Follow system
│   │   │   └── tags/           # Genre tags
│   │   ├── mw/
│   │   │   └── auth.js         # JWT middleware
│   │   └── db.js               # MySQL connection pool
│   └── app.js                  # Express app entry point
└── frontend/
    └── src/
        ├── pages/
        │   ├── AuthPage/        # Login & Register
        │   ├── HomePage/        # Story feed
        │   ├── ProfilePage/     # User profile & library
        │   ├── ReadingPage/     # Chapter reader
        │   ├── StoryDetailPage/ # Story overview
        │   └── GenresPage/      # Browse by genre
        ├── services/
        │   └── api.js           # API service layer
        └── App.jsx
```

---

## ⚙️ Setup & Installation

### Prerequisites
- Node.js v18+
- MySQL 8+
- npm or yarn

---

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd whatpad
```

---

### 2. Set Up the Database

**Step 1** — Create the database schema (all tables):
```bash
mysql -u root -p < backend/database/createdb.sql
```

**Step 2** — Seed sample data (users, stories, chapters, tags):
```bash
mysql -u root -p wattpad < backend/database/seed_stories.sql
```

> This creates 8 sample authors and 24 stories across 8 genres (Adventure, Comedy, Drama, Fantasy, Fiction, Horror, Mystery, Romance).

---

### 3. Configure Backend Environment

Create a `.env` file in the `backend/` folder:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=wattpad
JWT_SECRET=your_jwt_secret_key
PORT=4000
```

---

### 4. Install & Run Backend

```bash
cd backend
npm install
npm start
```

Backend runs on: `http://localhost:4000`

---

### 5. Install & Run Frontend

```bash
cd frontend
npm install
npm run dev
```

Frontend runs on: `http://localhost:3000`

---

## 👤 Sample Accounts (from seed data)

All seeded accounts use the password: **`Password123!`**

| Username | Genre Focus |
|----------|------------|
| alex_writes | Adventure |
| comedy_queen | Comedy |
| drama_king | Drama |
| fantasy_forge | Fantasy |
| fiction_files | Fiction |
| horror_hollow | Horror |
| mystery_maven | Mystery |
| romance_rose | Romance |

---

## 🗄️ Database Schema

Key tables:

| Table | Description |
|-------|-------------|
| `users` | User accounts and profiles |
| `stories` | Story metadata |
| `chapters` | Chapter content |
| `reading_lists` | User curated lists |
| `reading_list_stories` | Stories in each list |
| `follows` | User follow relationships |
| `followed_stories` | Story subscriptions |
| `story_tags` | Story genre tags |
| `votes` | Chapter votes |
| `story_comments` | Chapter comments |
| `story_reviews` | Story ratings & reviews |
| `reading_history` | Reading progress |

---

## 📡 API Overview

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register new user |
| POST | `/auth/login` | Login |
| GET | `/stories` | Get all stories |
| POST | `/stories` | Create story |
| GET | `/stories/:id` | Get story details |
| GET | `/users/:id` | Get user profile |
| PUT | `/users/me` | Update profile |
| GET | `/users/:id/reading-lists` | Get user's reading lists |
| POST | `/reading-lists` | Create reading list |
| POST | `/reading-lists/:id/stories` | Add story to list |

---

## 👨‍💻 Developer Notes

- JWT tokens are stored in `localStorage` on the frontend
- All protected routes require `Authorization: Bearer <token>` header
- Cover images are hosted on Cloudinary
- The seed script is safe to re-run (uses `ON DUPLICATE KEY UPDATE`)
