import { mount } from 'enzyme';
import mockAxios from 'jest-mock-axios'
import React from 'react'
import APIKeysPage from './APIKeysPage'
import APIKey from './APIKey'
import { MemoryRouter } from 'react-router-dom'

let wrapper

beforeEach(() => {
  wrapper = mount(
    <MemoryRouter initialEntries={['/']} initialIndex={0}>
      <APIKeysPage />
    </MemoryRouter>
  )
})

afterEach(() => {
  // cleaning up the mess left behind the previous test
  mockAxios.reset();
});

it('renders <APIKeysPage />', () => {
  expect(wrapper.find(APIKeysPage)).toBeDefined()
})

it('has two APIKey wrappers', () => {
  expect(wrapper.find(APIKey)).toHaveLength(2)
})

it('updates state on handleChange', () => {
  const inputField1 = wrapper.find('input').at(0)
  inputField1.simulate('change', {target: {value: 'banana'}})
  expect(wrapper.find('APIKeysPage').state().dadAPIKey).toEqual('banana')
  const inputField2 = wrapper.find('input').at(1)
  inputField2.simulate('change', {target: {value: 'apple'}})
  expect(wrapper.find('APIKeysPage').state().momAPIKey).toEqual('apple')
});

xit('.handleSubmit', () => {
  let catchFn = jest.fn(),
      thenFn = jest.fn()
  global.window = { location: { pathname: null } };
  wrapper.find('input').at(0)
    .simulate('change', {target: {value: 'banana'}})
  wrapper.find('input').at(1)
    .simulate('change', {target: {value: 'apple'}})

  const button = wrapper.find('#submit')
  button.simulate('click')

  mockAxios.get.mockImplementationOnce(() => {
    Promise.resolve()  
  })
  expect(global.window.location.pathname).toEqual('/feed')
})