Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8B46B5;
	Mon, 13 Apr 2026 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776041315; cv=none; b=St2+9RhPFp16vNlJIHb9U0t9Fnx3GIDvPPf4CUgFKOmYvcP6neCjwuW3/ETcR2RgSTJOSE4/Arx42NgoQu5TnSE9UxtOAhKd/o60lTgbydGJmzWsF5JGgTDFWIw/PhJpYVm20Lb9AhFMs/8F57IMxCjm63l4nu9hpz+Erj/3bDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776041315; c=relaxed/simple;
	bh=N8zE3YNa3VKbrurpFbd7lR2EjoeyzcJQ164g2jwdCcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hmxxIs7vW3X4YpXc/3QgFXWZu/UVSvvA+Li/7aJUlJ7p1o6q8ws3uGE+AOzasZOCP7FrL4ntEovuegVilCssagq9C10ws+1M5Q18CspU2u5aBeNgx2YrchJoNxx8O9ZfdQkBclvkDM0Ks4bIqK7csEZdtKkc1OVV8kb+mXXpqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=AvXFP2yB; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="AvXFP2yB"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63D0mBipD3262570, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776041291; bh=N8zE3YNa3VKbrurpFbd7lR2EjoeyzcJQ164g2jwdCcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=AvXFP2yBduOl1HWA7/+uQBLCDtGTqapoI84vB+JE5cJ+xjRDQU7wnZBq0l5m+JXVe
	 frx8upla8K15UZMacOkXKch4To2+BnGYQwyLzLYwU9E+ZwXIqb+0UzmKVHEIMjbay7
	 KeoHWfck4AoznJQjGolzRERaaC8r1FtJ+EOTu9wlw6QfKZ2BZ893tPuGBQMqHTXY3A
	 nqYUbL10WyXgbTAJrM9X768clgZexXGgI23aD9gNjVe7up9L3OXFVoamQje+36DyFd
	 +woSGoY7cjrXCphYYMYF0XbxVMrDtPxXwD1aJLmAE/TYkPxwIxMY2aXd0i5CydWYGW
	 ASwvbmLOrIDLg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63D0mBipD3262570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Apr 2026 08:48:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Apr 2026 08:48:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Apr 2026 08:48:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Mon, 13 Apr 2026 08:48:11 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
        kernel test robot
	<lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
Thread-Topic: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
Thread-Index: AQHcyMv6u/YWKjXW3EGUlXMtosQaj7XXrWIAgACG/OKAAUPoAIACslrA
Date: Mon, 13 Apr 2026 00:48:11 +0000
Message-ID: <c09417ea7d534e2c812d470bd166fa3a@realtek.com>
References: <202604101721.fsv5XmCX-lkp@intel.com>
 <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
 <1e02bd10a68747f4a342caedde76ef04@realtek.com>
 <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
In-Reply-To: <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

SGkgR2VlcnQsDQo+IEhpIFBpbmctS2UsDQo+IA0KPiBPbiBGcmksIDEwIEFwciAyMDI2IGF0IDE0
OjE1LCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4gQml0dGVy
Ymx1ZSBTbWl0aCA8cnRsODgyMWNlcmZlMkBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gT24gMTAv
MDQvMjAyNiAxMjoyNSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6DQo+ID4gPiA+IHRyZWU6ICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdCBtYXN0ZXINCj4gPiA+ID4gaGVhZDogICA5YTljOGNlMzAwY2QzODU5Y2M4N2I0
MDhlZjU1MmNkNjk3Y2MyYWI3DQo+ID4gPiA+IGNvbW1pdDogZGViM2RkZWIxODY1MjExODk1NmZi
NTgxYTM5YWMyOTllMWVlNTYyMyB3aWZpOiBydHc4ODogRW5hYmxlIHRoZSBuZXcgUlRMODgxNEFF
L1JUTDg4MTRBVQ0KPiBkcml2ZXJzDQo+ID4gPiA+IGRhdGU6ICAgMSB5ZWFyLCAxIG1vbnRoIGFn
bw0KPiA+ID4gPiBjb25maWc6IGFybS1yYW5kY29uZmlnLTAwMS0yMDI2MDQxMA0KPiAoaHR0cHM6
Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYwNDEwLzIwMjYwNDEwMTcyMS5m
c3Y1WG1DWC1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gPiA+ID4gY29tcGlsZXI6IGFybS1saW51
eC1nbnVlYWJpLWdjYyAoR0NDKSA4LjUuMA0KPiA+ID4gPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBX
PTEgYnVpbGQpOg0KPiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIw
MjYwNDEwLzIwMjYwNDEwMTcyMS5mc3Y1WG1DWC1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4g
PiA+ID4NCj4gPiA+ID4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9j
b21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZg0KPiA+ID4gPiB0aGUgc2FtZSBw
YXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gPiA+IHwgRml4ZXM6
IGRlYjNkZGViMTg2NSAoIndpZmk6IHJ0dzg4OiBFbmFibGUgdGhlIG5ldyBSVEw4ODE0QUUvUlRM
ODgxNEFVIGRyaXZlcnMiKQ0KPiA+ID4gPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4NCj4gPiA+ID4gfCBDbG9zZXM6ICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYwNDEwMTcyMS5mc3Y1WG1DWC1sa3BAaW50ZWwuY29tLw0K
PiA+ID4gPg0KPiA+ID4gPiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+
ID4gPiA+DQo+ID4gPiA+ICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4L2Jp
dGZpZWxkLmg6MTAsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xp
bnV4L2ZvcnRpZnktc3RyaW5nLmg6NSwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICBmcm9t
IGluY2x1ZGUvbGludXgvc3RyaW5nLmg6Mzg5LA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
IGZyb20gaW5jbHVkZS9saW51eC91dWlkLmg6MTEsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgZnJvbSBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oOjE0LA0KPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC91c2IuaDo1LA0KPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OC9y
dHc4ODE0YS5jOjU6DQo+ID4gPiA+Pj4gaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDo3ODo0MTog
ZXJyb3I6IHN0YXRpYyBhc3NlcnRpb24gZmFpbGVkOiAic2l6ZW9mKHN0cnVjdCBydHc4ODE0YV9l
ZnVzZSkNCj4gPT0gNTEyIg0KPiA+ID4NCj4gPiA+IHN0cnVjdCBydHdfMmdfdHhwd3JfaWR4IGlz
IG1pc3NpbmcgX19wYWNrZWQuIENvdWxkIHRoYXQgYmUgdGhlIHJlYXNvbg0KPiA+ID4gZm9yIHRo
ZSBlcnJvcj8gSSBkb24ndCBzZWUgd2hhdCBlbHNlIGNvdWxkIGJlIGNhdXNpbmcgaXQuDQo+ID4g
Pg0KPiA+DQo+ID4gSSBhbHNvIGZvdW5kIHRoYXQgZmxhdywgYnV0IGl0IGlzbid0IGNhdXNlLiBJ
IGRvd25sb2FkIGNyb3NzIGNvbXBpbGVyDQo+ID4gdG8gYnVpbGQgYXJtIG9uIG15IHg4NiwgYW5k
IGFkZHJlc3MgdGhlIGNhdXNlIGlzOg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODgvcnR3ODgxNGEuaA0KPiBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL3JlYWx0ZWsvcnR3ODgvcnR3ODgxNGEuaA0KPiA+IGluZGV4IGM1N2M3YzhmOTE1ZS4uN2Yy
MjYwMTE3NDg3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsv
cnR3ODgvcnR3ODgxNGEuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsv
cnR3ODgvcnR3ODgxNGEuaA0KPiA+IEBAIC01MSwxMCArNTEsMTUgQEAgc3RydWN0IHJ0dzg4MTRh
X2VmdXNlIHsNCj4gPiAgICAgICAgIHVuaW9uIHsNCj4gPiAgICAgICAgICAgICAgICAgc3RydWN0
IHJ0dzg4MTRhdV9lZnVzZSB1Ow0KPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnR3ODgxNGFl
X2VmdXNlIGU7DQo+ID4gLSAgICAgICB9Ow0KPiA+ICsgICAgICAgfSBfX3BhY2tlZDsNCj4gDQo+
IEhvdyBjYW4gdGhhdCBtYWtlIGEgZGlmZmVyZW5jZT8NCj4gQm90aCBydHc4ODE0YXVfZWZ1c2Ug
YW5kIHJ0dzg4MTRhZV9lZnVzZSBjb250YWluIGp1c3QgKHRoZSBzYW1lIG51bWJlcg0KPiBvZikg
Ynl0ZXMsIHNvIF9fcGFja2VkIG9uIHRoZSB1bmlvbiBzaG91bGQgbm90IG1ha2UgYW55IGRpZmZl
cmVuY2U/DQo+IE1vcmVvdmVyLCBydHc4ODE0YXVfZWZ1c2UgYW5kIHJ0dzg4MTRhZV9lZnVzZSBh
cmUgYWxyZWFkeSB0YWdnZWQgd2l0aA0KPiBfX3BhY2tlZCwgd2hpY2ggc2hvdWxkIGFsc28gbm90
IG1ha2UgYW55IGRpZmZlcmVuY2UuICBTb21lb25lJ3MgYmVlbg0KPiBzcHJpbmtsaW5nIHRvbyBt
YW55IF9fcGFja2VkIGFsbCBvdmVyIHRoZSBwbGFjZT8NCg0KSSBoYXZlIHNpbWlsYXIgdGhvdWdo
dCBhcyB5b3VycywgYnV0IGFybS1saW51eC1nbnVlYWJpLWdjYyBjb21waWxlciBzZWVtcw0KaGF2
ZSBzcGVjaWFsIHRyZWF0bWVudCB3aXRoIHVuaW9uLiBGb3IgdGhpcyBjYXNlLCB3aXRob3V0IF9f
cGFja2VkDQp0aGUgb2Zmc2V0IG9mIGZvbGxvd2VkIGZpZWxkIHJlczUgd2lsbCBiZWNvbWUgMHhl
MC4NCg0KV2hlbiBpbnZlc3RpbmcgdGhpcyBlcnJvciwgSSBhbHNvIGZvdW5kIGFub3RoZXIgd2Fu
aW5nIFsxXS4NCg0KSSBkb24ndCBrbm93IHdoeSB0aGUgY29tcGlsZXIgdHJlYXRzIHRoZSB1bmlv
biBzbyBzcGVjaWFsLCBhbmQgSSBmaXgNCnRoZW0gYnkgZXhwZXJpbWVudGFsIHJlc3VsdHMuDQoN
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy8yMDI2MDQxMTA3MjUw
OS4xNTU2NjM1LTEtcGtzaGloQHJlYWx0ZWsuY29tL1QvI3UNCg0KPiANCj4gPiAgICAgICAgIHU4
IHJlczVbMHgxMjJdOyAgICAgICAgICAgICAgICAgLyogMHhkZSAqLw0KPiA+ICB9IF9fcGFja2Vk
Ow0KPiA+DQo+ID4gSSB3aWxsIHNlbmQgYSBwYXRjaCBzb29uLg0KPiA+DQo+ID4gUGluZy1LZQ0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KDQpQaW5nLUtlDQoNCg==
