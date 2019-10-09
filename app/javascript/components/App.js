import React, { Component } from 'react'
import APIKeysPage from './APIKey/APIKeysPage'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
export default class App extends Component {
  render() {
    return (
      <Router>
        <Switch>
          <Route exact path="/" component={APIKeysPage} />
          {/* <Route exact path="/feed" component={Posts} /> */}
        </Switch>
      </Router>
    )
  }
}
