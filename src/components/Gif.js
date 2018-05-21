import React from 'react';

// CSS
import '../stylesheets/App.css';

const Gif = (url) => (
  <section className="section-wrapper">
    <img src={url.url} alt="" />
  </section>
);

export default Gif;
