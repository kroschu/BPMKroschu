<?php exit;?>{
    "systemPassword": "37AzhUiqxuMj5cCHqTpe",
    "systemName": "BPM&Kroschu",
    "systemDesc": "Pilot project of BPM system",
    "pathHidden": "Thumb.db,.DS_Store,.gitignore,.git",
    "autoLogin": "0",
    "needCheckCode": "0",
    "firstIn": "desktop",
    "newUserApp": "",
    "newUserFolder": "Фото,Матеріали,НБЯ,Моделі",
    "newGroupFolder": "share,文档,图片资料,视频资料",
    "groupShareFolder": "share",
    "desktopFolder": "desktop",
    "rootListUser": "1",
    "rootListGroup": 0,
    "csrfProtect": "0",
    "currentVersion": "4.40",
    "wallpageDesktop": "1,2,3,4,5,6,7,8,9,10,11,12,13",
    "wallpageLogin": "2,3,6,8,9,11,12",
    "menu": [
        {
            "name": "desktop",
            "url": "index.php%3Fdesktop",
            "target": "0",
            "subMenu": "0",
            "use": "1",
            "type": ""
        },
        {
            "name": "explorer",
            "url": "index.php%3Fexplorer",
            "target": "0",
            "subMenu": "0",
            "use": "1",
            "type": ""
        },
        {
            "name": "editor",
            "url": "index.php%3Feditor",
            "target": "0",
            "subMenu": "0",
            "use": "1",
            "type": ""
        }
    ],
    "pluginList": {
        "webodf": {
            "id": "webodf",
            "regiest": {
                "user.commonJs.insert": "webodfPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "openWith": "dialog",
                "fileExt": "odf,odt,ods,odp",
                "fileSort": 5000
            }
        },
        "simpleClock": {
            "id": "simpleClock",
            "regiest": {
                "user.commonJs.insert": "simpleClockPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1"
            }
        },
        "jPlayer": {
            "id": "jPlayer",
            "regiest": {
                "user.commonJs.insert": "jPlayerPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "fileExt": "mp3,wav,m4a,aac,oga,ogg,webma,mp4,m4v,flv,mov,f4v,ogv,webm,webmv,m3u8a,m3ua,flac,fla,rtmp,rtmpa",
                "fileSort": 10
            }
        },
        "VLCPlayer": {
            "id": "VLCPlayer",
            "regiest": {
                "user.commonJs.insert": "VLCPlayerPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "fileExt": "aac,arc,arj,asf,asx,avi,f4v,flv, m2ts,m4v,mp2,mov,mp3,mp4,mp4v,mpe,mpg,mts,mkv,ogv,3gp,mpeg,wav,wma,wmv,rm,rmvb,vob,webm,webmv,   mp3,wav,wma,m4a,aac,oga,ogg,webma",
                "fileSort": 1
            }
        },
        "picasa": {
            "id": "picasa",
            "regiest": {
                "user.commonJs.insert": "picasaPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "fileExt": "jpg,jpeg,png,bmp,gif,ico,svg,cur,webp",
                "fileSort": 10
            }
        },
        "zipView": {
            "id": "zipView",
            "regiest": {
                "user.commonJs.insert": "zipViewPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "fileExt": "zip,tar,gz,tgz,ipa,apk,rar,7z,iso,bz2,zx,z,arj,epub",
                "fileSort": 10
            }
        },
        "DPlayer": {
            "id": "DPlayer",
            "regiest": {
                "user.commonJs.insert": "DPlayerPlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "subtitle": "0",
                "fileSort": 200,
                "fileExt": "mp4,m4v,flv,mov,f4v,ogv,webm,webmv,mkv"
            }
        },
        "toolsCommon": {
            "id": "toolsCommon",
            "regiest": {
                "user.commonJs.insert": "toolsCommonPlugin.echoJs"
            },
            "status": 1,
            "config": []
        },
        "imageExif": {
            "id": "imageExif",
            "regiest": {
                "user.commonJs.insert": "imageExifPlugin.echoJs",
                "share.image": "imageExifPlugin.imageCheck",
                "explorer.image": "imageExifPlugin.imageCheck"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1"
            }
        },
        "officeLive": {
            "id": "officeLive",
            "regiest": {
                "user.commonJs.insert": "officeLivePlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "pluginAuthOpen": 0,
                "openWith": "dialog",
                "apiServer": "https:\/\/owa-box.vips100.com\/op\/view.aspx?src=",
                "fileExt": "doc,docx,docm,dot,dotx,dotm,rtf,xls,xlsx,xlt,xlsb,xlsm,csv,ppt,pptx,pps,ppsx,pptm,potm,ppam,potx,ppsm,odt,ods,odp,ott,ots,otp,wps,wpt",
                "fileSort": 5
            }
        },
        "adminer": {
            "id": "adminer",
            "regiest": {
                "templateCommonHeader": "adminerPlugin.addMenu"
            },
            "status": 1,
            "config": {
                "pluginAuth": "role:1",
                "menuSubMenu": 1
            }
        },
        "yzOffice": {
            "id": "yzOffice",
            "regiest": {
                "user.commonJs.insert": "yzOfficePlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "openWith": "dialog",
                "fileExt": "doc,docx,docm,dot,dotx,dotm,rtf,wps,wpt,xls,xlsx,xlt,xlsm,csv,ppt,pptx,pps,ppsx",
                "fileSort": 50,
                "cacheFile": "1",
                "preview": "0"
            }
        },
        "photoSwipe": {
            "id": "photoSwipe",
            "regiest": {
                "user.commonJs.insert": "photoSwipePlugin.echoJs"
            },
            "status": 1,
            "config": {
                "pluginAuth": "all:1",
                "fileExt": "jpg,jpeg,png,bmp,gif,ico,svg,cur,webp",
                "fileSort": 20
            }
        }
    },
    "globalIcp": "",
    "globalCss": ".copyright-content{display:none}",
    "globalHtml": "<script>\nvar html = document.getElementsByClassName(\"common-footer\")[0].innerHTML;\ndocument.getElementsByClassName(\"common-footer\")[0].innerHTML = html + \"Powered by BPM&Kroschu based on KodExplorer developed by Kovalenko V. KSUA Lu mitarbiter p\/n 6060 <a href=\\\"https:\/\/www.linkedin.com\/in\/kroschu\/\\\" target=\\\"_blank\\\">LinkedIn<\/a> \";\nvar html = document.getElementsByClassName(\"dialog-copyright-content\")[0].innerHTML;\ndocument.getElementsByClassName(\"content\")[0].innerHTML = html + \"Powered by BPM&Kroschu based on KodExplorer developed by Kovalenko V. KSUA Lu mitarbiter p\/n 6060 <a href=\\\"https:\/\/www.linkedin.com\/in\/kroschu\/\\\" target=\\\"_blank\\\">LinkedIn<\/a> \";\n<\/script>",
    "versionType": "A"
}