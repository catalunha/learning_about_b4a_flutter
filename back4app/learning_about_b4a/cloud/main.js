require('./user/user_triggers.js');

// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", (request) => {
	return "Hello world!";
});


//SearchType5: currentObj referencia a otherObj via currentFieldRelation. Remove otherObj
Parse.Cloud.afterDelete("Table2", async (req) => {
  let curObj = req.object;
	console.log(`Table1> ${curObj.id}`);
	const table1Rel = curObj.relation("table1Rel");
	console.log('Table2>2');

  const query = await table1Rel.query();
	console.log('Table2>3');
	const otherObjResults = await query.find();
	console.log('Table2>3a');

  if (otherObjResults.length !== 0) {
		console.log('Table2>4');
    for (let i = 0; i < otherObjResults.length; i++) {
			console.log(`Table5> ${i} - ${curObj.id}`);

      const result = otherObjResults[i];
      await result.destroy({ useMasterKey: true });
    }
  }
});
