import "./Footer.css";

const Footer = () => {
  return (
    <footer className="footer">
      <div className="footer-inner">
        <div className="footer-brand">
          <img src="/inkytinky-logo-v2.jpg" alt="InkyTinky" className="footer-logo" />
          <p className="footer-tagline">— stories that stain the soul —</p>
        </div>

        <div className="footer-links">
          <a href="/">Home</a>
          <a href="/genres">Genres</a>
          <a href="/search">Explore</a>
          <a href="/auth">Login</a>
        </div>
      </div>

      <div className="footer-bottom">
        <p className="footer-content">
          &copy; {new Date().getFullYear()} InkyTinky. All rights reserved. &nbsp;|&nbsp; READ · WRITE · DREAM
        </p>
      </div>
    </footer>
  );
};

export default Footer;
