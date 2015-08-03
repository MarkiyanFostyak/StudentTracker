function isNameValid(name) {
    if (name.length < 2) {
        return false;
    }
    var pattern = new RegExp("^[a-zA-Z]*$");
    var result = pattern.test(name);
    if (result) {
        return true;
    } else {
        return false;
    }
}

function IsAgeValid(age) {
    var pattern = new RegExp("^[0-9]*$");
    var result = pattern.test(age);
    if (result) {
        if (age < 16 || age > 120) {
            return false;
        }
        return true;
    } else {
        return false;
    }
}

function validateName() {
    debugger;
    var firstName = $("input[id*='txtFirstName']").val();
    var lastName = $("input[id*='txtLastName']").val();
    var age = $("input[id*='txtAge']").val();
    if (!isNameValid(firstName)) {
        $("input[id*='SaveBtn']").addClass('disabled');
        $("#studentFirstName").addClass('has-error');
    } else {
        $("#studentFirstName").removeClass('has-error');
        if (isNameValid(lastName) && IsAgeValid(age)) {
            $("input[id*='SaveBtn']").removeClass('disabled');
        }
    }
    return true;
}

function validateLastName() {
    debugger;
    var firstName = $("input[id*='txtFirstName']").val();
    var lastName = $("input[id*='txtLastName']").val();
    var age = $("input[id*='txtAge']").val();
    if (!isNameValid(lastName)) {
        $("input[id*='SaveBtn']").addClass('disabled');
        $("#studentLastName").addClass('has-error');
    } else {
        $("#studentLastName").removeClass('has-error');
        if (isNameValid(firstName) && IsAgeValid(age)) {
            $("input[id*='SaveBtn']").removeClass('disabled');
        }
    }
    return true;
}

function validateAge() {
    debugger;
    var firstName = $("input[id*='txtFirstName']").val();
    var lastName = $("input[id*='txtLastName']").val();
    var age = $("input[id*='txtAge']").val();
    if (!IsAgeValid(age)) {
        $("input[id*='SaveBtn']").addClass('disabled');
        $("#studentAge").addClass('has-error');
    } else {
        $("#studentAge").removeClass('has-error');
        if (isNameValid(firstName) && isNameValid(lastName)) {
            $("input[id*='SaveBtn']").removeClass('disabled');
        }
    }
    return true;
}




