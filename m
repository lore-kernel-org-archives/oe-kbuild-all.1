Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43CB2591
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8jDh3TJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a0f49b31868so84266466b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 00:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701074672; x=1701679472; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryw139IsJD5rUs7/wQF0rwLMirP5Sgaw6bKRYfTe/yA=;
        b=M8jDh3TJrG4jsyqaLlZdLhq06TKHVfexi56KQNZgfZsYkLjsRAmVZHEF3rVqpdJcRk
         t/gcikgI+8W50oFCA3jk1tFc34CzRpfjT6cnp1YrzhazoIgg5EeVXjMOKF6BtJxAS4mQ
         NAQZE/7dCUHuX3SMLi/pRhg683kMGy/QWLa9bf8I29a/HLIYoARvU8N/zkJoDiV19ve9
         JvTBe47+SLkK54aKtxpd2S5IpXYBi3tAaaD/T9n+ogViw5nvAcRHAfhjHus5wrA96VcW
         Yap/G4rsm7GyzT6l5dlCDNiLK7DA55L1pAu2oDWOfr5guunY+N1XtW8mBzYd/ob5V/ye
         KIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701074672; x=1701679472;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ryw139IsJD5rUs7/wQF0rwLMirP5Sgaw6bKRYfTe/yA=;
        b=fpPILIQvBuMoF0fuFvPSZzt90BNRxgVuC4Y1qmbngkHJ3rNTViqC8NdmafiYPA0awp
         z2Hqh7rYncaBwag0/MPK/yiaIM+il9fyC0PNx73OE4KyXpx8BJs7REDMJZfIplvlKS9+
         +3iANbxkH/wrOiATFL1B5broMPJtzn7iszkg3M2kzTNLCVqUiYT7J4WuYsV+kGqSSvqX
         7gps1p0E0hqbj+aYdOVgtEKf7qgQnaAtiNWZYZeHHnzVRzDFyp6t73okZ8FUpbsnvSK1
         VfaFbdcxtvx9k9CmPc9ROUkwFVqb8b9O9nwlA+F7uyHBlsdhb3AW6aNdBBn0xMyFIbmG
         cznA==
X-Gm-Message-State: AOJu0YyMMOpHc5nTLIcojr3pIJIYcToP/MGEW/OptWWDXJANJ1jB4X72
	4buWnG8UD++CF67m3iz1s/4=
X-Google-Smtp-Source: AGHT+IHuqXI8TOxYld9vChZZAP7YKaEcWuQ7ETmVLdKwxFJhUpEdnEpOE7+ThFBXFjy++pE5f+wPUw==
X-Received: by 2002:a17:906:2209:b0:a02:9891:29ba with SMTP id s9-20020a170906220900b00a02989129bamr7306878ejs.15.1701074671934;
        Mon, 27 Nov 2023 00:44:31 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906348100b009de3641d538sm5429579ejb.134.2023.11.27.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:44:31 -0800 (PST)
Message-ID: <5a4182806724fa96eab92e7224d11aec7aa39e20.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot
 <lkp@intel.com>,  Nuno Sa via B4 Relay
 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Andy
 Shevchenko <andy@kernel.org>
Date: Mon, 27 Nov 2023 09:44:31 +0100
In-Reply-To: <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
	 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
	 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
	 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTExLTI3IGF0IDA5OjEyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIDI3LzExLzIwMjMgMDk6MTAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4g
PiBPbiAyNy8xMS8yMDIzIDA4OjUzLCBOdW5vIFPDoSB3cm90ZToKPiA+ID4gPiDCoMKgIDM1NcKg
wqAKPiA+ID4gPiDCoD4gMzU2wqDCoHVuc2lnbmVkIGxvbmcgbHRjNDI4Ml9yZWNhbGNfcmF0ZShz
dHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZwo+ID4gPiA+IHBhcmVudCkKPiA+ID4gPiDC
oMKgIDM1N8KgwqB7Cj4gPiA+ID4gwqDCoCAzNTjCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBs
dGM0MjgyX3N0YXRlICpzdCA9IGNvbnRhaW5lcl9vZihodywgc3RydWN0Cj4gPiA+ID4gbHRjNDI4
Ml9zdGF0ZSwKPiA+ID4gPiDCoMKgIDM1OcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjbGtfaHcpOwo+ID4gPiA+IMKgwqAgMzYwwqDCoMKgwqDCoMKgwqDCoMKgwqB1
MzIgY2xrZGl2Owo+ID4gPiA+IMKgwqAgMzYxwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+
ID4gPiA+IMKgwqAgMzYywqDCoAo+ID4gPiA+IMKgwqAgMzYzwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXQgPSByZWdtYXBfcmVhZChzdC0+bWFwLCBMVEM0MjgyX0NMS19ESVYsICZjbGtkaXYpOwo+ID4g
PiA+IMKgwqAgMzY0wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gPiA+IMKgwqAgMzY1
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+ID4gwqDC
oCAzNjbCoMKgCj4gPiA+ID4gwqDCoCAzNjfCoMKgwqDCoMKgwqDCoMKgwqDCoGNsa2RpdiA9IEZJ
RUxEX0dFVChMVEM0MjgyX0NMS09VVF9NQVNLLCBjbGtkaXYpOwo+ID4gPiA+IMKgwqAgMzY4wqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAoIWNsa2RpdikKPiA+ID4gPiDCoMKgIDM2OcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiA+IMKgwqAgMzcwwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoY2xrZGl2ID09IExUQzQyODJfQ0xLT1VUX0lOVCkKPiA+ID4gPiDC
oMKgIDM3McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBMVEM0Mjgy
X0NMS09VVF9TWVNURU07Cj4gPiA+ID4gwqDCoCAzNzLCoMKgCj4gPiA+ID4gwqDCoCAzNzPCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBMVEM0MjgyX0NMS09VVF9DTlY7Cj4gPiA+ID4gwqDCoCAz
NzTCoMKgfQo+ID4gPiA+IMKgwqAgMzc1wqDCoAo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gQXJnaGgs
IEkgZG8gbmVlZCB0byBzZWUgaWYgSSBjYW4gYWRkIHNvbWUgdGVzdCBicmFuY2ggb2YgbXkgb3du
IHRvIHRoZSB0ZXN0Cj4gPiA+IHJvYm90IDovLgo+ID4gPiBBbnl3YXlzLCB3aWxsIHdhaXQgZm9y
IHNvbWUgbW9yZSByZXZpZXdpbmcgYmVmb3JlIHNlbmRpbmcgdjMgdG8gYWRkcmVzcyB0aGlzLgo+
ID4gCj4gPiBJdCdzIGVhc3kgdG8gdGVzdCB5b3VyIHBhdGNoZXMgb24geW91ciBvd24gbWFjaGlu
ZXMuLi7CoCBKdXN0IGJ1aWxkIGZldwo+ID4gZGlmZmVyZW50IGNvbmZpZ3MuCj4gPiAKPiAKPiBX
YWl0LCB0aGlzIHdhcyBub3QgZXZlbiB1bnVzdWFsIHRlc3QsIGp1c3Qgc3RhbmRhcmQgY29tcGls
ZSwgd2hpY2ggbWVhbnMKPiB5b3UgZGlkIG5vdCBkbyBiYXNpYyB0ZXN0cyBvbiB5b3VyIGVuZC4g
WW91IG11c3QgYnVpbGQgeW91ciBuZXcgZHJpdmVyCj4gd2l0aCBXPTEsIHNtYXRjaCwgc3BhcnNl
IGFuZCBjb2NjaW5lbGxlIGJlZm9yZSBzZW5kaW5nIHVwc3RyZWFtLgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKPiAKCldlbGwsIEkgZG8gYWdyZWUgdGhhdCBhIHNwYXJzZSBidWlsZCB3
b3VsZCBlYXNpbHkgY2F1Z2h0IHRoaXMgYW5kIEknbSBtYWQgd2l0aCBteXNlbGYKYmVjYXVzZSB0
aGF0IG11Y2ggKHRvZ2V0aGVyIHdpdGggY2hlY2twYXRjaCkgSSB1c3VhbGx5IHJ1biAoSSBjb25m
ZXNzIHRoYXQgY29jY2luZWxsZQphbmQgc21hdGNoIGlzIHNvbWV0aGluZyB0aGF0IEkgZG9uJ3Qg
dXN1YWxseSBkby4gCgoieW91IGRpZCBub3QgZG8gYmFzaWMgdGVzdHMgb24geW91ciBlbmQiCgpI
b3dldmVyIEkgZG8gdGhpbmsgdGhpcyBpcyBhIGJpdCB1bmZhaXIuIEkgZGlkIGdvdCBhIGxvdCBv
ZiB0aGluZ3MgdG8gZG8gaW4gdjIgd2l0aAptYWpvciByZWZhY3RvcnMgb24gc29tZSBvZiB0aGUg
ZmVhdHVyZXMuIFNvICJiYXNpYyB0ZXN0IiB0byBtZSBpcyBhY3R1YWxseSBtYWtpbmcKc3VyZSB0
aGF0IGFsbCBvZiB0aGVzZSBjaGFuZ2VzIGRvbid0IGJyZWFrIHRoZSBkcml2ZXIgYW5kIHRoZSBk
ZXZpY2Ugc3RpbGwgd29ya3MgYXMKZXhwZWN0ZWQuCgpBbnl3YXlzLCBJIGRvbid0IHdhbnQgdG8g
ZmluZCBhbnkgZXhlY3VzZXMgYW5kIHN0YXJ0IGFuIGFyZ3VtZW50LiBXaWxsIHRyeSB0byBkbwpi
ZXR0ZXIgaW4gbmV4dCBpdGVyYXRpb25zLgoKLSBOdW5vIFPDoQo=

