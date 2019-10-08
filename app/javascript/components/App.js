import React, { Component } from 'react'
import APIKeysPage from './APIKey/APIKeysPage'
import { Route, Switch } from 'react-router-dom'
export default class App extends Component {
  render() {
    return (
      <div>
        <Switch>
          <Route exact path="/" component={APIKeysPage} />
          {/* <Route exact path="/feed" component={Posts} /> */}
        </Switch>
      </div>
    )
  }
}
