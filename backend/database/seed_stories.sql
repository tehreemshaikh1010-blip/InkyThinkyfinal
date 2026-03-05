-- ============================================================
-- SEED DATA: Users + Stories + Chapters + Tags
-- Run this against your wattpad database
-- Usage: mysql -u root -p wattpad < seed_stories.sql
-- ============================================================

USE wattpad;

-- ============================================================
-- 1. INSERT SAMPLE USERS (8 authors, one per genre flavor)
-- password_hash is bcrypt of "Password123!" for all users
-- ============================================================
INSERT INTO users (username, email, password_hash, avatar_url, bio, created_at, updated_at) VALUES
('alex_writes',    'alex@example.com',    '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=1',  'Adventure lover. I write stories that take you to the edge of the world.', NOW(), NOW()),
('comedy_queen',   'comedy@example.com',  '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=2',  'Life is too short to be serious. I write stories that make you laugh.', NOW(), NOW()),
('drama_king',     'drama@example.com',   '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=3',  'Emotions are my specialty. Every story is a journey of the heart.', NOW(), NOW()),
('fantasy_forge',  'fantasy@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=4',  'World builder. Dragon tamer. I create realms you never want to leave.', NOW(), NOW()),
('fiction_files',  'fiction@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=5',  'Fiction is the lie through which we tell the truth.', NOW(), NOW()),
('horror_hollow',  'horror@example.com',  '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=6',  'I write the things that go bump in the night. Sleep tight.', NOW(), NOW()),
('mystery_maven',  'mystery@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=7',  'Every story is a puzzle. Can you solve it before the last page?', NOW(), NOW()),
('romance_rose',   'romance@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://i.pravatar.cc/150?img=8',  'Love stories are my language. HEA guaranteed.', NOW(), NOW())
ON DUPLICATE KEY UPDATE username = username;

-- ============================================================
-- 2. ENSURE TAGS EXIST
-- ============================================================
INSERT INTO tags (name, usage_count) VALUES
('Adventure', 0), ('Comedy', 0), ('Drama', 0), ('Fantasy', 0),
('Fiction', 0), ('Horror', 0), ('Mystery', 0), ('Romance', 0)
ON DUPLICATE KEY UPDATE name = name;

-- ============================================================
-- 3. INSERT STORIES
-- Cover images from picsum.photos (stable, reliable CDN)
-- ============================================================

-- === ADVENTURE (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Lost Expedition',
'A team of explorers ventures into uncharted jungle territory searching for a lost civilization. What they find will change everything they thought they knew about human history.',
'https://picsum.photos/seed/adventure1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'alex_writes';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Storm Chasers',
'Two rival storm chasers find themselves working together when a category 6 hurricane threatens to destroy an entire coastal city. Racing against time and nature itself.',
'https://picsum.photos/seed/adventure2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'alex_writes';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Peak of No Return',
'A solo mountaineer attempts to summit the world most dangerous peak in winter. When disaster strikes at 8000 meters, survival becomes the only goal.',
'https://picsum.photos/seed/adventure3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fiction_files';

-- === COMEDY (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'My Terrible Roommate',
'When college student Mia gets paired with the most chaotic roommate on campus, she discovers that sometimes the worst situations lead to the best friendships.',
'https://picsum.photos/seed/comedy1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'comedy_queen';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'How I Accidentally Became Famous',
'One embarrassing video, ten million views, and a life completely turned upside down. Jake never wanted to be internet famous but the internet had other plans.',
'https://picsum.photos/seed/comedy2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'comedy_queen';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Wedding Disaster',
'Bridesmaid Sophie has one job: make sure nothing goes wrong at her best friend''s wedding. She fails spectacularly in every possible way.',
'https://picsum.photos/seed/comedy3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'drama_king';

-- === DRAMA (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Last Letter',
'After her mother passes away, Emma discovers a box of unsent letters that reveal a secret life she never knew existed. A story about grief, forgiveness, and truth.',
'https://picsum.photos/seed/drama1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'drama_king';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Broken Bridges',
'Two estranged brothers are forced back together when their childhood home floods. Three days, thirty years of silence, and one chance to repair what was broken.',
'https://picsum.photos/seed/drama2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'drama_king';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Price of Silence',
'A journalist uncovers a story that could destroy her family. Told she must choose between truth and loyalty, she realizes some prices are too high to pay.',
'https://picsum.photos/seed/drama3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fiction_files';

-- === FANTASY (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Dragon Keeper',
'In a world where dragons are hunted to extinction, seventeen-year-old Kira discovers a dragon egg hidden in her grandfather''s attic. Now she must protect it with her life.',
'https://picsum.photos/seed/fantasy1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fantasy_forge';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Crown of Ash',
'The prophecy said a queen would rise from the ashes of the old kingdom. No one expected her to be a thief from the slums with magic in her blood.',
'https://picsum.photos/seed/fantasy2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fantasy_forge';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Hollow Throne',
'When the immortal king disappears, five heirs battle for a throne that carries an ancient curse. Magic, betrayal, and a secret that could shatter the entire realm.',
'https://picsum.photos/seed/fantasy3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fantasy_forge';

-- === FICTION (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Cartographer''s Daughter',
'Growing up with a father who mapped imaginary worlds, Lily never learned to navigate the real one. Until a box of his old maps leads her somewhere she never expected.',
'https://picsum.photos/seed/fiction1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fiction_files';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Parallel Lines',
'Two strangers on the same train read the same book on the same day every year for a decade. A quiet, beautiful story about connection and the paths we almost take.',
'https://picsum.photos/seed/fiction2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'fiction_files';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Last Bookshop',
'In a world where physical books are illegal, one woman runs the last underground bookshop. A love letter to reading and the power of stories to survive anything.',
'https://picsum.photos/seed/fiction3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'drama_king';

-- === HORROR (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The House on Mill Street',
'The Hendersons thought they were getting a great deal on the old house. They didn''t ask why it had been empty for thirty years. They should have asked.',
'https://picsum.photos/seed/horror1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'horror_hollow';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Don''t Look Behind You',
'Every night at 3am, Nadia hears footsteps in her apartment. The police say no one is there. The footsteps say otherwise.',
'https://picsum.photos/seed/horror2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'horror_hollow';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Smiling Man',
'A sleep researcher begins documenting a recurring figure in her subjects'' dreams: a smiling man who should not exist. Then she starts dreaming of him too.',
'https://picsum.photos/seed/horror3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'horror_hollow';

-- === MYSTERY (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Vanishing at Vail Manor',
'Detective Clara Reeves is called to investigate when a reclusive billionaire vanishes from his locked estate during a dinner party. Everyone is a suspect.',
'https://picsum.photos/seed/mystery1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'mystery_maven';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Cold Case: Evelyn Shore',
'A true crime podcaster reopens a twenty-year-old cold case and realizes the killer may still be living in her small town. And they know she''s looking.',
'https://picsum.photos/seed/mystery2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'mystery_maven';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Seven Suspects',
'When a famous author is poisoned at his own book launch, every guest had motive. Detective Park has one night to solve it before the killer disappears.',
'https://picsum.photos/seed/mystery3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'mystery_maven';

-- === ROMANCE (3 stories) ===
INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'The Coffee Shop Stranger',
'Every morning for a year, Lily and the mysterious stranger order the same coffee at the same time. On the day she finally works up the courage to speak, he''s gone.',
'https://picsum.photos/seed/romance1/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'romance_rose';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Enemies to Lovers: An Office Story',
'Marketing director Zoe and her infuriating new colleague Jake are forced to work together on the biggest campaign of their careers. Hate was never supposed to feel like this.',
'https://picsum.photos/seed/romance2/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'romance_rose';

INSERT INTO stories (user_id, title, description, cover_url, status, created_at, updated_at)
SELECT id, 'Letters from the Sea',
'A marine biologist finds a waterproof journal washed ashore. The entries are from a sailor lost at sea. She begins writing back, not knowing if he''ll ever read it.',
'https://picsum.photos/seed/romance3/300/450', 'published', NOW(), NOW()
FROM users WHERE username = 'romance_rose';

-- ============================================================
-- 4. TAG ALL STORIES
-- ============================================================

-- Adventure stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The Lost Expedition', 'Storm Chasers', 'Peak of No Return')
AND t.name = 'Adventure'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Comedy stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('My Terrible Roommate', 'How I Accidentally Became Famous', 'The Wedding Disaster')
AND t.name = 'Comedy'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Drama stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The Last Letter', 'Broken Bridges', 'The Price of Silence')
AND t.name = 'Drama'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Fantasy stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The Dragon Keeper', 'Crown of Ash', 'The Hollow Throne')
AND t.name = 'Fantasy'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Fiction stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The Cartographer''s Daughter', 'Parallel Lines', 'The Last Bookshop')
AND t.name = 'Fiction'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Horror stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The House on Mill Street', 'Don''t Look Behind You', 'The Smiling Man')
AND t.name = 'Horror'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Mystery stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The Vanishing at Vail Manor', 'Cold Case: Evelyn Shore', 'Seven Suspects')
AND t.name = 'Mystery'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- Romance stories
INSERT INTO story_tags (story_id, tag_id)
SELECT s.id, t.id FROM stories s, tags t
WHERE s.title IN ('The Coffee Shop Stranger', 'Enemies to Lovers: An Office Story', 'Letters from the Sea')
AND t.name = 'Romance'
ON DUPLICATE KEY UPDATE story_id = story_id;

-- ============================================================
-- 5. INSERT SAMPLE CHAPTERS (1 chapter per story)
-- ============================================================

INSERT INTO chapters (story_id, title, content, chapter_order, is_published, created_at, updated_at)
SELECT s.id, 'Chapter 1: The Beginning',
'The morning started like any other, but by the time the sun set, nothing would ever be the same again. 

The air was thick with anticipation as the first steps were taken into the unknown. Every heartbeat felt louder, every breath more deliberate. This was the moment everything had been leading to.

Looking back, it seemed impossible that so much could change in such a short time. But that is the nature of great stories — they begin with a single, unremarkable step, and end somewhere no one could have predicted.

The journey ahead was long. The road was uncertain. But one thing was absolutely clear: there was no turning back now.',
1, 1, NOW(), NOW()
FROM stories s
WHERE s.title IN (
  'The Lost Expedition', 'Storm Chasers', 'Peak of No Return',
  'My Terrible Roommate', 'How I Accidentally Became Famous', 'The Wedding Disaster',
  'The Last Letter', 'Broken Bridges', 'The Price of Silence',
  'The Dragon Keeper', 'Crown of Ash', 'The Hollow Throne',
  'The Cartographer''s Daughter', 'Parallel Lines', 'The Last Bookshop',
  'The House on Mill Street', 'Don''t Look Behind You', 'The Smiling Man',
  'The Vanishing at Vail Manor', 'Cold Case: Evelyn Shore', 'Seven Suspects',
  'The Coffee Shop Stranger', 'Enemies to Lovers: An Office Story', 'Letters from the Sea'
);

-- ============================================================
-- Done! 8 users, 24 stories, 24 chapters, all tagged.
-- Login with any seeded user: password is "Password123!"
-- ============================================================
SELECT 'Seed complete!' as status;
SELECT COUNT(*) as total_stories FROM stories;
SELECT COUNT(*) as total_chapters FROM chapters;
SELECT COUNT(*) as total_story_tags FROM story_tags;
