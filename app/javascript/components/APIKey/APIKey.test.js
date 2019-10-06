import { render } from 'enzyme';
import React from 'react'
import APIKey from './APIKey'

it('renders <APIKey />', () =>{
  const component = render(<APIKey />)
  expect(component).toBeDefined()
})