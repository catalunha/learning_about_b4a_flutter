const Contact = Parse.Object.extend('Contact');

Parse.Cloud.define('contact-create',async (req)=>{
	if(req.user===null) throw "Usuario não autenticado.";
	const contact = new Contact();
	const {name} = req.params;
	if(name===null || name==='') throw "Falta nome";
	contact.set('name',req.params.name);
	contact.set('man',false);
	contact.set('birthday',new Date(1972,09,11));
	contact.set('createdByUser',req.user);
	const savedContact = await contact.save(null,{sessionToken: req.user.getSessionToken()});
	return savedContact;
});

Parse.Cloud.define('contact-update', async (req)=>{
	const {id,male} = req.params;
	if(id===null||id==='') throw 'set-gender: Falta id';

	const contact = new Contact();
	contact.id= id;
	contact.set('man',male);
	const result = await contact.save();
	return result;
});

Parse.Cloud.define('contact-delete',async (req)=>{
	const {id} = req.params;
	if(id===null||id==='') throw 'contact-delete: Falta id';
	const contact = new Contact();
	contact.id = id;
	await contact.destroy();
	return {msg:'contato excluido.'};
});

Parse.Cloud.define('contact-read',async (req)=>{
	const {id} = req.params;
	if(id===null|| id==='') throw "contact-read: Falta id";
	const query = new Parse.Query(Contact);
	const contactFiltered = await query.get(id);
	// return contactFiltered;
	const contactJson = contactFiltered.toJSON();
	return {
		id : contactJson.objectId,
		name : contactJson.name
	};
});

Parse.Cloud.define('contact-list', async (req)=>{
	if(req.user===null) throw "Usuario não autenticado.";
	const query = new Parse.Query(Contact);
	query.equalTo("man",true);
	query.include('address');
	const list = await query.find({sessionToken: req.user.getSessionToken()});
	// const list = await query.find({useMasterKey:true});
	return list;
	// return list.map((item)=>{
	// 	itemJson = item.toJSON();
	// 	return {
	// 		id:itemJson.objectId,
	// 		name:itemJson.name,
	// 	};
	// });
});

// Parse.Cloud.beforeSave("Contact", (req) => {
// 	console.log('Antes de save Contact...');
// 	const name = req.object.get('name');
// 	req.object.set('name',name+' (beforeSave...)')
// 	}
// 	// ,{
// 	// 	fields: {
// 	// 		stars : {
// 	// 			required:true,
// 	// 			options: stars => {
// 	// 				return stars >= 1 && stars <= 5;
// 	// 			},
// 	// 			error: 'Your review must be between one and five stars'
// 	// 		}
// 	// 	}
// 	// }
// );

Parse.Cloud.define('contact-upload',(req)=>{
	console.log('contact-upload: Ainda não resolvido em cloud-functions');

	return {msg:'contact-upload: Ainda não resolvido em cloud-functions'};
});