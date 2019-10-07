import React, { Component } from 'react'

export default class APIKey extends Component {
  constructor(props) {
    super(props)
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(e) {
    this.props.onInputChange(e.target.value);
  }

  render() {
    return (
      <form>
        <label>
          {this.props.labelName}
        </label>
        <input type="text" onChange={this.handleChange}/>
      </form>
    )
  }
}
