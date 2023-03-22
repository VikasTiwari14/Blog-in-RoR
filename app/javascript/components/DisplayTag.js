import React, {useState, useEffect} from 'react'
import axios from 'axios';

const DisplayTag = ({tags}) => {
    // const [tags, setTags] = useState([]);

    useEffect(() => {
        getTags();
    }, [])

    const getTags = async() => {
        axios.get("/tags.json")
        .then((res) => {
            console.log(res.data);

        })
        .catch((err) => {
            console.log(err);
        })
        // const result = await fetch("http://localhost:3000/tags.json",{
        //     method: "GET",
        //     headers: {
        //         "Content-Type": "application/json"
        //     }
        // })
        
        // console.log(result);
    }
    const style1 = {
        backgroundColor : "#3a3f44",
        color : "white",
        padding: "10px",
        margin: "2px 10px",
        borderRadius: "10px",
    }

    return (
        <div className='d-flex'>
            {
                tags.split(',').map((dt, index) => {
                    return (
                        <div style={style1} key={index}>
                            {dt}
                        </div>
                    )
                })
            }
        </div>
    )
}

export default DisplayTag