#カレントディレクトリ以下のフォルダ一覧（サブフォルダも含む）をフルパスで取得
$list = Get-ChildItem -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {$_.FullName};

#各フォルダに対してwebpファイル一覧をname.txtに書き込みdwebp.exeを利用してpngに変換
foreach($str in $list){
	#name.txtの作成・書き込み
	(dir -Path $str\*.webp -Name | Out-File $str\name.txt)
	
	#name.txtの内容を読み込み逐次変換
	$f = (Get-Content $str\name.txt) -as [string[]]
	 foreach ($l in $f){
		if(Test-Path $str\$l.png){
			echo $str\$l.png"exist!"
		}else{
			#名前に空白文字や予約語を含んでいても処理できるようにエスケープ
			powershell -Command "dwebp.exe '$str\$l' -o '$str\$l.png'"
		}
	}

	#name.txtの削除
	del $str\name.txt
}