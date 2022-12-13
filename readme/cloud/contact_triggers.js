
Parse.Cloud.beforeDelete(Parse.User,async (req) => {
  console.log('beforeDelete: User ...');
  const query = new Parse.Query('Contact');
  query.equalTo('createdByUser', req.object);
  let results = await query.find({useMasterKey:true});
  await Parse.Object.destroyAll(results, {useMasterKey: true});
});

Parse.Cloud.beforeDelete("Contact", async (req) => {
  console.log(`beforeDelete: Contact id: ${req.object.id}.`);
  let contact = req.object;
  const contactAddress = contact.get("address")
  if(contactAddress===undefined){
    console.log(`beforeDelete: Contact id: ${req.object.id}. Nao tem Address`);
  }else{
    console.log(`beforeDelete: Contact id: ${req.object.id}. TEM Address`);
    contactAddress.destroy({useMasterKey:true});
  }
});
