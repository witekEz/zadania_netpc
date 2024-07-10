import { useState } from "react";
import axios from "axios";
import { jwtDecode } from "jwt-decode";
import { useDispatch, useSelector } from 'react-redux'
import { changeState,changeRole,changeNickName } from "./utilities/redux/authentication";
import setAuthenticationHeader from "./utilities/DefaultAuthenticationHeader";

export default function LoginLogout(){

    const BASE_URL = 'https://localhost:7272/api';

    const [loginForm, setLoginForm] = useState(null);
    const [errors, setErrors] = useState({});
    const [error, setError] = useState({});

    const {isLoggedIn}=useSelector(state=>state.authenticate)
    const dispatch=useDispatch();

    const handleFetchLogin = async (loginForm) => {
        if (loginForm != null) {
            try {
                const result = await axios.post(`${BASE_URL}/account/login`, loginForm)
                const data = await result.data;
                console.log(result);
                sessionStorage.setItem("token", data);

                const aboutUser=jwtDecode(data);
                const role=aboutUser["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"];
                const nickName=aboutUser.NickName;
                dispatch(changeState());
                dispatch(changeRole(role));
                dispatch(changeNickName(nickName));
                setAuthenticationHeader(data);
                
            } catch (error) {
                setError(error);
            }
        }
    }
    const setField = (field, value) => {
        setLoginForm({
            ...loginForm,
            [field]: value
        })
        if (!!errors[field])
            setErrors({
                ...errors,
                [field]: null
            })
    }

    const validate = () => {
        let error = {};
        if (!loginForm.password || loginForm.password.length < 6) {
            error.password = 'Hasło musi posiadać długość minimum 6 znaków';
        }
        return error;
    };

    const handleLogin = (event) => {
        event.preventDefault();
        const errors = validate();
        setErrors(errors);
        handleFetchLogin(loginForm)
    }
    const handleLogout=()=>{
        dispatch(changeState());
        dispatch(changeRole(null));
        dispatch(changeNickName(""));
        sessionStorage.removeItem("token");
        setAuthenticationHeader("nodata");
    }
    return(
        <>
            {!isLoggedIn?<form onSubmit={handleLogin}>
                <label htmlFor="nickName">Nazwa użytkownika</label><br/>
                <input type="text" name="nickName" onChange={(e) => setField('nickName', e.target.value)}/><br/>
                <label htmlFor="password">Hasło</label><br/>
                <input type="password" name="password" onChange={(e) => setField('password', e.target.value)}/><br/><br/>
                <input type="submit" value="Zatwierdź" />
            </form>:<button onClick={handleLogout}>Wyloguj</button>}
            
        </>
    )
}