import { useEffect, useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import axios from 'axios';
import React from "react";

export default function CreateAboutCategory({ contactId }) {
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

    const handleCreateAboutCategory = async () => {
        let newAboutCategory = {}
        if (form.email != "") {
            newAboutCategory = {
                ...newAboutCategory,
                ["email"]: form.email
            }
        }
        if (form.phoneNumber != "") {
            newAboutCategory = {
                ...newAboutCategory,
                ["phoneNumber"]: form.phoneNumber
            }
        }
        if (selectedCategory != 0) {
            newAboutCategory = {
                ...newAboutCategory,
                ["category"]: selectedCategory
            }
        }
        if (selectedSubcategory != 0 && selectedCategory != 0) {
            newAboutCategory = {
                ...newAboutCategory,
                ["subcategory"]: selectedSubcategory
            }
        }
        if (selectedCategory == 0) {
            setSelectedCategory(0);
            setSelectedSubcategory(0);
        }
        console.log(newAboutCategory);
        try {
            await axios.post(`${BASE_URL}/contact/${contactId}/aboutcategory`, newAboutCategory)
            setShow(false);
        }
        catch (err) {
            setErrors(err.message);
            alert("Popraw dane! Pamętaj że dla wybranej kategorii musisz wybrac podkategorię")
            console.log(err);
        }
        newAboutCategory = {};
    }
    const handleCategoryChange = (event) => {
        setSelectedCategory(event.target.value)
    }
    const handleSubcategoryChange = (event) => {
        setSelectedSubcategory(event.target.value)
    }

    return (
        <>
            <button onClick={handleShow}>Dodaj</button>
            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
            >
                <Modal.Header closeButton>
                    <Modal.Title>Dodaj kategorię dla kontaktu</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <form>
                        <label name="email">Email</label><br />
                        <input type="text" onChange={(e) => setField('email', e.target.value)} /><br />
                        <label name="phoneNumber">Numer telefonu</label><br />
                        <input type="text" onChange={(e) => setField('phoneNumber', e.target.value)} /><br />
                        <label>Główna kategoria</label><br />
                        <select value={selectedCategory} onChange={handleCategoryChange}>
                            <option value={0}>Wybierz kategorię</option>
                            {categories.length > 0 && categories.map((category) => (
                                <option key={generateKey(category.id, category.name)} value={category.name}>{category.name}</option>
                            ))}
                        </select><br />
                        {selectedCategory == "Prywatny" || selectedCategory == 0 ? null : <label>Podkategoria</label>}
                        <br />
                        {selectedCategory == "Służbowy" &&
                            <select value={selectedSubcategory} onChange={handleSubcategoryChange}>
                                <option value={0}>Wybierz podkategorię</option>
                                {subcategories.length > 0 && subcategories.map((subcategory) => (
                                    <option key={generateKey(subcategory.id, subcategory.name)} value={subcategory.name}>{subcategory.name}</option>
                                ))}
                            </select>}
                        {selectedCategory == "Inny" &&
                            <input type='text' onChange={(e) => setSelectedSubcategory(e.target.value)} placeholder='Podaj nową podkategorię' />}
                    </form>
                </Modal.Body>
                <Modal.Footer>
                    <button variant="secondary" onClick={handleClose}>
                        Anuluj
                    </button>
                    <button variant="primary" onClick={handleCreateAboutCategory}>Utwórz</button>
                </Modal.Footer>
            </Modal>
        </>
    )
}