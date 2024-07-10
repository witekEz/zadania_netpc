
export default function DisplayContacts({ contacts, onContactIdChange }) {
    const generateKey = (pre1, pre2) => {
        return `${pre1}_${pre2}_${new Date().getTime()}`;
    }

    const sendId=(id)=>{
        console.log(id)
        onContactIdChange(id);
    }

    return (
        <table>
            <thead>
                <tr>
                    <td>Imię</td>
                    <td>Nazwisko</td>
                    <td>Data urodzenia</td>
                    <td>Szczegóły</td>
                </tr>

            </thead>
            <tbody>
                {contacts&&contacts.map((contact, index) => (
                    <tr key={generateKey(contact.id, contact.lastName)}>
                        <td>{contact.firstName}</td>
                        <td>{contact.lastName}</td>
                        <td>{contact.birthDate ? contact.birthDate : "TBA"}</td>
                        <td>
                            <button onClick={()=>sendId(contact.id)}>Szczegóły</button>
                        </td>
                    </tr>
                ))}
            </tbody>
            
            
        </table>
    )
}