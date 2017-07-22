import React from 'react';

export default class QuantityInput extends React.Component {
  render() {
    return (
      <span>
        <input
          name="recipe[recipe_ingredients_attributes][][quantity]"
          value={this.props.quantity}
          onChange={this.props.onQuantityChange}
          />
        <span>cups</span>
      </span>
    );
  }
}

