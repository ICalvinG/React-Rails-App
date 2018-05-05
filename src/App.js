import React, { Component, Fragment } from 'react';

// CSS
import './App.css';

// Components
import Header from './Header'
import Form from './Form'

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
