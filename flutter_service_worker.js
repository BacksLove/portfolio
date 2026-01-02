'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "93b6945499e2fd952066b54fd400e01f",
"version.json": "43cc4f71ed4e7f6739b9aed18a77df42",
"index.html": "acdb6077cb630557ae04d28953814818",
"/": "acdb6077cb630557ae04d28953814818",
"main.dart.js": "353afe7fa42e3fb77d52687e93f81b9c",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "71227f103b00d0a895452f72c0dbced9",
".git/config": "7a8c2467fadfd1221d18b2fe91c22216",
".git/objects/61/dc24cef4958a634d2e955c263b56c94ca935f7": "5c78a890f6a608e9a1edde06f13a8b5e",
".git/objects/92/aefee32b89f149fbc81ae47950623c52fd876b": "26037a46d1f2e454305e58e53dbb4afa",
".git/objects/66/c71b3df1422ac2ba5c6500062b9750c3ab0615": "4a315fb159886fe895fe9a44dcc1951e",
".git/objects/50/d2b58d02876c4db57259110fff90205675d0c8": "74e4dc44be933e0314fa49c856bc61a0",
".git/objects/50/8dc86894ac58d34c90964f17c8da355261fd44": "0e9ba70f970117734e0f52cf854d77fc",
".git/objects/68/da172188fd893837221ff33b03f51d20122dd0": "8bee56a47624c2c2713e1b2214f2dacf",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/6f/439d5c9be99ccc6e91cf66948bd73465e181fd": "78162b97285baaa944cc85f58c332408",
".git/objects/6a/a99b688b300806e059d7fa3cffe89847d5a76e": "6f4b8a1a5954e29e95096327abfb59a8",
".git/objects/69/b2023ef3b84225f16fdd15ba36b2b5fc3cee43": "6ccef18e05a49674444167a08de6e407",
".git/objects/56/8f40865f6b49c54e1e16abaafcb24967e1f26d": "7f6359919e9f5fc7db3107b1fe96ca76",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/3d/13a3bf6f088776d674c5a1d183ddfde176d295": "5102d0a25cd666a1248b7a7020e676d6",
".git/objects/0b/ff0ee8e1f36ef10f38573510d1508cdc9a1cea": "6ce71d81df762993c731f7fc040a51de",
".git/objects/0b/f2aab9a4763cb1634ab11f5558dc5cb7b23ddc": "067051153eb1b78141c4a152b28a6b26",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/94/ee9fda6c9b27a358a05221b46ee40e71cfd72f": "48e537970c99672fb085b2e84abd781e",
".git/objects/94/482906dc1f91ecf3a247e862683e3a37c9c698": "4da89cc5c7951352c7fc44528679a4f5",
".git/objects/0e/6e97950b9a3140561516d33c2382f99a2482d2": "3561bcc21f8499c147c636dafc028434",
".git/objects/9c/d8fb2be2107aa82a521577722c6a3d6b90aec4": "e0dbd7e948090e0bdf90849e745c774f",
".git/objects/a3/bbb8af34720daa0606b4807bbc193c3b6fd2f7": "f3efa22400b7402f6d43acbea8cf3356",
".git/objects/b5/1bc2915dcb5714d822bd9e6bd7e26b4312b591": "dbe6c54dbd5673ca09b8b2136f6a5c17",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/ad/5df906e77b1e640711d14fc819663c71995f5e": "92aa5046c959a13aec8f12ae47cba54d",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/ad/23bc2f19fdd5965c6c2a066b43a3bba0b87063": "26d1c1bb26062405cc3f97d457664d44",
".git/objects/ad/34a1a5c72fd7e1954b4b006d5675bcf8aa7d8f": "6087962684a3166cc4b3765736f0bb27",
".git/objects/b3/501f44695b8a2e71c3bb1ea67e9a907dcce900": "00b6d01933191067686e10863fdeadf4",
".git/objects/df/ff3d3256accbd7257ba85afe08db3e8c36bae9": "1af87e0bdfeb39d303e876a2a367ec65",
".git/objects/d1/e054de8a8035bc1ca929e4295a0662519fd6b7": "7ac9a5c4eb0d005d82081cb41184d592",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/1995ab9e47ca79b00f6a1ede86374cef25ff11": "c79e66f41aaac6ec447f9c35716208f1",
".git/objects/d8/a15c0a7b5ca3f5a0e6c08d1251cb070109593b": "2b2c176d93d7d086991a081a92f1f4c9",
".git/objects/d8/10465f16710466e4f0c4305a823bdb1e937f65": "ae2edc8381c476438ec20a7b82f632e9",
".git/objects/ab/204f0f18ac6f5fa2052d8ae18db012aea9856f": "ca7aafb99a2cced5a6edc4c514f1bb2d",
".git/objects/e2/aa52cb39931758e6df873a67f7d253e42da675": "008f60e9a49b5dd166058657d9f30a9f",
".git/objects/f4/dc555d5834ad4e2bea34c9b658a52153fa1f2b": "1e8497b39d3d7d902c6470a5da274ff6",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c0/5c917e422ca97cd34ffc44ae568eb137c7d6fc": "8a2b61ad55dfb27a9c95d5408ec34fe3",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/fe/3ee2949b2ff0a931c9188ffb0cf3871d8246ef": "6da278373b059945cc5805e3838ae32d",
".git/objects/c8/c05effec8cb6fc76f9bcd0fbead737a8cc2f5d": "c40ddd8d0fe5990c73c5ffe5cf9f5650",
".git/objects/c8/c30bd1305ea61944e92ce89baff75d2e2384c1": "43d702cb56937af2ba431dc7fe326a96",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/ed/d990a6b4a972cc2a0a4df30efc171244d37fe2": "404db3c3f07afc16a33b1b586b253d95",
".git/objects/4e/e5d64f831c1eaba50022bf80658a9740c94719": "9381d7effad83d6b357486e3fd9277db",
".git/objects/20/32af56747f8328cb3f7b6b7e1f6bcba3ac79de": "435acac87b0a7f63fcb8e4023e43342a",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/45/8eebeee13835c538792ebe40be2b1c88aad2b7": "a4baaca50788d5584cbfcb1a61405fdc",
".git/objects/1f/563d669a7aba168eeaa11fe36770f8156bc1c0": "871df35a03951ae721639c6a6d5d6107",
".git/objects/87/e102281318d99f9af385a37e643364bc7e6c5a": "9103ed8bf3268808e1fa2f66444966b1",
".git/objects/8f/9945ae2a6daa5fa5fe9db8872342d8e5c792d5": "4987aaf48b4ccbfe61694d11735c1622",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/72/69eff7ca779dc0e789036d69afb26366e36a2e": "5cf6509636b31b34431efe85ead8b0cd",
".git/objects/2f/7d9fc78194438efab64870e3b4a95a197fa905": "e7f1278ef5788c0c9bcbd3e222586371",
".git/objects/2f/64c0acfdffa1d4ab54c4a91bf3d44f2bdabf7a": "99148640c98d409dfeae0cace4c1c091",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/2fbe92d093b93d233e805883d9a23dbaa7a884": "bbfa01b439bb2c7dd8046fc39bf2a749",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/5c/c953c7a210bcba6e0c551ddec69d8c3b0ad956": "c87d1b24cbd5c73272d5f598413aa03e",
".git/objects/62/8fe0f0d588cc025a35b6c631cce74bb6a1487b": "b42af2da8a2d561dc5773fb6c1d84a6d",
".git/objects/96/a11e54f910feca1460f0615c48b8c0c9c111c0": "256fa317e5900e08d3511ac2245e6ee9",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/54/e1e3fe6df3a93ceb880c4768c7f66841abcd32": "867dac3f7046d06bf31fd33ba55d7c09",
".git/objects/5b/4c4ddbadb7bcdef7183743c355e5fa64ca4f80": "9a4704581adcbee6c348d18ac7e3c5eb",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/6c/dc8c1a81955224f0bdbbc3833a9af4175448db": "356920ff3138551f20efa4e60637bc1d",
".git/objects/52/c15c6abccae0c4617b0d2704a66d5f500cec1a": "0143f1e81c8b1a20ae54fec63a1d70d1",
".git/objects/64/9f6930a386183e7267513e8f10a0d6fceefa37": "d52bbb9fb1362cf44b580e5fa0e1a3ff",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/a0/df88f885fa0061f9699820ffd2a8af839f8003": "f64847f9f67d91376ef03e7605ff9829",
".git/objects/b8/92b0029ffbb0335daec2c97ac4d3df9a0a6e48": "a437ef54cf8e704f275ac60de126e3d4",
".git/objects/dd/c0f92578595afd6bdde52d461d9d8c8413fbc2": "83499634963a72fe6cc6d71070879358",
".git/objects/d5/363aa188a8b885f8d48fbd5da189cd90a04c22": "77e7924536ef9abefb74b7f85b20f556",
".git/objects/af/ce4da33888123eddbc5527fea47b5ce0b35209": "74f1ee34a05676e9716487347e68c07e",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/db/c70097d2d229163dffc6507b5f863ba61715cc": "ff4d1354040258a1233d2191d7106346",
".git/objects/a8/7ac505197710ad424de1950537eb37114473b4": "93c4786e2642f5e70cf9f7f70b699a33",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/578ea38236b2a47cc6722251d36d4416187001": "9e705f14248e802045584511681cc12a",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/a1/6489b46f6541b109087a9521e431439b824fc5": "7524be81b60afdad2443c72abc58a325",
".git/objects/ef/c61d58966949373b7d9beb9024d92da4fdafbb": "c97b29d3efe2f6f00c29ed1b30749b04",
".git/objects/ea/bf4adda72729372864a9dbde11e81d52528d76": "4da26795df2d9126652cf0e66a3d3183",
".git/objects/cc/dc997ab23fd3f2c350b96f395956dbf1077f0d": "08fdb1c992c82356484b4bd551d86653",
".git/objects/e6/fb66bd90d5d5a21ce192c3e4995bc1b481a20b": "a3fbe578052bb90eeceb3847cbebf4e1",
".git/objects/e6/eb8f689cbc9febb5a913856382d297dae0d383": "466fce65fb82283da16cdd7c93059ff3",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/f0/b8cff554db593120f78576da84ae993a23750a": "292fb172202e7c7311702dd30e1d3333",
".git/objects/fa/2698ad5f8a31a2c131a2a490b9c7b321a0f699": "488f381cc2ef2aa4268d7aaaed5bcd16",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/2c/58250ca06ab5c651e472a2d760e7453bd42c43": "944a6a20f1688c142725b9bf8d8e762e",
".git/objects/79/b687ed3b7e8f3a71a1ad8e2cb5ec5c8b3cb843": "7854eebeb07b28476b22b5cefb8528a2",
".git/objects/41/2d212226875c34de5af9a4b40051a342805038": "2215cea04b8d6f93aac13a665e791808",
".git/objects/83/3bf82bf294f056a7c4b5dd9bcc537cb544a937": "40a753f3ff776699bb8d38787b9eb493",
".git/objects/48/6d69d86967dfee3aa7d6609b1a1f2c6cb594ab": "a27cc6e1c9ad53cabbf2f83fec6b9186",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/49/ef07a21c4e00fe44ed026dfd1bd50e74dd82d6": "b176e0aee508462c37c996e7a6ebf02e",
".git/objects/40/e8e98cbb2254477c0f65c082c287d19f313063": "f9842ab80ff3a6923631ff30b0e8e227",
".git/objects/2b/64587c155a640b35522468f44d76d295ed5a35": "2254d6175348a91c07b7695c5fe65c0a",
".git/objects/7f/7bd9fbc06fbc638910408c993af83ac156bcfe": "f085c67baff0e76acbd1862343bf11db",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e23a3df6bb78b7bedf8fbf175b784641",
".git/logs/refs/heads/main": "6a3844705eccdf94636f7b2e1d19fef1",
".git/logs/refs/remotes/origin/gh-pages": "187bd253d1b1e4854e1e0d1246535289",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "49b8cfc3dd7f019743890919bfc760ef",
".git/refs/remotes/origin/gh-pages": "49b8cfc3dd7f019743890919bfc760ef",
".git/index": "34e559e79c3503adb38cbe9a7dee8014",
".git/COMMIT_EDITMSG": "a2611710b03c4056e5b32eb1c916eb2c",
"assets/NOTICES": "97989a13a21289faa504d18890958c52",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/AssetManifest.bin.json": "51a0def22712c98aa4c4a5081186c0d3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "55bce171884974d84621d273cf629861",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "daaa5a81bf768cb942f8174452c10790",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "e127a53af043b6c7dea5dc16a8cee4d9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "7731f74b374a224dfa9c5a2cee1add27",
"assets/fonts/MaterialIcons-Regular.otf": "91edd0a6e1829e7d2afcc41be13ada06",
"assets/assets/images/projects/waaa.png": "d8580655426e51757f0ce867ef8c5c0f",
"assets/assets/images/projects/waaa_world/waaa_2.png": "31bfb1d59f94e5db7e91d8fcd5e6c5d6",
"assets/assets/images/projects/waaa_world/waaa_3.png": "760346c1cc0ddda8d6f338b45e04b8da",
"assets/assets/images/projects/waaa_world/waaa_1.png": "81601ea295fdbbbab51d75746d79c373",
"assets/assets/images/projects/waaa_world/waaa_4.png": "3ead84aa1e036e57cfa2329cb4c3ade4",
"assets/assets/images/projects/hoopers.png": "098110ef258b4ef76b8d89295eec8e3f",
"assets/assets/images/projects/starthome/starthome_1.png": "ce4618d9e8e4b952c2816b130fbb6d57",
"assets/assets/images/projects/starthome/starthome_3.png": "90269fbe487cf0753598736b1a28af2d",
"assets/assets/images/projects/starthome/starthome_2.png": "dc190de430bacd8a597d10332ff10962",
"assets/assets/images/projects/starthome/starthome_4.png": "61e434ec12f4790c22028dad4f0dd8a9",
"assets/assets/images/projects/starthome.png": "0ebb8e07199dba0cfa37dcb71927fc59",
"assets/assets/images/experiences/nomad_education/nomad_education_2.png": "b326ec1dac753950f16731d3b70ffd9c",
"assets/assets/images/experiences/nomad_education/nomad_education_3.png": "54f1ab1786b68f3554bd8857299fd05c",
"assets/assets/images/experiences/nomad_education/nomad_education_1.png": "114ef68c39b0e0f4f6b3d7a9b9d63448",
"assets/assets/images/experiences/nomad_education/nomad_education_4.png": "81f764dec730f3a39b081cec5edd24af",
"assets/assets/images/experiences/nomad_education/nomad_education.png": "0530023859af22b0675fe40310fc2ed8",
"assets/assets/images/experiences/desjardins/desjardins_8.png": "7ac455b8dee927a462e13f086d8cafa1",
"assets/assets/images/experiences/desjardins/desjardins_3.png": "024c9c7ca089d2e9f41ae8987aaf4309",
"assets/assets/images/experiences/desjardins/desjardins_2.png": "e1211669f92704b4661ad8e7d044156b",
"assets/assets/images/experiences/desjardins/desjardins_1.png": "d9328452a2d539f0f8387244b4e60988",
"assets/assets/images/experiences/desjardins/desjardins_5.png": "61efadd7cc2559f0260100c583d28146",
"assets/assets/images/experiences/desjardins/desjardins_4.png": "aae483cdb858c95f29384f3b5145b944",
"assets/assets/images/experiences/desjardins/desjardins_6.png": "ff5c5bebfb6857e92e05d1d20e8eab2e",
"assets/assets/images/experiences/desjardins/desjardins_7.png": "fc9c447566dc5e9dbceb6c24545c353c",
"assets/assets/images/experiences/desjardins/desjardins.png": "76c64db39b5e92928fc38a7c52a52353",
"assets/assets/images/experiences/totalenergies/totalenergies_4.png": "119d0acc152d46d2c8ff9bcbe4544dc7",
"assets/assets/images/experiences/totalenergies/totalenergies_1.png": "20a0e304332b0afc462df7bfbd66c94b",
"assets/assets/images/experiences/totalenergies/totalenergies.png": "44cebe119dbe27b82d68f095d6e89676",
"assets/assets/images/experiences/totalenergies/totalenergies_2.png": "8509cead1e6a97a2fe5c2273445b9dfc",
"assets/assets/images/experiences/totalenergies/totalenergies_3.png": "c1248451b405cc41b08b3aaa06b88ad5",
"assets/assets/images/experiences/groupe3mc/groupe3mc.png": "6e843529c761e3e747341f0facbc0822",
"assets/assets/images/experiences/spotmycity/spotmycity_3.png": "105b011c5051f5bbc1fc87e1b7d69d5a",
"assets/assets/images/experiences/spotmycity/spotmycity_2.png": "7b05d62b99996514fe7606cb8da33330",
"assets/assets/images/experiences/spotmycity/spotmycity_1.png": "8b1a3318d6d5fe4d44f5916b21232ed4",
"assets/assets/images/experiences/spotmycity/spotmycity_4.png": "34ac6e11bd7c1bc96946f6299ced91e3",
"assets/assets/images/experiences/spotmycity/spotmycity.png": "b6090473c1dc1f554c24bb6707aec7c3",
"assets/assets/images/profile.jpg": "35bd0b122527314a763018af59e021c5",
"assets/assets/images/profile_back.jpg": "2dc7c212be15ebdb771e25e17dc1aaac",
"assets/assets/docs/CV_FR.pdf": "40d2932f68c96d545b351d4d39cf7fcf",
"assets/assets/docs/CV_EN.pdf": "58bd03e4fbf1f464db4f9c4644f2c5bb",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
