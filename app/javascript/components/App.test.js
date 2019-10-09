import { mount } from 'enzyme';
import React from 'react'
import App from './App'
import { MemoryRouter } from "react-router-dom";

let wrapper

beforeEach(() => {
  wrapper = mount(
    <MemoryRouter>
      <App />
    </MemoryRouter>
  )
})

it('should ', () => {
  expect(true).toEqual(true)
});