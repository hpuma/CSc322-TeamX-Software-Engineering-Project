import React, { Component } from 'react';
import {Card} from 'react-bootstrap';
import Bryan from './ProfileImages/user.png';
import {Link} from 'react-router-dom';
class Cards extends Component {
    constructor(props){
        super(props);
        this.state ={
            name: '',
            rating: 0,
            dataFetched: false
        }

    }
    componentDidMount(){
        this.setState({
            name: this.props.name,
            rating: this.props.rating
        })
    }
    render() {
        
        return (
            <div>
                <Card style={{ width: '18rem' }}>
                    <Card.Img variant="top" src= {Bryan} style={{width:'250px'}}/>
                    <Card.Body>
                        <Card.Title>{this.state.name}</Card.Title>
                        <Card.Text>
                            {this.state.rating}
                        </Card.Text>
                        <Link to={this.props.type == "user" ? "/users/"+ this.props.id: "/projects/" + this.props.id}>
                            View Page
                        </Link>
                    </Card.Body>
                </Card>
            </div>
        );
    }
}

export default Cards;