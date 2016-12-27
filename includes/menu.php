<div class="panel menu-content panel-default overflow-control">
    <div class="panel-heading">
        <i class="fa fa-list-alt"></i> Menu
        <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
    </div>
    <div class="menu-item" id="sidemenu">
        <?php foreach ($_SESSION['menus'] as $k) {
            if ($k['display'] == 'y') {
                ?>
                <div class="col-md-4 dash-item items items-menu">
                    <div class="panel panel-default <?php echo $k['menu_div']; ?>">
                        <a href="<?php echo $k['url']; ?>"><div class="panel-body"><i class="fa fa-2x <?php echo $k['menu_icon']; ?>"></i></div></a>
                        <div class="panel-heading"><?php echo $k['menu_name']; ?></div>
                    </div>
                </div>
            <?php }
        }
        ?>
    </div>
</div>