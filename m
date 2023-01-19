Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C946FC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 11:45:25 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 30JBcVkxD029854, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 30JBcVkxD029854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jan 2023 19:38:31 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Thu, 19 Jan 2023 19:38:32 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 19 Jan 2023 19:38:32 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::15b5:fc4b:72f3:424b]) by
 RTEXMBS04.realtek.com.tw ([fe80::15b5:fc4b:72f3:424b%5]) with mapi id
 15.01.2375.007; Thu, 19 Jan 2023 19:38:32 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "Jes.Sorensen@gmail.com" <Jes.Sorensen@gmail.com>,
        "lkp@intel.com"
	<lkp@intel.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
        "linux-mm@kvack.org"
	<linux-mm@kvack.org>,
        "andrea.merello@gmail.com" <andrea.merello@gmail.com>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "ap420073@gmail.com" <ap420073@gmail.com>
Subject: Re: [linux-next:master 788/6276] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse: sparse: invalid assignment: |=
Thread-Topic: [linux-next:master 788/6276]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse:
 sparse: invalid assignment: |=
Thread-Index: AQHZK97xvqqcshDY10uEBjLej9lh4K6lFzOA
Date: Thu, 19 Jan 2023 11:38:32 +0000
Message-ID: <a259e397f41fe6f5901cb0527ef2275b8768b394.camel@realtek.com>
References: <202301191616.R33Dvxk4-lkp@intel.com>
In-Reply-To: <202301191616.R33Dvxk4-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.17.60]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzEvMTkg5LiK5Y2IIDA5OjExOjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-ID: <729B9EF35E160D429A85F73493FBB8CC@realtek.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTAxLTE5IGF0IDE2OjIwICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gdHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0IG1hc3Rlcg0KPiBoZWFkOiAgIGFhNWM0OTE0OWE4MjM1
OTk3NjRlNjk1MzIyOWIwMjhlNGJmNmU5Y2MNCj4gY29tbWl0OiAzZGZiOGU4NDRmYTMwY2NlYjRi
ODEwNjEzZTJjMzVmNjI4ZWIzZTcwIFs3ODgvNjI3Nl0gd2lmaTogcnRsOHh4eHU6IFN1cHBvcnQg
bmV3IGNoaXANCj4gUlRMODE4OEVVDQo+IGNvbmZpZzogb3BlbnJpc2MtcmFuZGNvbmZpZy1zMDQz
LTIwMjMwMTE5ICgNCj4gaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIw
MjMwMTE5LzIwMjMwMTE5MTYxNi5SMzNEdnhrNC1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gY29t
cGlsZXI6IG9yMWstbGludXgtZ2NjIChHQ0MpIDEyLjEuMA0KPiByZXByb2R1Y2U6DQo+ICAgICAg
ICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRlc3Rz
L21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8NCj4gfi9iaW4vbWFrZS5jcm9zcw0KPiAgICAgICAg
IGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MNCj4gICAgICAgICAjIGFwdC1nZXQgaW5zdGFsbCBz
cGFyc2UNCj4gICAgICAgICAjIHNwYXJzZSB2ZXJzaW9uOiB2MC42LjQtMzktZ2NlMWE2NzIwLWRp
cnR5DQo+ICAgICAgICAgIyANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPTNkZmI4ZTg0NGZhMzBj
Y2ViNGI4MTA2MTNlMmMzNWY2MjhlYjNlNzANCj4gICAgICAgICBnaXQgcmVtb3RlIGFkZCBsaW51
eC1uZXh0IA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9uZXh0L2xpbnV4LW5leHQuZ2l0DQo+ICAgICAgICAgZ2l0IGZldGNoIC0tbm8tdGFncyBsaW51
eC1uZXh0IG1hc3Rlcg0KPiAgICAgICAgIGdpdCBjaGVja291dCAzZGZiOGU4NDRmYTMwY2NlYjRi
ODEwNjEzZTJjMzVmNjI4ZWIzZTcwDQo+ICAgICAgICAgIyBzYXZlIHRoZSBjb25maWcgZmlsZQ0K
PiAgICAgICAgIG1rZGlyIGJ1aWxkX2RpciAmJiBjcCBjb25maWcgYnVpbGRfZGlyLy5jb25maWcN
Cj4gICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1nY2Mt
MTIuMS4wIG1ha2UuY3Jvc3MgQz0xIENGPSctZmRpYWdub3N0aWMtDQo+IHByZWZpeCAtRF9fQ0hF
Q0tfRU5ESUFOX18nIE89YnVpbGRfZGlyIEFSQ0g9b3BlbnJpc2Mgb2xkZGVmY29uZmlnDQo+ICAg
ICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTEyLjEu
MCBtYWtlLmNyb3NzIEM9MSBDRj0nLWZkaWFnbm9zdGljLQ0KPiBwcmVmaXggLURfX0NIRUNLX0VO
RElBTl9fJyBPPWJ1aWxkX2RpciBBUkNIPW9wZW5yaXNjIFNIRUxMPS9iaW4vYmFzaA0KPiBkcml2
ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bDh4eHh1Lw0KPiANCj4gSWYgeW91IGZpeCB0aGUg
aXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyB3aGVyZSBhcHBsaWNhYmxlDQo+ID4gUmVw
b3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiANCj4gc3BhcnNl
IHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pDQo+ID4gPiBkcml2ZXJzL25ldC93
aXJlbGVzcy9yZWFsdGVrL3J0bDh4eHh1L3J0bDh4eHh1X2NvcmUuYzo1MTk4OjI0OiBzcGFyc2U6
IHNwYXJzZTogaW52YWxpZA0KPiA+ID4gYXNzaWdubWVudDogfD0NCj4gPiA+IGRyaXZlcnMvbmV0
L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvcnRsOHh4eHVfY29yZS5jOjUxOTg6MjQ6IHNwYXJz
ZTogICAgbGVmdCBzaWRlIGhhcyB0eXBlDQo+ID4gPiByZXN0cmljdGVkIF9fbGUxNg0KPiA+ID4g
ZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGw4eHh4dS9ydGw4eHh4dV9jb3JlLmM6NTE5
ODoyNDogc3BhcnNlOiAgICByaWdodCBzaWRlIGhhcyB0eXBlDQo+ID4gPiByZXN0cmljdGVkIF9f
bGUzMg0KPiANCj4gDQoNClsuLi5dDQoNCj4gICA1MTg0CQkvKg0KPiAgIDUxODUJCSAqIHJ0c19y
YXRlIGlzIHplcm8gaWYgUlRTL0NUUyBvciBDVFMgdG8gU0VMRiBhcmUgbm90IGVuYWJsZWQNCj4g
ICA1MTg2CQkgKi8NCj4gICA1MTg3CQl0eF9kZXNjLT50eGR3NCB8PSBjcHVfdG9fbGUzMihydHNf
cmF0ZSA8PCBUWERFU0MzMl9SVFNfUkFURV9TSElGVCk7DQo+ICAgNTE4OAkJaWYgKGFtcGR1X2Vu
YWJsZSB8fCAocmF0ZV9mbGFncyAmIElFRUU4MDIxMV9UWF9SQ19VU0VfUlRTX0NUUykpIHsNCj4g
ICA1MTg5CQkJdHhfZGVzYy0+dHhkdzQgfD0gY3B1X3RvX2xlMzIoVFhERVNDMzJfUlRTX0NUU19F
TkFCTEUpOw0KPiAgIDUxOTAJCQl0eF9kZXNjLT50eGR3NCB8PSBjcHVfdG9fbGUzMihUWERFU0Mz
Ml9IV19SVFNfRU5BQkxFKTsNCj4gICA1MTkxCQl9IGVsc2UgaWYgKHJhdGVfZmxhZ3MgJiBJRUVF
ODAyMTFfVFhfUkNfVVNFX0NUU19QUk9URUNUKSB7DQo+ICAgNTE5MgkJCXR4X2Rlc2MtPnR4ZHc0
IHw9IGNwdV90b19sZTMyKFRYREVTQzMyX0NUU19TRUxGX0VOQUJMRSk7DQo+ICAgNTE5MwkJCXR4
X2Rlc2MtPnR4ZHc0IHw9IGNwdV90b19sZTMyKFRYREVTQzMyX0hXX1JUU19FTkFCTEUpOw0KPiAg
IDUxOTQJCX0NCj4gICA1MTk1CQ0KPiAgIDUxOTYJCXR4X2Rlc2MtPnR4ZHcyIHw9IGNwdV90b19s
ZTMyKFRYREVTQ19BTlRFTk5BX1NFTEVDVF9BIHwNCj4gICA1MTk3CQkJCQkgICAgICBUWERFU0Nf
QU5URU5OQV9TRUxFQ1RfQik7DQo+ID4gNTE5OAkJdHhfZGVzYy0+dHhkdzcgfD0gY3B1X3RvX2xl
MzIoVFhERVNDX0FOVEVOTkFfU0VMRUNUX0MpOw0KDQpJIHNlbmQgYSBwYXRjaCB0byBmaXggdGhp
cyBbMV0sIGJ1dCBJIGRvbid0IGhhdmUgYSBjYXJkIG9uIGhhbmQsIHNvIG9ubHkgY29tcGlsZSB0
ZXN0Lg0KVGhlcmVmb3JlLCByZWFsIHRlc3QgaXMgd2VsY29tZS4NCg0KWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXdpcmVsZXNzLzIwMjMwMTE5MTEzMTQ2Ljk2NDAtMS1wa3NoaWhA
cmVhbHRlay5jb20vVC8jdQ0KDQpQaW5nLUtlDQoNCg0K
