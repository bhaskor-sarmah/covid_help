$(function() {
    $('#datepicker').datepicker({
        format: 'LT',
        maxDate: 0,
        dateFormat: 'dd-mm-yy'
    });
});

$("#dateSearch").click(function() {
    var date = $("#datepicker").val();
    $.ajax({
        url: './getAllByDate',
        type: 'POST',
        data: 'p=' + pin + '&m=' + str + '&c=' + c + '&t=' + t + '&n=' + n,
        success: function(data) {
            //called when successful
            $.alert({
                title: "Success",
                content: "All Person's contacted through SMS successfully",
                type: "green",
                typeAnimated: true
            });
        },
        error: function(e) {
            console.log(e);
        }
    });
});

$("#districtSearch").click(function() {

    var district = $("#district").val();
    if (district === "-1") {
        $.alert({
            title: "Error",
            content: "Please select a District",
            type: "red",
            typeAnimated: true
        });
        return;
    }
    $.ajax({
        url: './GetAllByDistrict',
        type: 'POST',
        contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
        data: 'dist=' + district,
        success: function(data) {
            if (data === "Error") {
                $.alert({
                    title: "Error",
                    content: "Some Error has ocurred",
                    type: "red",
                    typeAnimated: true
                });
                return;
            } else {
                console.log(JSON.stringify(data));
                var str = "<table class=\"table table-striped table-responsive\" id=\"myTable\">\n" +
                        "                    <thead>\n" +
                        "                        <tr>\n" +
                        "                            <th>Name</th>\n" +
                        "                            <th>Gender</th>\n" +
                        "                            <th>Age</th>\n" +
                        "                            <th>Type</th>\n" +
                        "                            <th>\n" +
                        "                                Action<br/>\n" +
                        "                                <c:if test=\"${searchType == 'PINCODE'}\">\n" +
                        "                                    <button class=\"btn btn-sm btn-primary\" onclick=\"doContactAll('${pin}', '${mobile}', '${captcha}', '${type}', '${name}');\">Contact All</button>\n" +
                        "                                </c:if>\n" +
                        "                            </th>\n" +
                        "                        </tr>\n" +
                        "                    </thead>\n" +
                        "                    <tbody>";
                data.forEach(function(item) {
                    str += "\n<tr>\n" +
                            "                                <td>" + item.name + "</td>\n" +
                            "                                <td>" + item.sex + "</td>\n" +
                            "                                <td>" + item.age + "</td><td>\n";
                    item.type_of_help.forEach(function(help) {
                            str += "\nHELP "+help.type+"<br/> Help Type : "+help.helpId+",<br/> Details: "+help.helpDetails+",<br/> Quantity: "+help.helpQuantity+"<br/><br/>\n";
                    });
                    str += "</td>                                <td><button class=\"btn btn-small\">Done</button></td>\n" +
                            "                                </tr>\n";
                });
                str += "</tbody></table>";
                $("#resultDiv").html(str);
            }
        },
        error: function(e) {
            $.alert({
                title: "Error",
                content: "Some Error has ocurred",
                type: "red",
                typeAnimated: true
            });
            console.log(e);
        }
    });
});

$("#pinSearch").click(function() {
    var pin = $("#pincode").val();
    if (isNaN(pin) || pin.length !== 7) {
        $.alert({
            title: "Error",
            content: "Please enter a valid Pin Code",
            type: "red",
            typeAnimated: true
        });
        return;
    }
    $.ajax({
        url: './getAllByPin',
        type: 'POST',
        data: 'p=' + pin + '&m=' + str + '&c=' + c + '&t=' + t + '&n=' + n,
        success: function(data) {
            //called when successful
            $.alert({
                title: "Success",
                content: "All Person's contacted through SMS successfully",
                type: "green",
                typeAnimated: true
            });
        },
        error: function(e) {
            console.log(e);
        }
    });
});