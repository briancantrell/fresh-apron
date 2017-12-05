import React from 'react';

export class RecipePicker extends React.Component {
  render() {
    var recipeOptions = [];
    this.props.availableRecipes.forEach(function(recipe) {
      recipeOptions.push(
        <option value={recipe.id} key={recipe.id}>
          {recipe.title}
        </option>
      );
    });
    return (
      <div>
        <select
          name="meal[recipe_id]"
          className="recipe-picker"
          >
          {recipeOptions}
        </select>
      </div>
    )
  }
}

export default class MealForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showRecipePicker: false,
      availableRecipes: props.availableRecipes
    }
    this.showRecipePicker = this.showRecipePicker.bind(this);
  }

  showRecipePicker(e) {
    this.setState({
      showRecipePicker: true
    });
  }

  render() {
    var content = ""
    if(this.state.showRecipePicker == true) {
      content = (
        <div>
          <form action="/meals" method="post">
            <RecipePicker availableRecipes={this.props.availableRecipes} />
            <input type='hidden' name='meal[scheduled_at]' value={this.props.scheduled_at} />
            <input type='hidden' name='authenticity_token' value={this.props.authenticity_token} />
            <button>Save</button>

           </form>
        </div>
      );
    }else{
      content = <a onClick={this.showRecipePicker} className="show-recipe-picker">+</a>;
    }
    return (
      <div>
        {content}
      </div>
    )
  }
}

window.MealForm  =  MealForm
