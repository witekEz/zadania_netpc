import { useEffect, useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import axios from 'axios';
import React from "react";

export default function CreateContact({onRefresh}) {
    const BASE_URL = 'https://localhost:7272/api';

    const generateKey = (pre1, pre2) => {
        return `${pre1}_${pre2}_${new Date().getTime()}`;
    }
    const [show, setShow] = useState(false);
    const [form, setForm] = useState({});
    const [selectedCategory, setSelectedCategory] = useState(0)
    const [selectedSubcategory, setSelectedSubcategory] = useState(0)
    const [errors, setErrors] = useState({});

    const [categories, setCategories] = useState([])
    const [subcategories, setSubcategories] = useState([])

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const setField = (field, value) => {
        setForm({
            ...form,
            [field]: value
        })
        if (!!errors[field])
            setErrors({
                ...errors,
                [field]: null
            })
    }

    useEffect(() => {
        const fetchCategories = async () => {
            try {
                const response = await axios.get(`${BASE_URL}/category`);
                setCategories(response.data);
            }
            catch (error) {
                setErrors(error.message);
                console.log(error.message);
            }

        }
        const fetchSubcategories = async () => {
            try {
                const response = await axios.get(`${BASE_URL}/subcategory`);
                setSubcategories(response.data);
            }
            catch (error) {
                setErrors(error.message);
                console.log(error.message);
            }

        }
        fetchCategories();
        fetchSubcategories();
    }, [])

    const handleCreateContact = async () => {
        let newContact={}
        if(form.firstName!=""){
            newContact={
                ...newContact,
                ["firstName"]:form.firstName
            }
        }
        if(form.lastName!=""){
            newContact={
                ...newContact,
                ["lastName"]:form.lastName
            }
        }
        if(form.nickName!=""){
            newContact={
                ...newContact,
                ["nickName"]:form.nickName
            }
        }
        if(form.password!=""){
            newContact={
                ...newContact,
                ["password"]:form.password
            }
        }
        if(form.birthDate!=""){
            newContact={
                ...newContact,
                ["birthDate"]:form.birthDate
            }
        }
        if(form.email!=""){
            newContact={
                ...newContact,
                ["email"]:form.email
            }
        }
        if(form.phoneNumber!=""){
            newContact={
                ...newContact,
                ["phoneNumber"]:form.phoneNumber
            }
        }
        if(selectedCategory!=0){
            newContact={
                ...newContact,
                ["category"]:selectedCategory
            }
        }
        if(selectedSubcategory!=0 && selectedCategory!=0){
            newContact={
                ...newContact,
                ["subcategory"]:selectedSubcategory
            }
        }
        if(selectedCategory==0){
            setSelectedCategory(0);
            setSelectedSubcategory(0);
        }
        console.log(newContact);
        try {
            await axios.post(`${BASE_URL}/contact`, newContact)
            onRefresh();
            setShow(false);
        }
        catch (err) {
            setErrors(err.message);
            alert("Popraw dane! Pamętaj że dla wybranej kategorii musisz wybrac podkategorię")
            console.log(err);
        }
        newContact={};
    }
    const handleCategoryChange = (event) => {
        setSelectedCategory(event.target.value)
    }
    const handleSubcategoryChange = (event) => {
        setSelectedSubcategory(event.target.value)
    }

    return (
        <>
            <button onClick={handleShow}>Dodaj kontakt</button>
            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
            >
                <Modal.Header closeButton>
                    <Modal.Title>Dodaj kontakt</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <form>
                        <label name="firstName">Imię</label><br />
                        <input type="text" onChange={(e) => setField('firstName', e.target.value)} /><br />
                        <label name="lastName">Nazwisko</label><br />
                        <input type="text" onChange={(e) => setField('lastName', e.target.value)} /><br />
                        <label name="nickName">Nazwa użytkownika</label><br />
                        <input type="text" onChange={(e) => setField('nickName', e.target.value)} /><br />
                        <label name="password">Hasło</label><br />
                        <input type="password" onChange={(e) => setField('password', e.target.value)} /><br />
                        <label name="birthDate">Data urodzenia</label><br />
                        <input type="date" onChange={(e) => setField('birthDate', e.target.value)} /><br />
                        
                        <label>Główna kategoria</label><br />
                        <select value={selectedCategory} onChange={handleCategoryChange}>
                            <option value={0}>Wybierz kategorię</option>
                            {categories.length > 0 && categories.map((category) => (
                                <option key={generateKey(category.id, category.name)} value={category.name}>{category.name}</option>
                            ))}
                        </select><br />
                        {selectedCategory == "Prywatny"|| selectedCategory == 0 ? null :<label>Podkategoria</label>}
                        <br/>
                        {selectedCategory == "Służbowy" &&
                            <select value={selectedSubcategory} onChange={handleSubcategoryChange}>
                                <option value={0}>Wybierz podkategorię</option>
                                {subcategories.length > 0 && subcategories.map((subcategory) => (
                                    <option key={generateKey(subcategory.id, subcategory.name)} value={subcategory.name}>{subcategory.name}</option>
                                ))}
                            </select>}
                        {selectedCategory == "Inny" && 
                        <input type='text' onChange={(e)=>setSelectedSubcategory(e.target.value)} placeholder='Podaj nową podkategorię'/>}
                        <br/>
                        <label name="email">Adres email</label><br />
                        <input type="text" onChange={(e) => setField('email', e.target.value)} /><br />
                        <label name="phoneNumber">Numer telefonu</label><br />
                        <input type="text" onChange={(e) => setField('phoneNumber', e.target.value)} /><br />
                    </form>
                </Modal.Body>
                <Modal.Footer>
                    <button variant="secondary" onClick={handleClose}>
                        Anuluj
                    </button>
                    <button variant="primary" onClick={handleCreateContact}>Dodaj</button>
                </Modal.Footer>
            </Modal>
        </>
    )
}