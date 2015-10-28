var HaikuForm = React.createClass({


  render: function() {
    return (
    <form className="haikuForm" onSubmit={this.handleSubmit}>
      <input type="text" placeholder="First Haiku Line" />
      <input type="submit" value="Create Haiku!" />
    </form>
    );
  }

});
