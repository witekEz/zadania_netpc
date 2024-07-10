import axios from "axios";

export default function setAuthenticationHeader(token){
    if(token){
        axios.defaults.headers.common['Authorization']=`Bearer ${token}`;
    }
    else{
        delete axios.defaults.common['Authorization'];
    }
}