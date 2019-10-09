import React, { Component } from 'react'
import APIKey from './APIKey'
import axios from 'axios'
import { withRouter } from 'react-router-dom'

class APIKeysPage extends Component {
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
   saveKeys({
      keys: {
        dadAPIKey: {
          name: 'dadAPIKey',
          value: this.state.dadAPIKey
        },
        momAPIKey: {
          name: 'momAPIKey',
          value: this.state.momAPIKey
        }
      }
    })
    .then(function (response) {
      this.props.history.push('/feed')
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
       <button id='submit' onClick={this.handleSubmit}>Submit</button>
      </div>
    )
  }
}

// Action code 

const saveKeys = (keys) => {
  return axios.post('/api/saveKeys', keys)
}

export default withRouter(APIKeysPage)