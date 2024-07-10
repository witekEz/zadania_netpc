import { createSlice } from "@reduxjs/toolkit";

const initialState={
    isLoggedIn:false,
    role:"User",
    nickName:""
}

export const authSlice=createSlice({
    name: 'auth',
    initialState,
    reducers:{
        changeState:(state)=>{
            state.isLoggedIn = !state.isLoggedIn;
        },
        changeRole:(state, action)=>{
            state.role=action.payload;
        },
        changeNickName:(state, action)=>{
            state.name=action.payload;
        }
    }
})
export const {changeState,changeRole, changeNickName}=authSlice.actions;
export default authSlice.reducer;