import React from "react";
import QuantityInput from './quantity_input';

export default class RecipeIngredient extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedIngredient: props.selectedIngredient
    }

   this.handleIngredientChange = this.handleIngredientChange.bind(this);
   this.handleQuantityChange = this.handleQuantityChange.bind(this);
  }

  handleIngredientChange(e) {
    var newIngredient = this.props.availableIngredients.find(function(ingredient){
      return e.target.value == ingredient.id;
    });

    this.setState({
      selectedIngredient: newIngredient
    });
  }

  handleQuantityChange(e) {
    var updatedIngredient = this.state.selectedIngredient;
    updatedIngredient.quantity = e.target.value;
    this.setState({
      selectedIngredient: updatedIngredient
    });
  }

  render() {
    var ingredientOptions = [];

    this.props.availableIngredients.forEach(function(ingredient) {
      ingredientOptions.push(
        <option value={ingredient.id} key={ingredient.id}>
          {ingredient.name}
        </option>
      );
    });

    return (
      <div>
        <QuantityInput
          quantity={this.state.selectedIngredient.quantity}
          onQuantityChange={this.handleQuantityChange}
          />

        <select
          name="recipe[recipe_ingredients_attributes][][ingredient_id]"
          onChange={this.handleIngredientChange}
          value={this.state.selectedIngredient.ingredient_id}
          >
          {ingredientOptions}
        </select>
      </div>
    );
  }
}

