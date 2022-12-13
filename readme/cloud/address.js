const Address = Parse.Object.extend('Address');
const Contact = Parse.Object.extend('Contact');
Parse.Cloud.define('address-create', async (req)=>{
  const {contactId} = req.params;
  contact.id = contactId;
  if(contactId===null||contactId==='') throw "address-create: Falta contactId";
  const address = new Address();
  const {cep,description,city,state} = req.params;
  address.set('cep',cep);
  address.set('description',description);
  address.set('city',city);
  address.set('state',state);
  const newAddress = await address.save();
  const contact = new Contact();
  contact.set('address',newAddress);
  const updateContact = await contact.save();
  return {
    address:newAddress,
    contact:updateContact
  };
});