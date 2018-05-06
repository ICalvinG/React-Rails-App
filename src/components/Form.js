import React, { Component } from 'react';

// CSS
import '../stylesheets/App.css';

class Form extends Component {
  constructor(props) {
    super(props);
    this.state = {
      value: '',
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();

    const { _this, onFormInput } = this.props;

    onFormInput(_this, this.state.value);
  }

  render() {
    return (
      <section className="section-wrapper">
        <div className="form-instructions">
          Type in what random gif you would like to see <span role="img">😊</span>!
        </div>
        <form onSubmit={this.handleSubmit}>
          <label>
            Name:
            <input type="text" value={this.state.value} onChange={this.handleChange} />
          </label>
          <input type="submit" value="Submit" />
        </form>
      </section>
    );
  }
}

export default Form;
