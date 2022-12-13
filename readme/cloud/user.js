Parse.Cloud.define('user-signup',async (req)=>{
  const {name,email,password} = req.params;
  if(name===null||name==='') throw 'user-register: Falta name';
  if(email===null||email==='') throw 'user-register: Falta email';
  if(password===null||password==='') throw 'user-register: Falta password';
  const user = new Parse.User();
  user.set('name',name);
  user.set('username',email);
  user.set('email',email);
  user.set('password',password);
  // const userNew = await user.signUp();
  const userNew = await user.save(null,{useMasterKey:true});
  return userNew;
});

Parse.Cloud.define('user-current', async (req)=>{
  console.log('req.user: ',req.user);
  console.log('Parse.User.current(): ',Parse.User.current());
  console.log('Parse.User.authenticated(): ',Parse.User.authenticated);
  return {
    requser:req.user, 
    usercur:Parse.User.current(),
    // userauth:authenticated()
  };
  // let currentUser = req.user;
  // currentUser.setACL(new Parse.ACL(currentUser));
  // return await currentUser.save(null, { useMasterKey: true });
});

Parse.Cloud.define('user-login', async (req)=>{
  const {email,password} = req.params;
  if(email===null||email==='') throw "user-login: Falta email";
  if(password===null||password==='') throw "user-login: Falta password";
  const user = await Parse.User.logIn(email,password);
  return user;
});

Parse.Cloud.define('user-logout',async (req)=>{
  const user = await Parse.User.logOut();
  //parece que nao mata a session
  //https://parseplatform.org/Parse-SDK-JS/api/v1.11.1/Parse.User.html
  return {user:user,msg:'user-logout: bem sucedido'};
});