import React, { Component } from 'react'

class Dashboard extends Component {
  constructor(props, { authData }) {
    super(props)
    authData = this.props
  }

  render() {
    return(
      <main className="container">
        <div className="pure-g">
          <div className="pure-u-1-1">
            <h1>Dashboard</h1>
            <p>
              <h1>Congratulations!! You have logined using uPort</h1> 
              <h2>Name:  {this.props.authData.name}</h2>
              <h2>Email:  {this.props.authData.email}</h2> 
              <h2>Phone:  {this.props.authData.phone}</h2> 
            
            </p>
          </div>
        </div>
      </main>
    )
  }
}

export default Dashboard
