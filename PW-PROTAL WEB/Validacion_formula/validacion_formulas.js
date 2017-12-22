$(function () {
    /*variables o campos  como por ejemmplo ojo derecho esfera, y el resto de campos asi*/ 
    $("#campo1").prop("disabled", true)
    $("#campo2").prop("disabled", true)
    $("#campo3").prop("disabled", true)
    $("#campo4").prop("disabled", true)
    $("#campo5").prop("disabled", true)
    $("#campo6").prop("disabled", true)
    $("#campo6").prop("disabled", true)
    $("#campo7").prop("disabled", true)
    $("#campo8").prop("disabled", true)
    $("#campo9").prop("disabled", true)
    $("#campo10").prop("disabled", true)
    $("#campo11").prop("disabled", true)

    $("#TextBox2").prop("disabled", true)
    $("#TextBox3").prop("disabled", true)
    $("#TextBox4").prop("disabled", true)
    $("#TextBox5").prop("disabled", true)
    $("#TextBox6").prop("disabled", true)
    $("#TextBox7").prop("disabled", true)
    $("#TextBox8").prop("disabled", true)
    $("#TextBox9").prop("disabled", true)
    $("#TextBox10").prop("disabled", true)
    $("#TextBox11").prop("disabled", true)
    $("#DropDownList7").prop("disabled", true)
    $("#FileUpload1").prop("disabled", true)
    /*----------------------------------------------*/ 
    $("#CheckBox1").change(function () {
        var st = this.checked;
        if (st) {
            $("#campo1").prop("disabled", false)
            $("#campo2").prop("disabled", false)
            $("#campo3").prop("disabled", false)
            $("#campo4").prop("disabled", false)
            $("#campo5").prop("disabled", false)
        }
        else {
            $("#campo1").prop("disabled", true)
            $("#campo2").prop("disabled", true)
            $("#campo3").prop("disabled", true)
            $("#campo4").prop("disabled", true)
            $("#campo5").prop("disabled", true)
        })
    }

    )})
    