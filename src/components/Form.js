import React, { Component } from 'react';
import request from 'superagent';

// CSS
import '../stylesheets/App.css';

class Form extends Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();

    const { _this, onFormInput } = this.props;

    const giphyUrl = `http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=${this.gif.value}`;

    request.get(giphyUrl, (err, res) => {
      onFormInput(_this, res.body.data.image_url);
    });
  }

  render() {
    return (
      <section className="section-wrapper">
        <div className="form-instructions">
          Type in what random gif you would like to see <span role="img" aria-label="smiley">😊</span>!
        </div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" ref={el => this.gif = el} />
          <input type="submit" value="Submit" />
        </form>
      </section>
    );
  }
}

export default Form;
