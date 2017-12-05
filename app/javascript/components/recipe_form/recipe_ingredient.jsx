import React from "react";
import QuantityInput from './quantity_input';

export default class RecipeIngredient extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedIngredient: props.selectedIngredient,
      deleted: false
    }

   this.handleIngredientChange = this.handleIngredientChange.bind(this);
   this.deleteIngredient = this.deleteIngredient.bind(this);
   this.handleQuantityChange = this.handleQuantityChange.bind(this);
  }

  handleIngredientChange(e) {
    var newIngredient = this.props.availableIngredients.find(function(ingredient){
      return e.target.value == ingredient.id;
    });

    this.setState({
      selectedIngredient: newIngredient,
    });
  }

  handleQuantityChange(e) {
    var updatedIngredient = this.state.selectedIngredient;
    updatedIngredient.quantity = e.target.value;
    this.setState({
      selectedIngredient: updatedIngredient
    });
  }

  deleteIngredient(e) {
    this.setState({
      deleted: true
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

    var deletedInput = "";
    if(this.state.deleted == true) {
      deletedInput = <input
        type="hidden"
        name="recipe[recipe_ingredients_attributes][][_destroy]"
        value="true"
        className="hidden-delete-input"
        />;
    };

    return (
      <div className={"fl w-100 pa recipe-ingredient" + (this.state.deleted == true ? " deleted" : "")}>
        <input
          name="recipe[recipe_ingredients_attributes][][id]"
          value={this.props.selectedIngredient.id}
          type="hidden"
          className="mb2"
          />

        <div className="fl w-third">
          <QuantityInput
            quantity={this.state.selectedIngredient.quantity}
            units={this.state.selectedIngredient.units}
            onQuantityChange={this.handleQuantityChange}
            />
        </div>

        <div className="fl w-third">
          <select
            name="recipe[recipe_ingredients_attributes][][ingredient_id]"
            onChange={this.handleIngredientChange}
            value={this.state.selectedIngredient.ingredient_id}
            className="db border-box hover-black measure ba b--black-20 pa2 br2 mb2"
            >
            {ingredientOptions}
          </select>
        </div>

        <div className="fl w-third">
          <button
            onClick={this.deleteIngredient}
            className="delete-button db border-box hover-black measure ba b--black-20 pa2 br2 mb2"
            type="button"
            >
            Delete
          </button>
        </div>

        {deletedInput}
      </div>
    );
  }
}

