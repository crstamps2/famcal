import { shallow, mount } from 'enzyme';
import React from 'react'
import APIKey from './APIKey'
import { JestEnvironment } from '@jest/environment';

let component
let props = {
  onInputChange: jest.fn()
}

beforeEach(() => {
  component = shallow(<APIKey labelName='apple' {...props} />)
})

it('renders <APIKey />', () =>{
  expect(component).toBeDefined()
})

it('renders labelName from props', () => {
  expect(component.find('label').text()).toEqual('apple')
})

it('calls the prop function on input change', () => {
  component.find('input').simulate('change', { target: { value: 'banana' }})
  expect(props.onInputChange).toHaveBeenCalled()
})