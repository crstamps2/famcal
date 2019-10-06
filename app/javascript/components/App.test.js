import { shallow } from 'enzyme';
import React from 'react'
import App from './App'
import APIKey from './APIKey/APIKey'

let component

beforeEach(() => {
  component = shallow(<App />)
})

it('renders <App />', () => {
  expect(component).toBeDefined()
})

it('has two APIKey components', () => {
  expect(component.find(APIKey)).toHaveLength(2)
})

