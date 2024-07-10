import { useState, useEffect } from "react";
import { useSelector } from 'react-redux'
import UpdateAboutCategory from "./modals/updateAboutCategory";
import axios from "axios";
import CreateAboutCategory from "./modals/createAboutCategory";

export default function DisplayDetails({ contactId,contactDetails }) {
    const BASE_URL = 'https://localhost:7272/api';
    const generateKey = (pre1, pre2) => {
        return `${pre1}_${pre2}_${new Date().getTime()}`;
    }

    const [triggerUpdate, setTriggerUpdate] = useState(true)
    const [errors, setErrors] = useState({});

    
    const handleDelete = async (aboutCategoryId) =>{
        try {
            await axios.delete(`${BASE_URL}/contact/${contactId}/aboutcategory/${aboutCategoryId}`)
        }
        catch (err) {
            setErrors(err.message);
            console.log(err);
        }
    }

    const { isLoggedIn } = useSelector(state => state.authenticate)
    return (
        <>
            {contactDetails != null ?
                <table>
                    <thead>
                        <tr>
                            <td>Email</td>
                            <td>Numer telefonu</td>
                            <td>Kategoria</td>
                            <td>Podkategoria</td>
                            {isLoggedIn ? <td>Edytuj</td> : null}
                            {isLoggedIn ? <td>Usuń</td> : null}

                        </tr>
                    </thead>
                    <tbody>
                        {contactDetails.aboutCategories.map(aboutCategory => (
                            <tr key={generateKey(aboutCategory.id, aboutCategory.lastName)}>
                                <td>{aboutCategory.email}</td>
                                <td>{aboutCategory.phoneNumber}</td>
                                <td>{aboutCategory.category}</td>
                                <td>{aboutCategory.subcategory ? aboutCategory.subcategory : "Brak"}</td>
                                {isLoggedIn ? <td><UpdateAboutCategory contactId={contactId} aboutCategoryId={aboutCategory.id}/></td> : null}
                                {isLoggedIn ? <td><button onClick={()=>handleDelete(aboutCategory.id)}>Usuń</button></td> : null}
                            </tr>
                        ))}
                    </tbody>
                </table> : null}
                {isLoggedIn ? <CreateAboutCategory contactId={contactId}/> : null}
        </>
    )
}