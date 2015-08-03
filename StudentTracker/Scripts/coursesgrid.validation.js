function validateCourseName() {
    var name = $("input[id*='txtCourseName']").val();
    if (name.length < 2) {
        $("[class*='saveBtn']").addClass('disabled');
    }

    var pattern = new RegExp("^[a-zA-Z ]*$");
    var result = pattern.test(name);
    if (name.length >= 2 && result) {
        $("div[class*='courseNamegroup']").removeClass('has-error');
        $("[class*='saveBtn']").removeClass('disabled');
        $(".validation-error-message").addClass('hidden');
    } else {
        $("div[class*='courseNamegroup']").addClass('has-error');
        $("[class*='saveBtn']").addClass('disabled');
        $(".validation-error-message").removeClass('hidden');
    }

    var number = $("input[id*='txtMaxAssigned']").val();
    var numberPattern = new RegExp("^[0-9]*$");
    var numberResult = numberPattern.test(number);
    var currNumber = $("input[id*='txtCurerentAmount']").val();
    if (number.length < 1 || !numberResult || Number(currNumber) > Number(number)) {
        $("[class*='saveBtn']").addClass('disabled');
        $("div[class*='maxNumberGroup']").addClass('has-error');
        $(".validation-error-message").removeClass('hidden');
    }
    return true;
}

function validateNewNumber() {
    var number = $("input[id*='txtMaxAssigned']").val();
    if (number.length < 1) {
        $("[class*='saveBtn']").addClass('disabled');
        $("div[class*='maxNumberGroup']").addClass('has-error');
    }

    var pattern = new RegExp("^[0-9]*$");
    var result = pattern.test(number);
    if (number.length > 0 && result) {
        $("div[class*='maxNumberGroup']").removeClass('has-error');
        $("[class*='saveBtn']").removeClass('disabled');
    } else {
        $("div[class*='maxNumberGroup']").addClass('has-error');
        $("[class*='saveBtn']").addClass('disabled');
    }

    var name = $("input[id*='txtCourseName']").val();
    var namePattern = new RegExp("^[a-zA-Z ]*$");
    var nameResult = namePattern.test(name);
    if (name.length < 2 || !nameResult) {
        $("[class*='saveBtn']").addClass('disabled');
        $("div[class*='courseNamegroup']").addClass('has-error');
    }

    return true;
}

function validateExistingNumber() {
    console.log('ext');
    var number = $("input[id*='txtMaxAssigned']").val();
    if (number.length < 1) {
        $("[class*='saveBtn']").addClass('disabled');
        $("div[class*='maxNumberGroup']").addClass('has-error');
    }

    var pattern = new RegExp("^[0-9]*$");
    var result = pattern.test(number);
    if (number.length > 0 && result) {
        $("div[class*='maxNumberGroup']").removeClass('has-error');
        $("[class*='saveBtn']").removeClass('disabled');
    } else {
        $("div[class*='maxNumberGroup']").addClass('has-error');
        $("[class*='saveBtn']").addClass('disabled');
    }


    var currNumber = $("input[id*='txtCurerentAmount']").val();
    if (Number(number) >= Number(currNumber)) {
        $("div[class*='maxNumberGroup']").removeClass('has-error');
        $("[class*='saveBtn']").removeClass('disabled');
    } else {
        $("div[class*='maxNumberGroup']").addClass('has-error');
        $("[class*='saveBtn']").addClass('disabled');
    }

    var name = $("input[id*='txtCourseName']").val();
    var namePattern = new RegExp("^[a-zA-Z ]*$");
    var nameResult = namePattern.test(name);
    if (name.length < 2 || !nameResult) {
        $("[class*='saveBtn']").addClass('disabled');
        $("div[class*='courseNamegroup']").addClass('has-error');
    }
    return true;
}

$(document).ready(function () {
    $("#CoursesGrid tr input[id=txtCourseName]").each(function () {
        $(this).input(validateCourseName());
    });

    $("#CoursesGrid tr input[id=txtCourseName]").each(function () {
        $(this).click(validateCourseName());
    });
});
