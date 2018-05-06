import React, { Component, Fragment } from 'react';

// CSS
import './stylesheets/App.css';

// Components
import Header from './components/Header'
import Form from './components/Form'

class App extends Component {
  render() {
    return (
      <Fragment>
        <Header />
        <Form />
      </Fragment>
    );
  }
}

export default App;
