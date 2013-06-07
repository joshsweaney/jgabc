function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
$url = 'http://gregobase.selapa.net/download.php?format=gabc&id='
$ids = (538,132,962,1036,1115,1169,356,631,966,292,1268,1225,113,218,855,1007,79,210,1144,224,284,336,93,626,260,816,13,937,230,932,1123,47,1148,1001,1173,564,979,1282,1308,714,1033,980,8,1,670,1043,725,952,568,25,789,953,1042,135,924,1549,912,536,668,813,1341,42,39,159,585,860,579,633,990,211,1091,405,1644,361,1041,99,349,1303,391,1289,965,1111,848,794,801,697,1235,1328,1058,1264,423,874,708,512,727,332,396,143,574,797,1226,522,265,1079,239,1046,1136,675,339,77,1022,1254,1080,1203,709,886,1357,591,798,879,1205,299,1221,1052,1088,1026,648,1145,580,865,501,325,1245,1082,1182,691,967,388,820,1232,1071,747,868,1246,547,1165,182,782,1352,1338,335,993,1318,1077,1284,652,1134,595,1044,172,838,404,1097,1011,389,616,479,1192,44,1056,812,696,745,1230,1047,1363,1290,1380,1108,1271,67,464,933,614,735,986,592,331,395,327,294,1100,889,834,1294,1624,373,455,596,916,1090,1329,1298,653,899,1353,1377,78,318,726,742,760,1171,1531,650,372,49,1168,1194,640,926,222,529,554,1178,1265,1381,1317,677,1299,850);
$count = $ids.length;
$path = Join-Path (Get-ScriptDirectory) 'gabc';
foreach($id in $ids) {
    echo "$count ($id)";
    $gabc = (New-Object System.Net.WebClient).DownloadString("$url$id");
    set-content -Path "$path\$id.gabc" -Value $gabc; # -Encoding UTF8;
    $count--;
}