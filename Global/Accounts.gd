extends Node


var connected = null;


func hashe(txt):
	var ctx = HashingContext.new()
	ctx.start(HashingContext.HASH_SHA256)
	var res = ctx.update([txt]);
	ctx.finish();
	return txt; # return res


var accounts = {
	"root": {"name": "root", "password": hashe("root"), "admin": true}
}

func connection(name, password):
	# Test account exist
	if not name in accounts.keys():
		return {"succeed": false, "error": "The account doesn't exist !"};
	# Test password
	if hashe(password) == accounts[name]["password"]:
		return {"succeed": true, "data": accounts[name]};
	else:
		return {"succeed": false, "error": "The password is wrong !"};

