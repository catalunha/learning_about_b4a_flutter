
Parse.Cloud.afterSave(Parse.User, async (req) => {
  let user = req.object;
  if (user.get('profile') === undefined) {
    const profile = new Parse.Object("Profile");
    profile.set('email', user.get('email'));
    let profileResult = await profile.save(null, { useMasterKey: true });
    user.set('profile', profileResult);
    await user.save(null, { useMasterKey: true });
    console.log(`afterSave Parse.User: ${user.id} Created profile.`);
  }
});

Parse.Cloud.afterDelete(Parse.User, async (req) => {
  let user = req.object;
  console.log(`afterDelete Parse.User: ${user.id}`);
  let profileId = user.get('profile').id;
  console.log(`deleting Profile: ${profileId}`);
  const profile = new Parse.Object("Profile");
  profile.id = profileId;
  await profile.destroy({ useMasterKey: true });
});
