var StudentsModule = function () {
    function formatRowData(data) {
        var table = "";
        if (data[5].length !== 0) {
            table += '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
        '<thead><tr><th>#</th><th>Courses</th></tr></thead><tbody>';
            var courses = data[5].split(",");
            var len = courses.length;
            for (var i = 0; i < len; i++) {
                table += '<tr>' +
                    '<td>' + (i + 1) + '</td>' +
                    '<td>' + courses[i] + '</td>' +
                    '</tr>';
            }
            table += "</tbody></table>";
        } else {
            table += '<span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span> No current courses';
        }
        return table;
    }

    function fillTable(data) {
        var parsedObj = JSON.parse(data.d);
        for (var i = 0; i < parsedObj.length; i++) {
            $('#myDataTable > tbody:last-child').append('<tr><td>' + parsedObj[i].Id +
                '</td><td>' + parsedObj[i].FirstName + '</td><td>' + parsedObj[i].LastName +
                '</td><td>' + parsedObj[i].Sex + '</td><td>' + parsedObj[i].Age + '</td><td>' + parsedObj[i].Courses + '</td><td class="datailsCell"></td><td><a runat = "server" class="editStudentLink" data-id="' + parsedObj[i].Id + '"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td></tr>');
        }
        $(".editStudentLink").click(function (e) {
            e.preventDefault();
            window.location.replace('EditStudent?Id='+$(this).data("id"));
        });
    }

    function addSearchFields() {
        $('#myDataTable tfoot th').each(function () {
            var title = $('#myDataTable tfoot th').eq($(this).index()).text();
            if (title !== "") {
                $(this).html('<input type="text" class="form-control" placeholder="Search ' + title + '" />');
            }
        });
    }

    function initialize(table) {
        var dataTable = table.DataTable({
            "columnDefs": [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [5],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [6],
                "orderable": false,
                "searchable": false,
                "data": null,
                "defaultContent": '<span class="glyphicon glyphicon-align-justify" style="vertical-align:middle"></span>'
            },
             {
                 "targets": [7],
                 "orderable": false,
                 "searchable": false
             }]
        });

        dataTable.columns().every(function () {
            var that = this;
            $('input', this.footer()).on('keyup change', function () {
                that.search(this.value).draw();
            });
        });

        $('#myDataTable tbody').on('click', ".datailsCell", function (e) {
            e.preventDefault();
            var tr = $(this).closest('tr');
            var row = dataTable.row(tr);
            if (row.child.isShown()) {
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                row.child(formatRowData(row.data())).show();
                tr.addClass('shown');
            }
        });
    }

    function initializeDataTable() {
        $('#myDataTable').addClass('hidden');
        $.ajax({
            type: "POST",
            url: "Students.aspx/AjaxHandler",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                fillTable(data);
                addSearchFields();
                initialize($('#myDataTable'));              
                $('#myDataTable').removeClass('hidden');
            },
            error: function (e) { console.log("error occured: " + e.message); }
        });
    }
    return {
        InitializeDataTable: initializeDataTable
    }
}();

$(document).ready(function () {
    StudentsModule.InitializeDataTable();
});
