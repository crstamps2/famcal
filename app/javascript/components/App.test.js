import { mount } from 'enzyme';
import axios from 'axios'
import MockAdapter from 'axios-mock-adapter'
import React from 'react'
import App from './App'
import APIKey from './APIKey/APIKey'

let wrapper

beforeEach(() => {
  wrapper = mount(<App />)
})

it('renders <App />', () => {
  expect(wrapper).toBeDefined()
})

it('has two APIKey wrappers', () => {
  expect(wrapper.find(APIKey)).toHaveLength(2)
})

it('updates state on handleChange', () => {
  const inputField1 = wrapper.find('input').at(0)
  inputField1.simulate('change', {target: {value: 'banana'}})
  expect(wrapper.state().dadAPIKey).toEqual('banana')
  const inputField2 = wrapper.find('input').at(1)
  inputField2.simulate('change', {target: {value: 'apple'}})
  expect(wrapper.state().momAPIKey).toEqual('apple')
});

it('.handleSubmit', () => {
  wrapper.find('input').at(0)
    .simulate('change', {target: {value: 'banana'}})
  wrapper.find('input').at(1)
    .simulate('change', {target: {value: 'apple'}})

  const button = wrapper.find('#submit')
  button.simulate('click')

  const mock = new MockAdapter(axios);
  mock
   .onPost("/api/keys")
   .reply(200);
})