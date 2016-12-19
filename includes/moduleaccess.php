<?php

if (!isset($_SESSION["access"])) {

    try {

        $sql = "SELECT modulegroupcode, modulegroupname FROM module "
                . " GROUP BY `modulegroupcode` "
                . " ORDER BY `modulegrouporder` ASC, `moduleorder` ASC  ";


        $stmt = $DB->prepare($sql);
        $stmt->execute();
        $commonModules = $stmt->fetchAll();

        $sql = "SELECT modulegroupcode, modulegroupname, modulepagename,  modulecode, modulename FROM module "
                . " ORDER BY `modulegrouporder` ASC, `moduleorder` ASC  ";

        $stmt1 = $DB->prepare($sql);
        $stmt1->execute();
        $allModules = $stmt1->fetchAll();

        $sql = "SELECT rr_modulecode, rr_create,  rr_edit, rr_delete FROM rolerights "
                . " WHERE  rr_roleid = :rid "
                . " ORDER BY `rr_modulecode` ASC  ";

        $stmt2 = $DB->prepare($sql);
        $stmt2->bindValue(":rid", $_SESSION[SESS_ROLE_ID]);


        $stmt2->execute();
        $userRights = $stmt2->fetchAll();

        $_SESSION["access"] = set_rights($allModules, $userRights, $commonModules);
    } catch (Exception $ex) {

        echo $ex->getMessage();
    }
}
?>

