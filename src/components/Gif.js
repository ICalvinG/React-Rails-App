import React, { Component } from 'react';

// CSS
import '../stylesheets/App.css';

class Gif extends Component {
  constructor() {
    super();

    this.state = {
      copySuccess: '',
      currentUrl: '',
    }
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.url !== this.state.currentUrl) {
      this.setState({ copySuccess: '' });
    }
  }

  copyToClipboard(url) {
    window.prompt("Copy to clipboard: Ctrl+C, Enter", url);

    this.setState({
      copySuccess: 'success',
      currentUrl: url
    });
  };

  render() {

    const { url } = this.props
    const { copySuccess } = this.state

    return (
      <section className="section-wrapper">
        <div className="gif-status">
          { url &&
            ( copySuccess !== ''
              ? 'You have successfully copied this gif!'
              : 'Click gif to copy url!'
            )
          }
        </div>
        <img
          src={url}
          alt=""
          onClick={el => this.copyToClipboard(url)}
        />
      </section>
    );
  }
}

export default Gif;
