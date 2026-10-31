return {
PlaceObj('ModItemFont', {
	'name', "NotoSansRegular",
	'AssetFiles', {
		PlaceObj('FontAsset', {
			'FontPath', "Mod/qtp4GGC/Fonts/NotoSans-Regular.ttf",
		}),
	},
	'ReplaceMappings', {
		PlaceObj('FontReplaceMapping', {
			'Replace', "SchemeBk",
			'With', "Noto Sans Regular",
		}),
		PlaceObj('FontReplaceMapping', {
			'Replace', "LibelSuitRg",
			'With', "Noto Sans Regular",
		}),
	},
}),
PlaceObj('ModItemFont', {
	'name', "NotoSansRegularBold",
	'AssetFiles', {
		PlaceObj('FontAsset', {
			'FontPath', "Mod/qtp4GGC/Fonts/NotoSans-Bold.ttf",
		}),
	},
	'ReplaceMappings', {
		PlaceObj('FontReplaceMapping', {
			'Replace', "LibelSuitRg",
			'With', "Noto Sans Bold",
		}),
	},
}),
PlaceObj('ModItemLocTable', {
	'language', "English",
	'filename', "Mod/qtp4GGC/Localization/Game.csv",
}),
}
