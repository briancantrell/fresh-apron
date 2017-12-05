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
    newIngredients.push({ name: "", quantity: "" })
    this.setState({
      currentIngredients: newIngredients
    });
  }

  render() {
    var availableIngredients = this.props.availableIngredients;
    var ingredientsComponents = [];

    this.state.currentIngredients.forEach(function(ingredient, index){
      var key = "ingredient-" + index;

      ingredientsComponents.push(
       <RecipeIngredient
        selectedIngredient={ingredient}
        availableIngredients={availableIngredients}
        key={key}
        />);
    });

    return (
      <div>
        {ingredientsComponents}
        <input type="button" value="Add ingredient" onClick={this.addIngredient} className="db border-box hover-black measure ba b--black-20 pa2 br2 mb2" />
      </div>
    );
  }
}

window.RecipeIngredientsList  =  RecipeIngredientsList
