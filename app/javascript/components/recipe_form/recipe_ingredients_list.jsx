import React from 'react';
import RecipeIngredient from './recipe_ingredient';

export default class RecipeIngredientsList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentIngredients: props.currentIngredients
    }

   this.addIngredient = this.addIngredient.bind(this);
  }

  addIngredient() {
    var newIngredients = this.state.currentIngredients
    newIngredients.push({ name: "" })
    this.setState({
      currentIngredients: newIngredients
    });
  }

  render() {
    var availableIngredients = this.props.availableIngredients;
    var ingredientsComponents = [];

    this.state.currentIngredients.forEach(function(ingredient){
     ingredientsComponents.push(
       <RecipeIngredient
        selectedIngredient={ingredient}
        availableIngredients={availableIngredients}
        key={ingredient.ingredient_id}
        />);
    });

    return (
      <div>
        <ul>
          {ingredientsComponents}
        </ul>
        <input type="button" value="Add ingredient" onClick={this.addIngredient} />
      </div>
    );
  }
}

window.RecipeIngredientsList  =  RecipeIngredientsList
