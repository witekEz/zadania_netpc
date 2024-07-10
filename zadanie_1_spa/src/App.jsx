import { useCallback, useEffect, useState } from 'react'
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import DisplayContacts from './displayContacts';
import DisplayDetails from './displayDetails';
import axios from 'axios';
import LoginLogout from './loginLogout';
import CreateContact from './modals/createContact';
import { useSelector } from 'react-redux'


function App() {
  const BASE_URL = 'https://localhost:7272/api';

  const [basicContacts, setBasicContacts] = useState(null);
  const [contactDetails, setContactDetails] = useState(null);
  const [contactId, setContactId] = useState(null)
  const [error, setError] = useState(null);
  const [refresh,setRefresh]=useState(false);
  const { isLoggedIn } = useSelector(state => state.authenticate)
  useEffect(() => {

    const fetchBasicContacts = async () => {
      try {
        const response = await axios.get(`${BASE_URL}/contact`);
        setBasicContacts(response.data);
      }
      catch (error) {
        setError(error.message);
        console.log(error.message);
      }

    }
    fetchBasicContacts();
  }, [refresh])
  useEffect(() => {
    const fetchContactDetails = async () => {
      if(contactId!=null)
      {
        try {
          const response = await axios.get(`${BASE_URL}/contact/${contactId}`);
          console.log(response.data)
          setContactDetails(response.data);
        }
        catch (error) {
          setError(error.message);
          console.log(error.message);
        }
      }
    }
    fetchContactDetails();
  }, [contactId]);

  const handleContactChange = (contactId) => {
    setContactId(contactId);
  }
  const handleRefresh = () =>{
    setRefresh(!refresh);
  }

  return (
    <>
      <LoginLogout />
      <h1>Kontakty</h1>
      <Row>
        <Col>
          {basicContacts && <DisplayContacts contacts={basicContacts} onContactIdChange={handleContactChange} />}
        </Col>
        <Col>
          {contactDetails && <DisplayDetails contactId={contactId} contactDetails={contactDetails} />}
        </Col>
      </Row>
      {isLoggedIn&&<CreateContact onRefresh={handleRefresh}/>}

    </>
  )
}

export default App
