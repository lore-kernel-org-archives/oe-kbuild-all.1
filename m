Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A329416
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 20:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712867351; cv=none; b=dm8TRHgvxwFwdg45E9PsBUuF9FAh0lBHCJzdfBbcnJUWJ4YDK8vGxyTo2r4xJV524pQM3S6G5R8lCpInu64zg80gbZRqjLuYgs11xarX3zZrLM+Mjh5/dpOKwM+qPHX4DUGycRpxm8iuRdC0rpSc7ukhB6uLxRrD0RWAf267r7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712867351; c=relaxed/simple;
	bh=DMrqrQI2NjmjAwUZ2I5H3Ca73lRjOtEgiyTroHb2v6A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MwF83j9XpInCqp4doAWK/RnmT0r/xeveUd3UFjKOa2R9XvYz2PFrlK8qh4J59/u1UWyGpktfXZ9U/tJWrNgPmwIcGgh3DvRExu2jM4qc5xUoaG9Fuv2z9hCGl06etzdmnKCWhAdXv6bRuooN8nEtf7W1onkGMMnXffMUsE9q6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=1izhEscd; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="1izhEscd"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3C03F2C01D7;
	Fri, 12 Apr 2024 08:29:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1712867343;
	bh=DMrqrQI2NjmjAwUZ2I5H3Ca73lRjOtEgiyTroHb2v6A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=1izhEscdX5oyszzieqI8uefd8eBNtOafZDqGqJ4mEnEYXS2ksl6FDtfF0kvocdgcz
	 fIwaMZ0vpQ7LDE6QA5P8hvt5nCq2FIg2XS/KRoTerMtd8z2lhiyPNC9hwwSwDzDEl5
	 z2e5f62hPpDN9rBkPf1XOuBzwrEsMG8yjEL7pp4M0j4BC+sBjSM54O7i75JVmvoyTr
	 f3Dxx86kDRHIviqKL97zEG1pvIBaFYjSaZ3MF2OcGj6O8phfrmuDtH4KI8FII5DGAb
	 qcHTgkRy/q5oV+IL1jf/J99vNcUHtwL8NOvzgleHNPHmPWUIfBgRdlirPC1uYd15Mo
	 6eXsW27P5Tsdg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6618480f0000>; Fri, 12 Apr 2024 08:29:03 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Fri, 12 Apr 2024 08:29:02 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Fri, 12 Apr 2024 08:29:02 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.009; Fri, 12 Apr 2024 08:29:02 +1200
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
Thread-Index: AQHajCG9L16iUNGMw06UQHlOSVwTubFivFkA
Date: Thu, 11 Apr 2024 20:29:02 +0000
Message-ID: <f3f2124e-31b2-4598-b2a6-44480afc33c3@alliedtelesis.co.nz>
References: <202404112227.mIATKoTb-lkp@intel.com>
In-Reply-To: <202404112227.mIATKoTb-lkp@intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FB14F4B177F794B9FFA396A510E7D54@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dY4j3mXe c=1 sm=1 tr=0 ts=6618480f a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=CDD9DHtbrccDSp1lZM4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-SEG-SpamProfiler-Score: 0

SGkgR3JlZywNCg0KT24gMTIvMDQvMjQgMDM6MDQsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0K
PiB0cmVlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2dyZWdraC9jaGFyLW1pc2MuZ2l0IGNoYXItbWlzYy10ZXN0aW5nDQo+IGhlYWQ6ICAgZGM4MDZi
ZDQ4YWJjMWI4YTRhZTcyNzA5YTM3ZTY1ZGI0MmEzMjA0OA0KPiBjb21taXQ6IGY4YTI3ZGZhNGI4
MmQ0NDJhZjFjMDY0NWE1YWNjNzBjYzk3YzY3ZjYgWzUvMjBdIHVpbzogdXNlIHRocmVhZGVkIGlu
dGVycnVwdHMNCj4gY29uZmlnOiBzaC1kZWZjb25maWcgKGh0dHBzOi8vZG93bmxvYWQuMDEub3Jn
LzBkYXktY2kvYXJjaGl2ZS8yMDI0MDQxMS8yMDI0MDQxMTIyMjcubUlBVEtvVGItbGtwQGludGVs
LmNvbS9jb25maWcpDQo+IGNvbXBpbGVyOiBzaDQtbGludXgtZ2NjIChHQ0MpIDEzLjIuMA0KPiBy
ZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcv
MGRheS1jaS9hcmNoaXZlLzIwMjQwNDExLzIwMjQwNDExMjIyNy5tSUFUS29UYi1sa3BAaW50ZWwu
Y29tL3JlcHJvZHVjZSkNCj4NCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBw
YXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZg0KPiB0aGUgc2FtZSBw
YXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+IHwgUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiB8IENsb3NlczogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MDQxMTIyMjcubUlBVEtvVGItbGtwQGlu
dGVsLmNvbS8NCj4NCj4gQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+
DQo+Pj4gZHJpdmVycy91aW8vdWlvLmM6NDQ2OiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBl
IGZvciB1aW9faW50ZXJydXB0KCkuIFByb3RvdHlwZSB3YXMgZm9yIHVpb19pbnRlcnJ1cHRfaGFu
ZGxlcigpIGluc3RlYWQNCg0KSSBjYW4gZG8gYSBxdWljayBmaXh1cCBmb3IgdGhhdC4gRG8geW91
IHdhbnQgaXQgYXMgYSB2MyBvciBhIG5ldyBwYXRjaD8NCg0KPg0KPiB2aW0gKzQ0NiBkcml2ZXJz
L3Vpby91aW8uYw0KPg0KPiBiZWFmYzU0YzRlMmZiYSBIYW5zIEouIEtvY2ggIDIwMDYtMTItMDcg
IDQzOQ0KPiBiZWFmYzU0YzRlMmZiYSBIYW5zIEouIEtvY2ggIDIwMDYtMTItMDcgIDQ0MCAgLyoq
DQo+IGJlYWZjNTRjNGUyZmJhIEhhbnMgSi4gS29jaCAgMjAwNi0xMi0wNyAgNDQxICAgKiB1aW9f
aW50ZXJydXB0IC0gaGFyZHdhcmUgaW50ZXJydXB0IGhhbmRsZXINCj4gYmVhZmM1NGM0ZTJmYmEg
SGFucyBKLiBLb2NoICAyMDA2LTEyLTA3ICA0NDIgICAqIEBpcnE6IElSUSBudW1iZXIsIGNhbiBi
ZSBVSU9fSVJRX0NZQ0xJQyBmb3IgY3ljbGljIHRpbWVyDQo+IGJlYWZjNTRjNGUyZmJhIEhhbnMg
Si4gS29jaCAgMjAwNi0xMi0wNyAgNDQzICAgKiBAZGV2X2lkOiBQb2ludGVyIHRvIHRoZSBkZXZp
Y2VzIHVpb19kZXZpY2Ugc3RydWN0dXJlDQo+IGJlYWZjNTRjNGUyZmJhIEhhbnMgSi4gS29jaCAg
MjAwNi0xMi0wNyAgNDQ0ICAgKi8NCj4gZjhhMjdkZmE0YjgyZDQgQ2hyaXMgUGFja2hhbSAyMDI0
LTA0LTA5ICA0NDUgIHN0YXRpYyBpcnFyZXR1cm5fdCB1aW9faW50ZXJydXB0X2hhbmRsZXIoaW50
IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiBiZWFmYzU0YzRlMmZiYSBIYW5zIEouIEtvY2ggIDIwMDYt
MTItMDcgQDQ0NiAgew0KPiBiZWFmYzU0YzRlMmZiYSBIYW5zIEouIEtvY2ggIDIwMDYtMTItMDcg
IDQ0NyAgCXN0cnVjdCB1aW9fZGV2aWNlICppZGV2ID0gKHN0cnVjdCB1aW9fZGV2aWNlICopZGV2
X2lkOw0KPiA1N2M1ZjRkZjBhNWEwZSBYaXVibyBMaSAgICAgIDIwMTgtMDctMDYgIDQ0OCAgCWly
cXJldHVybl90IHJldDsNCj4gYmVhZmM1NGM0ZTJmYmEgSGFucyBKLiBLb2NoICAyMDA2LTEyLTA3
ICA0NDkNCj4gNTdjNWY0ZGYwYTVhMGUgWGl1Ym8gTGkgICAgICAyMDE4LTA3LTA2ICA0NTAgIAly
ZXQgPSBpZGV2LT5pbmZvLT5oYW5kbGVyKGlycSwgaWRldi0+aW5mbyk7DQo+IGJlYWZjNTRjNGUy
ZmJhIEhhbnMgSi4gS29jaCAgMjAwNi0xMi0wNyAgNDUxICAJaWYgKHJldCA9PSBJUlFfSEFORExF
RCkNCj4gZjhhMjdkZmE0YjgyZDQgQ2hyaXMgUGFja2hhbSAyMDI0LTA0LTA5ICA0NTIgIAkJcmV0
ID0gSVJRX1dBS0VfVEhSRUFEOw0KPiBiZWFmYzU0YzRlMmZiYSBIYW5zIEouIEtvY2ggIDIwMDYt
MTItMDcgIDQ1Mw0KPiBiZWFmYzU0YzRlMmZiYSBIYW5zIEouIEtvY2ggIDIwMDYtMTItMDcgIDQ1
NCAgCXJldHVybiByZXQ7DQo+IGJlYWZjNTRjNGUyZmJhIEhhbnMgSi4gS29jaCAgMjAwNi0xMi0w
NyAgNDU1ICB9DQo+IGJlYWZjNTRjNGUyZmJhIEhhbnMgSi4gS29jaCAgMjAwNi0xMi0wNyAgNDU2
DQo+DQo+IDo6Ojo6OiBUaGUgY29kZSBhdCBsaW5lIDQ0NiB3YXMgZmlyc3QgaW50cm9kdWNlZCBi
eSBjb21taXQNCj4gOjo6Ojo6IGJlYWZjNTRjNGUyZmJhMjRlMWNhNDVjZGI3Zjc5ZDlhYTgzZTNk
YjEgVUlPOiBBZGQgdGhlIFVzZXIgSU8gY29yZSBjb2RlDQo+DQo+IDo6Ojo6OiBUTzogSGFucyBK
LiBLb2NoIDxoamtAbGludXRyb25peC5kZT4NCj4gOjo6Ojo6IENDOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBzdXNlLmRlPg0KPg==
