pragma solidity ^0.6.3;

import "stringUtils.sol";

contract userRecords {
	enum genderType { male, female } 
	// Actual user object which we will store in ethereum contract 
	struct user{ 
	    string name; genderType gender; 
	}

	user user_obj;

	function setUser(string memory name, string memory gender) public {
	    genderType gender_type = getGenderFromString(gender);
	    user_obj = user({name:name, gender: gender_type});
	}

	// get user public function
	// This is similar to getting object from db.
	function getUser() public returns (string memory, string memory) { 
	    return (user_obj.name, getGenderToString(user_obj.gender));
	}

	// Internal function to convert genderType enum from string
	function getGenderFromString(string memory gender) internal returns(genderType) {
	    if(StringUtils.equal(gender, "male")) {
	        return genderType.male;
	    } else {
	        return genderType.female;
	    }
	}

	// Internal function to convert genderType enum to string
	function getGenderToString(genderType gender) internal returns (string memory) {
	    if(gender == genderType.male) {
	        return "male";
	    } else {
	        return "female";
	    }
	}

}
