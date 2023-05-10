<?php
//http://localhost/todo_task/todo_list.php
$con = mysqli_connect("localhost","root","","news");

if(isset($_POST['type']) && $_POST['type'] == 1){    
    $todo_title = $_POST['todo_title'];
    $todo_details = $_POST['todo_details'];
    $todo_date = $_POST['todo_date'];
    $todo_edit_id = $_POST['todo_edit_id'];
    
    if($todo_edit_id != ''){
        $upadate_record = mysqli_query($con,"UPDATE `todo_data` SET `title` = '$todo_title', `details` = '$todo_title', `todo_date` = '$todo_date' WHERE `id`= '$todo_edit_id';");
        if($upadate_record){
            echo 'updated';
        }else{
            echo 'not update';
        }
    }else{
        $save_record = mysqli_query($con,"INSERT INTO `todo_data`(`title`, `details`, `todo_date`) VALUES ('$todo_title','$todo_details','$todo_date')");
        if($save_record){
            echo 'saved success';
        }else{
            echo 'not saved';
        }
    }
   
    die;
    
}else if(isset($_POST['displaysend'])){
    
       $toto_records = mysqli_query($con,"select * from `todo_data` ");
       $tdata = '';
       while($row = mysqli_fetch_array($toto_records)){
        
              $T_id =  $row['id'];
              $title = $row['title'];
              $details = $row['details'];
              $todo_date = $row['todo_date'];
              $parent_div = 'parent_todo_'.$T_id;

            //   $tdata .= "<tr>";
              $tdata .= "<div class='each_todo_div mb-2 ".$parent_div."'>";
              $tdata .= "<h4 class='todo_title'>".$title."</h4><hr><p class='todo_date'>".$todo_date."</p><hr>";
              $tdata .= "<p class='todo_detail'>".$details."</p>";
              $tdata .= "<div class='todo_bottom_section'>";
              $tdata .= "<button data-Tid=".$T_id." class='btn btn-success mr-3 edit_todo'>Edit</button>";
              $tdata .= "<button data-Tid=".$T_id." class='btn btn-primary mr-3 delete_todo'>Delete</button>";
              $tdata .= "</div></div>";
            //   $tdata .= "</tr>";
       }
       echo $tdata;die;
}

if(isset($_POST['todo_id'])){
    $todo_id = $_POST['todo_id'];
    $delete_record = mysqli_query($con,"DELETE FROM `todo_data` WHERE `id` = '$todo_id' ");
        if($delete_record){
            echo 'deleted success';
        }else{
            echo 'not deleted';
        }


}
?>