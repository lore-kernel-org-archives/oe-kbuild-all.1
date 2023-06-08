Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E72EC5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 02:19:33 +0000 (UTC)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3582IB4p8029392, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3582IB4p8029392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 8 Jun 2023 10:18:11 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 8 Jun 2023 10:18:27 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 8 Jun 2023 10:18:26 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Thu, 8 Jun 2023 10:18:26 +0800
From: =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?= <stanley_chang@realtek.com>
To: kernel test robot <lkp@intel.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "Vinod
 Koul" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>, Ray Chi <raychi@google.com>,
        "Flavio
 Suligoi" <f.suligoi@asem.it>,
        "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH v3 2/5] phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY
Thread-Topic: [PATCH v3 2/5] phy: realtek: usb: Add driver for the Realtek SoC
 USB 2.0 PHY
Thread-Index: AQHZmQjR4Z6nmQOlk0qvgFcnmBMR/a9/E4qAgAEY5bA=
Date: Thu, 8 Jun 2023 02:18:26 +0000
Message-ID: <2444f4875f484cc4bf2ff9c52815fa0c@realtek.com>
References: <20230607062500.24669-2-stanley_chang@realtek.com>
 <202306080128.Gh3c2H1O-lkp@intel.com>
In-Reply-To: <202306080128.Gh3c2H1O-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

PiBFUlJPUjogbW9kcG9zdDogImRldm1fdXNiX2dldF9waHlfYnlfcGhhbmRsZSINCj4gW2RyaXZl
cnMvcG93ZXIvc3VwcGx5L3dtODMxeF9wb3dlci5rb10gdW5kZWZpbmVkIQ0KPiA+PiBFUlJPUjog
bW9kcG9zdDogImRldm1fdXNiX2dldF9waHkiDQo+IFtkcml2ZXJzL3Bvd2VyL3N1cHBseS9kYTkx
NTAtY2hhcmdlci5rb10gdW5kZWZpbmVkIQ0KPiANCj4gS2NvbmZpZyB3YXJuaW5nczogKGZvciBy
ZWZlcmVuY2Ugb25seSkNCj4gICAgV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBk
ZXRlY3RlZCBmb3IgVVNCX1BIWQ0KPiAgICBEZXBlbmRzIG9uIFtuXTogVVNCX1NVUFBPUlQgWz1u
XQ0KPiAgICBTZWxlY3RlZCBieSBbeV06DQo+ICAgIC0gUEhZX1JUS19SVERfVVNCMlBIWSBbPXld
DQo+IA0KDQpJIHdpbGwgYWRkIFVTQl9TVVVQUlQgZGVwZW5kZW5jeSB0byBLY29uZmlnLg0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvcmVhbHRlay9LY29uZmlnIGIvZHJpdmVycy9waHkvcmVh
bHRlay9LY29uZmlnDQppbmRleCAyOGVlM2Q5YmU1NjguLmE1YTVhNzFlZGM5YyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvcGh5L3JlYWx0ZWsvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9waHkvcmVhbHRl
ay9LY29uZmlnDQpAQCAtNCw2ICs0LDcgQEANCiAjDQogY29uZmlnIFBIWV9SVEtfUlREX1VTQjJQ
SFkNCiAgICAgICAgdHJpc3RhdGUgIlJlYWx0ZWsgUlREIFVTQjIgUEhZIFRyYW5zY2VpdmVyIERy
aXZlciINCisgICAgICAgZGVwZW5kcyBvbiBVU0JfU1VQUE9SVA0KICAgICAgICBzZWxlY3QgR0VO
RVJJQ19QSFkNCiAgICAgICAgc2VsZWN0IFVTQl9QSFkNCiAgICAgICAgaGVscA0KQEAgLTE0LDYg
KzE1LDcgQEAgY29uZmlnIFBIWV9SVEtfUlREX1VTQjJQSFkNCg0KIGNvbmZpZyBQSFlfUlRLX1JU
RF9VU0IzUEhZDQogICAgICAgIHRyaXN0YXRlICJSZWFsdGVrIFJURCBVU0IzIFBIWSBUcmFuc2Nl
aXZlciBEcml2ZXIiDQorICAgICAgIGRlcGVuZHMgb24gVVNCX1NVUFBPUlQNCiAgICAgICAgc2Vs
ZWN0IEdFTkVSSUNfUEhZDQogICAgICAgIHNlbGVjdCBVU0JfUEhZDQogICAgICAgIGhlbHANCg==
