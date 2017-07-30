import React from 'react';

export default class QuantityInput extends React.Component {
  render() {
    return (
      <span>
        <input
          name="recipe[recipe_ingredients_attributes][][quantity]"
          value={this.props.quantity}
          onChange={this.props.onQuantityChange}
          size="5"
          className="border-box hover-black  measure ba b--black-20 pa2 br2 mb2"
          />
        <span>{this.props.units}</span>
      </span>
    );
  }
}

