Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597E543158
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713130001; cv=none; b=dOLP0i5nHZ+0f/Gj+DwjhvTpxmnad3ijJmToRBQM4qLFgJwBVb3gp+MY+tLln4oMZw4L59F1BxtsvhmNmoX8+PO1KXuHb/6Fluqjh6hrCKlkw/EkKFjJGteYbfe/V1CeogSMNdEV3MskB7J95ZuHY98QvsAa/xfrYSMwgvc9omM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713130001; c=relaxed/simple;
	bh=xZcTU+wAdpMeGGP4as+e3enar8Ktu5l1+VZyfz6OSTY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H9SQr5q0ocgIALnWHnFxslAdmfxT/Gek+IehU3B2/6tY79YZt8BmIZqgeCLJSB4ErwdZ0JiHn0pCdlF/3/x+RpL6IPbu8TrIU2KI0jG3tsAIVGfjiAoKXyIH1pu+xrUccBHok1hl/rrw9SGSGvLeQ+C7tDnmypdcwZ++0r5aeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=fAjBl4Y/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="fAjBl4Y/"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DCD622C04F7;
	Mon, 15 Apr 2024 09:26:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1713129988;
	bh=xZcTU+wAdpMeGGP4as+e3enar8Ktu5l1+VZyfz6OSTY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fAjBl4Y/NkglJA9Oq8NkFm9MQjp7k4zCiAu583GuZlavYYxYeqzKkBBYsy3p5f77P
	 MiO7eWzvtmObxFXJr+yG5WF3p6a+Hh2UP8A+A31EExWg+OkK9j/S/bzrl8ka8oNuR+
	 pFAvb5VRVLp3ODZdi0f5vPiAa0OH6B+q9BOsTb90Wp/x47zP+BIlN44HeZRqur2b9x
	 0lZwG69bNDwr3PdgMly5XPBwSKRUKgC/doUWpSJgBjOxx9wZtQQ7Kiv3lgcUSXSmAY
	 bcCIx5/YRBhy9Y92oWAZ8k8Z/KC2GIaMP0FOgUmYltnUHFG9Kg4OMVqhYKu/U+i3fJ
	 HCbjQYn3nHc8g==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B661c4a040000>; Mon, 15 Apr 2024 09:26:28 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Apr 2024 09:26:28 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.009; Mon, 15 Apr 2024 09:26:28 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "kernel
 test robot" <lkp@intel.com>
Subject: Re: [char-misc:char-misc-testing 5/20] drivers/uio/uio.c:446:
 warning: expecting prototype for uio_interrupt(). Prototype was for
 uio_interrupt_handler() instead
Thread-Topic: [char-misc:char-misc-testing 5/20] drivers/uio/uio.c:446:
 warning: expecting prototype for uio_interrupt(). Prototype was for
 uio_interrupt_handler() instead
Thread-Index: AQHajCG9L16iUNGMw06UQHlOSVwTubFivFkAgAC+HoCABAjtAA==
Date: Sun, 14 Apr 2024 21:26:28 +0000
Message-ID: <00cb4a79-b62c-46b0-bf0e-afec42205c2c@alliedtelesis.co.nz>
References: <202404112227.mIATKoTb-lkp@intel.com>
 <f3f2124e-31b2-4598-b2a6-44480afc33c3@alliedtelesis.co.nz>
 <2024041202-curve-frozen-7c4a@gregkh>
In-Reply-To: <2024041202-curve-frozen-7c4a@gregkh>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFB5502CBB365A46AB3F3C59EFC38230@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dY4j3mXe c=1 sm=1 tr=0 ts=661c4a04 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=VwQbUJbxAAAA:8 a=tjrs69tOkmSGJKXO0tsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxMi8wNC8yNCAxOTo0OSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBUaHUs
IEFwciAxMSwgMjAyNCBhdCAwODoyOTowMlBNICswMDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
Pj4gSGkgR3JlZywNCj4+DQo+PiBPbiAxMi8wNC8yNCAwMzowNCwga2VybmVsIHRlc3Qgcm9ib3Qg
d3JvdGU6DQo8c25pcD4NCj4+PiBBbGwgd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+
KToNCj4+Pg0KPj4+Pj4gZHJpdmVycy91aW8vdWlvLmM6NDQ2OiB3YXJuaW5nOiBleHBlY3Rpbmcg
cHJvdG90eXBlIGZvciB1aW9faW50ZXJydXB0KCkuIFByb3RvdHlwZSB3YXMgZm9yIHVpb19pbnRl
cnJ1cHRfaGFuZGxlcigpIGluc3RlYWQNCj4+IEkgY2FuIGRvIGEgcXVpY2sgZml4dXAgZm9yIHRo
YXQuIERvIHlvdSB3YW50IGl0IGFzIGEgdjMgb3IgYSBuZXcgcGF0Y2g/DQo+IEEgZml4IGZvciBv
biB0b3AgaXMgZmluZSwgbm8gbmVlZCB0byByZXNwaW4gdGhlIHdob2xlIHNlcmllcyBqdXN0IGZv
ciBhDQo+IGNvbW1lbnQgZml4LiAgVGhhdCB3YXkgeW91IGNhbiBwcm9wZXJseSBjcmVkaXQgdGhl
IGtlcm5lbCB0ZXN0IHJvYm90IGFzDQo+IHdlbGwuDQoNClNvcnJ5IGR1ZSB0byBteSBpbXBhdGll
bmNlIChhbmQgYmVjYXVzZSBJJ20gMTJocnMgb3V0IGZyb20gbW9zdCBvZiB0aGUgDQprZXJuZWwg
ZGV2ZWxvcGVycykgSSBkaWQgZW5kIHVwIHNlbmRpbmcgYSB2My4NCg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDI0MDQxMjA0NTUzNi4xOTA5ODk3LTMtY2hyaXMucGFja2hhbUBhbGxp
ZWR0ZWxlc2lzLmNvLm56Lw0KDQpJJ2xsIHNlbmQgYW5vdGhlciBwYXRjaCB3aXRoIHRoZSBjb21t
ZW50IGNoYW5nZXMgYW5kIGtlcm5lbCB0ZXN0IHJvYm90IA0KY3JlZGl0LiBZb3UgY2FuIGNob29z
ZSB0byBwaWNrIHRoYXQgdXAgb3Igc3dhcCBteSB2MiBmb3IgdGhlIHYzLg0KDQo+DQo+IHRoYW5r
cywNCj4NCj4gZ3JlZyBrLWg=
