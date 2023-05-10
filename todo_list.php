  
<!DOCTYPE html>
<html lang="en">

<head>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
  
   <!-- model js cdn  -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
    integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
    crossorigin="anonymous"></script>

       <!-- for ajax cdn  -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>  

<script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>




  <style>
    .todo_name{
      margin-right:0%;
      margin-left:55%;
      color:#828181;
    }
    .each_todo_div{
      background-color:#ff998a;
      /* width:100%; */
      border-radius:10px;
    }
    hr{
      border:white solid 1px;
      
    }
    .todo_bottom_section{
        display:flex;
      justify-content: end;

   }
   .title_each{
      text-align:center;
    }
    .each_todo_div{
      padding:10px;
    }
    .todo_add_cart{
        background-color:#ff998a;
        padding:15px;
        border-radius:8px;  
    }
    .fixed_header tbody {
        display: block;
        width: 100%;
        overflow: auto;
        height: 630px;
        padding:15px;
    }
  </style>

</head>


<body>
  <div class="container-fluid mt-5">
    <div class="d-flex flex-row mb-5">
      <div class="col-8 ss">
        <table class="table table-bordered table-striped todo_list fixed_header">
            <!-- todo by ranith -->
            <h3 class="todo_name">__TODO LIST__</h3>
            <tbody id="tbody_data"></tbody>
        </table>
      </div>
      <div class="col-4 mt-5 pl-4 pr-4 add_todo_main">
          <div class="todo_add_cart">
            <h4 style="text-align:center">Add Todo</h4>
            <form id="todo_form">
                <input type="text" name="title" id="todo_title" class="form-control input-lg my-3" placeholder=" Name" />
                <input type="hidden" id="todo_edit_id" value='' class="form-control input-lg my-3" />
                <textarea  id="todo_details" name="todo_details" class="form-control input-lg  my-3" placeholder=" Details"></textarea>
                <input type="date" id="todo_date" name="todo_date" id="age" class="form-control input-lg my-3" placeholder="dd/mm/yyyy" />
                <input class="btn btn-primary" type='submit'/>
            </form>
         </div>
      </div>
  </div>
  <script>
    $(document).ready(function () {


      document.addEventListener('contextmenu', (e) => e.preventDefault());
        function ctrlShiftKey(e, keyCode) {
          // alert('shiva');
          console.log(e); 
          return e.ctrlKey && e.shiftKey && e.keyCode === keyCode.charCodeAt(0);
        }

        document.onkeydown = (e) => {
          // Disable F12, Ctrl + Shift + I, Ctrl + Shift + J, Ctrl + U
          if (
            event.keyCode === 123 ||
            ctrlShiftKey(e, 'I') ||
            ctrlShiftKey(e, 'J') ||
            ctrlShiftKey(e, 'C') ||
            (e.ctrlKey && e.keyCode === 'U'.charCodeAt(0))
          ){

          }
          // alert('not possible 2');
            // return false;
      };

      // form validation with jquery validate function
      $("#todo_form").validate({
        rules: {
          'title': {
            required: true,
          },
          'todo_details': {
            required: true,
          },
          'todo_date': {
            required: true,
          },
        }
      });
      // sending data to db through ajax
      $("#todo_form").on('submit',function(e) {
        e.preventDefault();
        var todo_title = $("#todo_title").val();
        var todo_details = $("#todo_details").val();
        var todo_date = $("#todo_date").val();
        var todo_edit_id = $('#todo_edit_id').val();
        todo_edit_id = (todo_edit_id != '')?todo_edit_id:'';
        $.ajax({
          url: "todo_insert.php",
          method: "POST",
          data: {
            type: 1,
            todo_title: todo_title,
            todo_details: todo_details,
            todo_date: todo_date,
            todo_edit_id:todo_edit_id
          },
          success: function (data,status) {
            if(data == 'updated' || data == 'saved success'){
                $("#todo_title").val('');
                $("#todo_details").val('');
                $("#todo_date").val('');
                $('#todo_edit_id').val('');
                displaydata();
            }else{
                alert(data);
            }
          },
        })
      });

    // feting data from bd and displaying 
     function  displaydata(){
         var displaydata = 'true';
         $.ajax({
             url:"todo_insert.php",
             type:"post",
             data:{displaysend:displaydata},
             success:function(data,status){
                // console.log(data);return false;
                $("#tbody_data").html(data);
             }
         });
      }
      // calling function to load db data
      displaydata();

    //   edit and update todo record
    $(document).on('click','.edit_todo',function(){
        var todo_id = $(this).data('tid');
        var current_todo_title = $(this).parents('.parent_todo_'+todo_id).find('.todo_title').html();
        var current_todo_detail = $(this).parents('.parent_todo_'+todo_id).find('.todo_detail').html();
        var current_todo_date = $(this).parents('.parent_todo_'+todo_id).find('.todo_date').html();

        $("#todo_title").val(current_todo_title);
        $("#todo_details").val(current_todo_detail);
        $("#todo_date").val(current_todo_date);
        $('#todo_edit_id').val(todo_id);
        
    })

    $(document).on('click','.delete_todo',function(){
        var todo_id = $(this).data('tid');
          $.ajax({
             url:"todo_insert.php",
             type:"post",
             data:{type:"todo_delete",todo_id:todo_id},
             success:function(data,status){
                // console.log(data);return false;
                if(data == 'deleted success'){
                    displaydata();
                }
             }
         });
    })
      
    });

  </script>


</body>

</html>