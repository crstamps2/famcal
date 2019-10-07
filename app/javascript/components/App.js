import React, { Component } from 'react'
import APIKey from './APIKey/APIKey'
import axios from 'axios'

export default class App extends Component {
  state = {
    dadAPIKey: '',
    momAPIKey: ''
  }

  handleDadAPIKeyChange = (value) => {
    this.setState({dadAPIKey: value})
  }

  handleMomAPIKeyChange = (value) => {
    this.setState({momAPIKey: value})
  }

  handleSubmit = () => {
    axios.post('/api/keys', {
      dadAPIKey: this.state.dadAPIKey,
      momAPIKey: this.state.momAPIKey
    })
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    })
  }

  render() {
    return (
      <div>
       <APIKey onInputChange={this.handleDadAPIKeyChange} />
       <APIKey onInputChange={this.handleMomAPIKeyChange} />
       <button id='submit' />
      </div>
    )
  }
}