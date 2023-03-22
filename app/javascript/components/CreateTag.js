import React, { useState } from 'react'
import axios from 'axios';

const CreateTag = () => {
    const [tagName, setTagName] = useState("");

    const handleClick = async(e) => {
        e.preventDefault();
        const config = {
            url : "/tags.json",
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            data: JSON.stringify({
                name : tagName
            })
        }

        axios(config)
        .then((res) => {
            console.log(res);
        })
        .catch((err) => {
            console.log(err);
        })
    }
    return (
        <div style={{backgroundColor : "#3a3f44", padding: "10px", display:"grid", gridTemplateColumns: "2fr 1fr", alignItems: "center", gridGap: "20px"}}>
            <input type="text" style={{fontSize: "16px", padding: "14px", backgroundColor: "white", color:"black", border: "none", borderRadius: "8px"}} value={tagName} onChange={(e) => setTagName(e.target.value)} />
            <button className='btn btn-warning' onClick={handleClick}>Create Tag</button>
        </div>
    )
}

export default CreateTag