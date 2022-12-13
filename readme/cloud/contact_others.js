Parse.Cloud.define('contact-count',async (req)=>{
  const query = new Parse.Query("Contact");
  const count = await query.count({useMasterKey:true})
  return {count:count};
});