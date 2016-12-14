<?php

function redirect($url) {

    echo "<script language=\"JavaScript\">\n";
    echo "<!-- hide from old browser\n\n";

    echo "window.location = \"" . $url . "\";\n";

    echo "-->\n";
    echo "</script>\n";

    return true;
}

function set_rights($menus, $menuRights, $topmenu) {
    $data = array();

    for ($i = 0, $c = count($menus); $i < $c; $i++) {
        $row = array();
        for ($j = 0, $c2 = count($menuRights); $j < $c2; $j++) {
            if ($menuRights[$j]["rr_modulecode"] == $menus[$i]["modulecode"]) {
                if (authorize($menuRights[$j]["rr_create"]) || authorize($menuRights[$j]["rr_edit"]) || authorize($menuRights[$j]["rr_delete"])) {
                    $row["menu"] = $menus[$i]["modulegroupcode"];
                    $row["menu_name"] = $menus[$i]["modulename"];
                    $row["page_name"] = $menus[$i]["modulepagename"];
                    $row["create"] = $menuRights[$j]["rr_create"];
                    $row["edit"] = $menuRights[$j]["rr_edit"];
                    $row["delete"] = $menuRights[$j]["rr_delete"];

                    $data[$menus[$i]["modulegroupcode"]][$menuRights[$j]["modulecode"]] = $row;
                    $data[$menus[$i]["modulegroupcode"]]["top_menu_name"] = $menus[$i]["modulegroupname"];
                }
            }
        }
    }

    return $data;
}

function authorize($module) {
    return $module == "yes" ? TRUE : FALSE;
}
?>

