import React, { Component, Fragment } from 'react';

// CSS
import './stylesheets/App.css';

// Components
import Header from './components/Header'
import Form from './components/Form'
import Gif from './components/Gif'

class App extends Component {
  constructor() {
    super();

    this.state = {
      url: '',
    }
  }

  handleRandomInput(_this, url) {
    _this.setState({url: url});
  }

  componentWillUnMount() {
    debugger;
  }

  render() {
    return (
      <Fragment>
        <Header />
        <Form
          _this={this}
          onFormInput={this.handleRandomInput}
        />
        <Gif url={this.state.url}/>
      </Fragment>
    );
  }
}

export default App;
