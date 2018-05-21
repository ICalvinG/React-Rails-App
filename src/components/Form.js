import React, { Component } from 'react';
import request from 'superagent';

// CSS
import '../stylesheets/App.css';

class Form extends Component {
  constructor(props) {
    super(props);
    this.state = {
      value: '',
      url: '',
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});

    const giphyUrl = `http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=${this.state.value}`;

    request.get(giphyUrl, (err, res) => {
      this.setState({ url: res.body.data.image_url })
    });
  }

  handleSubmit(event) {
    event.preventDefault();

    const { _this, onFormInput } = this.props;

    onFormInput(_this, this.state.url);
  }

  render() {
    return (
      <section className="section-wrapper">
        <div className="form-instructions">
          Type in what random gif you would like to see <span role="img">😊</span>!
        </div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" value={this.state.value} onChange={this.handleChange} />
          <input type="submit" value="Submit" />
        </form>
      </section>
    );
  }
}

export default Form;
