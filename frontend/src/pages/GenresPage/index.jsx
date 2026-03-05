import { useState, useEffect } from "react";
import { Container, Spinner } from "react-bootstrap";
import { useNavigate } from "react-router";
import { getTags, getStories } from "../../services/api";
import styles from "./GenresPage.module.css";

const GenresPage = () => {
  const [genres, setGenres] = useState([]);
  const [loading, setLoading] = useState(true);
  const [activeGenre, setActiveGenre] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchGenresWithStories = async () => {
      try {
        setLoading(true);
        const tagsResponse = await getTags();
        const tags = tagsResponse.tags || [];

        // Fetch stories for each tag in parallel
        const genreData = await Promise.all(
          tags.map(async (tag) => {
            try {
              const storiesResponse = await getStories({ tag: tag.name, size: 10 });
              return {
                id: tag.id,
                name: tag.name,
                stories: storiesResponse.stories || [],
              };
            } catch {
              return { id: tag.id, name: tag.name, stories: [] };
            }
          })
        );

        // Only keep genres that have stories
        const filledGenres = genreData.filter((g) => g.stories.length > 0);
        setGenres(filledGenres);
        if (filledGenres.length > 0) setActiveGenre(filledGenres[0].id);
      } catch (err) {
        console.error("Error fetching genres:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchGenresWithStories();
  }, []);

  if (loading) {
    return (
      <div className={styles.loadingWrapper}>
        <Spinner animation="border" style={{ color: "#c9a84c" }} />
        <p>Loading genres...</p>
      </div>
    );
  }

  return (
    <div className={styles.genresPage}>
      {/* Page Header */}
      <div className={styles.pageHeader}>
        <Container>
          <h1 className={styles.pageTitle}>Browse by Genre</h1>
          <p className={styles.pageSubtitle}>Find your next favourite story</p>
        </Container>
      </div>

      <Container>
        <div className={styles.layout}>

          {/* Sidebar — genre pills */}
          <aside className={styles.sidebar}>
            <h3 className={styles.sidebarTitle}>Genres</h3>
            <ul className={styles.genreList}>
              {genres.map((genre) => (
                <li key={genre.id}>
                  <button
                    className={`${styles.genreBtn} ${activeGenre === genre.id ? styles.active : ""}`}
                    onClick={() => {
                      setActiveGenre(genre.id);
                      document.getElementById(`genre-${genre.id}`)?.scrollIntoView({ behavior: "smooth", block: "start" });
                    }}
                  >
                    {genre.name}
                    <span className={styles.storyCount}>{genre.stories.length}</span>
                  </button>
                </li>
              ))}
            </ul>
          </aside>

          {/* Main content — genre sections */}
          <main className={styles.mainContent}>
            {genres.length === 0 ? (
              <div className={styles.emptyState}>
                <i className="bi bi-journal-x"></i>
                <p>No stories found. Start writing!</p>
              </div>
            ) : (
              genres.map((genre) => (
                <section key={genre.id} id={`genre-${genre.id}`} className={styles.genreSection}>
                  {/* Genre heading */}
                  <div className={styles.genreHeader}>
                    <h2 className={styles.genreName}>{genre.name}</h2>
                    <button
                      className={styles.viewAllBtn}
                      onClick={() => navigate(`/search?tag=${encodeURIComponent(genre.name)}`)}
                    >
                      View all →
                    </button>
                  </div>

                  {/* Story cards */}
                  <div className={styles.storiesGrid}>
                    {genre.stories.map((story) => (
                      <div
                        key={story.id}
                        className={styles.storyCard}
                        onClick={() => navigate(`/story/${story.id}`)}
                      >
                        <div className={styles.coverWrapper}>
                          <img
                            src={story.cover_url || "/assests/icons/default-cover.png"}
                            alt={story.title}
                            className={styles.coverImg}
                            onError={(e) => { e.target.src = "/assests/icons/default-cover.png"; }}
                          />
                          <div className={styles.coverOverlay}>
                            <span className={styles.readNow}>Read Now</span>
                          </div>
                        </div>
                        <div className={styles.cardInfo}>
                          <h4 className={styles.storyTitle}>{story.title}</h4>
                          <p className={styles.storyAuthor}>by {story.author_name || story.username}</p>
                          <div className={styles.storyStats}>
                            <span><i className="bi bi-eye"></i> {story.read_count || 0}</span>
                            <span><i className="bi bi-star"></i> {story.vote_count || 0}</span>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </section>
              ))
            )}
          </main>

        </div>
      </Container>
    </div>
  );
};

export default GenresPage;
