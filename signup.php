<?php

include_once("includes/header.php");
include_once("classes/user.class.php");
// fName
// lName
// occupation
// address
// adhaar
// phone
// email
// monthlyIncome
// adhaarFront
// adhaarBack
// confirmPassword
// password

if (isset($_POST['signup'])) {
    $fName = $_POST['fName'];
    $lName = $_POST['lName'];
    $occupation = $_POST['occupation'];
    $address = $_POST['address'];
    $adhaar = $_POST['adhaar'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $gstno = $_POST['gstno'];

    $confirmPassword = $_POST['confirmPassword'];
    $password = $_POST['password'];
   
    $signUpAs = $_POST['accounttype'];
    $shopName = $_POST['shopName'];
    $target = "uploads/usersIDCardPics/";
    $adhaarFront = $_FILES['adhaarFront']['name'];
    $adhaarFront_temp = $_FILES['adhaarFront']['tmp_name'];
    $adhaarBack = $_FILES['adhaarBack']['name'];
    $adhaarBack_temp = $_FILES['adhaarBack']['tmp_name'];
    $uploadOk = 1;
    // echo ($adhaarFront_temp);
    if ($_FILES["adhaarFront"]["size"] == 0 || $_FILES["adhaarBack"]["size"] == 0) {
        echo ('<Script>alert("Select ID Card Picture. It is Mendatory !")</Script>');
    } else {
        if ($confirmPassword != $password) {
            echo ('<Script>alert("Password do not match ! ")</Script>');
        } else {
            if ($_FILES["adhaarFront"]["size"] > 500000) {

                echo ('<Script>alert("Your adhaar FRONT Picture size is larger to upload ! Select File Size Below 5mb")</Script>');

                $uploadOk = 0;
            } else if ($_FILES["adhaarBack"]["size"] > 500000) {

                echo ('<Script>alert("Your adhaar Back Picture size is larger to upload !Select File Size Below 5mb")</Script>');

                $uploadOk = 0;
            } else {
                $adhaarFrontSize = getimagesize($adhaarFront_temp);
                $adhaarBackSize = getimagesize($adhaarBack_temp);
                if ($adhaarFrontSize !== false && $adhaarBackSize !== false) {
                    $uploadOk = 1;
                    $adhaarFrontImageTargetFile = $target . basename($_FILES["adhaarFront"]["name"]);
                    $adhaarImageTargetFile = $target . basename($_FILES["adhaarBack"]["name"]);
                    // if (file_exists($adhaarFrontImageTargetFile)) {
                    //     echo ('<Script>alert("adhaar Front Image Already Exists !")</Script>');
                    //     $uploadOk = 0;
                    // }
                    // if (file_exists($adhaarImageTargetFile)) {

                    //     echo "<script type='text/javascript'>alert('adhaar Back Image already exists! Rename or change the Image')</script>";

                    //     $uploadOk = 0;
                    // }
                    //  else {
                        if ($uploadOk == '1') {
 

                            $user = new User(
                                0,
                                $fName,
                                $lName,
                                $adhaar,
                                $phone,
                                $email,
                                $occupation,
                                $gstno,
                                $address,
                                $adhaarFront,
                                $adhaarBack,
                                "newuser",
                                "unblock",
                                $signUpAs,
                                $shopName,
                                $password
                            );
                            if ($user->Signup()) {
                                move_uploaded_file($adhaarFront_temp, $target . $adhaarFront);
                                move_uploaded_file($adhaarBack_temp, $target . $adhaarBack);
                            }
                        } else {

                            echo "<script type='text/javascript'>alert('An unknown Error Occured ! ')</script>";
                        }
                    // }
                } else {
                    echo "<script type='text/javascript'>alert('File is not an Image ! Select an Image To Continue')</script>";

                    $uploadOk = 0;
                }
            }
        }
    }
}


?>
<script>
    function Vaalue() {
        var ddl = document.getElementById('accounttype');
        // console.log(value);
        var selectedValue = ddl.options[ddl.selectedIndex].value;
        // alert(selectedValue);
        if (selectedValue == "seller") {
            document.getElementById('gstnoDiv').style.display ='block';
            document.getElementById('shopNameField').style.display = 'block';
        } else {
            document.getElementById('gstnoDiv').style.display ='none';
            document.getElementById('shopNameField').style.display = 'none';
        }
    }
</script>
<style>
    .switch {
        position: relative;
        display: inline-block;
        width: 50px;
        height: 30px;
    }

    /* Hide default HTML checkbox */
    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    /* The slider */
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 24px;
        width: 24px;
        left: 3px;
        bottom: 3px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked+.slider {
        background-color: #2196F3;
    }

    input:focus+.slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
</style>
<main>
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>SIGNUP</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Area End-->
    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row">
                <div class="col-12 mb-4">
                    <h2 class="contact-title">SIGNUP TO GET AMAZING DEALS </h2>
                </div>
                <div class="col-lg-12">

                    <form action="" class="form-contact contact_form" enctype="multipart/form-data" method="post">
                        <!-- <div class="form-group">
                            <label class="switch">
                                <input type="checkbox" name="checkbox1" id="checkbox" onchange="Vaalue();">
                                <span class="slider" onclick=""></span>

                            </label>
                            <span class="form-check-label mt-3 ml-3"> Signup as a Seller ? </span>


                        </div> -->
                        <h4 class="pt-2 mt-3 mb-4">Signup as ?</h4>
                        <select class="select " aria-labelledby="dropdownMenuButton" onchange="Vaalue();" id="accounttype" name="accounttype">
                            <option class="dropdown-item" value="user">User</option>
                            <option name="seller" value="seller">Seller</option>
                            <option value="rider">Rider</option>
                        </select>
                        <br>
                        <div class="col-12">
                            <div class="form-group">
                                <!-- <Label class="text-dark font-weight-bold">ShopName <span class="label label-default text-danger">*</span></Label> -->

                                <input  class="form-control" name="shopName" id="shopNameField" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Shop Name'" placeholder="Enter your Shop Name" style="display: none;">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <Label class="text-dark font-weight-bold">First Name <span class="label label-default text-danger">*</span></Label>
                                <div class="form-group">
                                    <input class="form-control valid" name="fName" id="" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your First Name'" placeholder="Enter your First Name" required>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <Label class="text-dark font-weight-bold">Last Name <span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control valid" name="lName" id="" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Last Name'" placeholder="Enter your Last Name" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <Label class="text-dark font-weight-bold">Email <span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control valid" name="email" id="" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <Label class="text-dark font-weight-bold">Address<span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control valid" name="address" id="" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Address'" placeholder="Enter your Address" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <Label class="text-dark font-weight-bold">ADHAAR <span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control valid" name="adhaar" minlength="12" maxlength="12" class="form-control" placeholder="Adhaar no. 34201*******8 *" id="" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Adhaar Number'" placeholder="Enter your Adhaar Number" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <Label class="text-dark font-weight-bold">Phone <span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control valid" name="phone" id="" minlength="10" maxlength="10" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your phone'" placeholder="Enter your phone" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="" for="">
                                        <h6>
                                            ADHAAR FRONT
                                        </h6>
                                    </label>
                                    <input type="file" accept="image/x-png,image/gif,image/jpeg" name="adhaarFront" id="" required />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="" for="">
                                        <h6>
                                            ADHAAR BACK
                                        </h6>
                                    </label>
                                    <input type="file" name="adhaarBack" accept="image/x-png,image/gif,image/jpeg" id="" required />
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <Label class="text-dark font-weight-bold">Occupation <span class="label label-default text-danger">*</span></Label>

                                    <input class="form-control valid" name="occupation" id="" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Occupation'" placeholder="Enter your Occupation" required>

                                </div>
                            </div>
                            <div class="col-6" style="display: none;"  id="gstnoDiv">
                                <Label class="text-dark font-weight-bold">NTN Number<span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control"  name="gstno" id="" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter NTN Number'" placeholder="Enter Monthly Income" >
                                </div>
                            </div>
                            <div class="col-6">
                                <Label class="text-dark font-weight-bold">Password <span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control" minlength="8" maxlength="16" name="password" id="" type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Choose a Strong Password'" placeholder="Choose a Strong Password" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <Label class="text-dark font-weight-bold">Confirm Password <span class="label label-default text-danger">*</span></Label>

                                <div class="form-group">
                                    <input class="form-control" name="confirmPassword"  minlength="8" maxlength="16" id="" type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'" placeholder="Confirm Password" required>
                                </div>
                            </div>


                            <div class="col-md-12 form-group mt-4">

                                <button type="submit" value="submit" name="signup" class=" mt-3 btn btn-block bg-danger text-light">
                                    SIGNUP
                                </button>

                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </section>
    <!--================login_part end =================-->
</main>
<?php

include_once("includes/footer.php");
?>
<!-- 
 -->