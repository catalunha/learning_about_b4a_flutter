Parse.Cloud.define("duplicate1", async (request) => {
  console.log(`data: ${request.params.data}`);
  const data = request.params.data;
  const table1 = new Parse.Object('Table1');
  table1.set('data',data);
  let table1Id = await table1.save(null,{useMasterKey:true});
  return table1Id;
});
// {"userOrigin":"Z19OKN8vSG"}
Parse.Cloud.define("duplicate2", async (request) => {
  var userPointer = {
    __type: 'Pointer',
    className: 'Profile',
    objectId: request.params.userOrigin
  }
  let query = new Parse.Query('Table1');
  query.equalTo("userProfile",userPointer);

  return await query.find();
  // return   request.params.userOrigin;
});
//https://stackoverflow.com/questions/26923172/query-on-pointer-in-parse-com-objects-in-javascript