Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED337D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 08:37:20 +0000 (UTC)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34R8auCT3002567, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34R8auCT3002567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Sat, 27 May 2023 16:36:56 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Sat, 27 May 2023 16:37:08 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 27 May 2023 16:37:08 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Sat, 27 May 2023 16:37:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "lkp@intel.com" <lkp@intel.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 3/3] wifi: rtw89: remove redundant check of entering LPS
Thread-Topic: [PATCH 3/3] wifi: rtw89: remove redundant check of entering LPS
Thread-Index: AQHZkHV6NWsTWII30kOxyw8LhjPGDa9tRAqAgAABvQA=
Date: Sat, 27 May 2023 08:37:08 +0000
Message-ID: <159b55a75ea8f88e39943d5997e508ce3a41fd5d.camel@realtek.com>
References: <ZHG/t/dgpF807Z3u@3bef23cc04e9>
In-Reply-To: <ZHG/t/dgpF807Z3u@3bef23cc04e9>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.16.243]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED18EDCA4FFFB64C96AF5E94A251326E@realtek.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

T24gU2F0LCAyMDIzLTA1LTI3IGF0IDE2OjMwICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gDQo+IEhpLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KPiANCj4gRllJOiBr
ZXJuZWwgdGVzdCByb2JvdCBub3RpY2VzIHRoZSBzdGFibGUga2VybmVsIHJ1bGUgaXMgbm90IHNh
dGlzZmllZC4NCj4gDQo+IFJ1bGU6ICdDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZycgb3IgJ2Nv
bW1pdCA8c2hhMT4gdXBzdHJlYW0uJw0KPiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSB3aWZpOiBydHc4
OTogcmVtb3ZlIHJlZHVuZGFudCBjaGVjayBvZiBlbnRlcmluZyBMUFMNCj4gTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvc3RhYmxlLzIwMjMwNTI3MDgyOTM5LjExMjA2LTQtcGtzaGloJTQw
cmVhbHRlay5jb20NCj4gDQo+IFRoZSBjaGVjayBpcyBiYXNlZCBvbiBodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMuaHRtbA0K
PiANCg0KSSBzZW50IHRoaXMgcGF0Y2hzZXQgd2l0aCB0aGUgc2FtZSBUby9DYyBtYWlsIGFkZHJl
c3NlcywgYnV0IEkgZG9uJ3Qgd2FudA0KdG8gYXBwbHkgdGhpcyBwYXRjaCB0byBzdGFibGUga2Vy
bmVsLCBzbyBwbGVhc2Ugc3RhYmxlIG1haW50YWluZXJzDQppZ25vcmUgdGhpcyBwYXRjaC4gSSB3
aWxsIHRha2UgY2FyZSBhYm91dCB0aGlzIGJ5IG5leHQgc3VibWlzc2lvbi4NCg0KUGluZy1LZQ0K
DQo=
