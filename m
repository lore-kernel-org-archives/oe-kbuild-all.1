Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254881;
	b=4wUKaOHJmKaRF+rCSGlyve1fS9ciRUKfj1DaAcrUPMiqCQAsGYixZ8gubnwUrsD4OfaA
	 xKlfwkcB7RQiocb5WH+5mLwkfHuJ2XwtaSJhhslGr+puhEnmqkz3hCSmi0AGV31dVIrLs
	 Kh+8vGR7T3nKWNC2bXl732TAHFbYfD/cc8LARBRTNdJV/DDX0KcA9dcVi+gILTZcljRi8
	 eVLkGjV+FMh2QLWaRepKujCb1P2V7VGDXgfHmnC5kjnzPel1TVj0xs8YF7nEy6RE27+pD
	 qdR0A+fk5VxpMkxxrgW5E3ppM9mPzRNUUyqne4FaeIzefrXOvIWZH58GQYvl+bVLukg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
	b=b88DyL0AVKiRllBc721KRHxzuKqVdapoA7s4ix2gmuzNdBnDUgdvmjqYASGjeOuHWEeY
	 fAYjGwGbBv0RQUYtyWqyZepeX5qY4LnGWkwcEf9QtM4xbr/9tsmbVAHH5F05Lr0uRxrCE
	 SHS5UnQQqJQRGd31iTYdlN8WJOf7zARC/u+I0DWfGEDDx/241EWYX6/7lUg5MunN0cjsh
	 8ilsh+RFpZsAhmnUoJAl/Ds2hv9Fwb8hKMvyPoYhZGnbwoJbCqoSAamc/1Bi/zLJaD80e
	 pj31zUUGcVzDLXiiDmWKN9EDtXn4WH+10ZUKZj9lD2+DTN+Gm6o00oqvHPnrMYZSlMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9lzOFfV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A7606A325
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 20:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5A7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9lzOFfV
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2526408eec.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Nov 2026 12:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254880; cv=none;
        d=google.com; s=arc-20260327;
        b=sZzcm7dCwPhpYPxGFtYL2Vm8Fg757P5IEZwy/N4kTn2t1u8Y9KwI/w4pXj6LUd1MFL
         UwUUFI0g9KuiSbNtmIAYPMNuwA2sohNXC+gYphsCGTh3lZm0NHNj6D9pvUC+IoY75vsH
         MAPJwg3M39R8j4ODiXfJM4/B6EAhrQpUYCJPrdoOZoIA6DXVbO4PlAyhJ0DT9nBqJuzQ
         8ejSOSGFVlx5+Ty4z1zbNXW+HdqAq9s9K/0zhkHsC11dpNtYWTp8PUkgfxYRw1Rl53FE
         lbykGJYT6xbeZ1ZN0kC2wP4mjY01HmnRUkpmamCmKnJnClCXhZOpl4MvKMduqGWS5ogc
         bpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        fh=/pM+LrZ/ax6CmavRBCf83cV76lFVlD5+ECYNjR9LyAM=;
        b=q9GbcHgO+9uNJoFZVBcNsnncsNU+vP5DJxOdQreE4l0C1SASi94+Q7tucaqLdusSpk
         XKfPUd+tw2J8R1cCsLTTTire3vDv8fBiaccgDoJe462QvigWsgnDoMn9HsosABpkFiIb
         piLUTWss+m0xxrFcdqOJA/bllAxOxvVtCnLgbi2PqA/SFdbu6L5tiNoLo1G63Sdm54oy
         zDq2zAEfNBxDuZWVhpQJePE1e6nHIKVt4Z91W7hvDNZefpOvz0fjjNy/OFJi2cNptJ8Q
         H0CUaiio5C4nKNEGaLVW8JUVCz90Cu7EnC8WbM6sDKWpgBLlIuO5pWpjeh6azBeB2YN6
         iHiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254880; x=1794859680; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        b=j9lzOFfVaKwRfzXUQaNXy0PO0HUJqb28QlscX2HY1eTKzskqCfqoECJPFfzLSVAjyT
         FGWrsVHUt2iOQNrQmPVpLQHZAhUnEulVAMD11iaHPo0RG7O1lwj+nYmF4Qbnvn5aeSgl
         SiWEFGGtG5AXR13peT6/OLmZVPbAGNQhEPbLg5R6Wp8mrGL90eVu8BTHjwu+zQt52rd+
         rGALNgWDUfFCZCOSogdGTnfdX/UWHv2FHILqHbW+Uj8qFIKGFVR7Aeds+u55yt/VNayW
         VHYqlkI3eS5AXvaYpHDjpUN5eSjmPHt+2+PjiO70nEMSovXnShgzo4wp0L6i16T9PMa9
         nJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254880; x=1794859680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        b=rY6XwdA8uC/iGKBhBo2/tzvMTk/EsYLJ6sBcHdn2fkdXyS5PICe2lLgjyTXRGBh9c/
         f7JJ3pkLl4weaLCT3QgvjNN987Wv+olPbHIxAxaPMyEcONeV5nLaHF132aPqXY2po9iY
         EBEmECz/Kro1BeHYC1hKUrz7O4S6J9/b2ZbBPuP3n1F2terRb4fOzn1Ic3HkkSPV2FQB
         Az3D+okjYqeyIPquI8HZSl7OXU7w/nGH5wkP7yPzbIW8JrUAsF4455/Tz2Vu/jb2BZE9
         1/BWUAv953NvLRgvoHo1gARVvk9rqt8GAghy/2Ic1wpvpYCVwXSRgLnGYoctyCS9cTGg
         ifTA==
X-Forwarded-Encrypted: i=1; AL+hErELs9ygJlvILOnd1/B14j6NOyrmuHd2S2lK57eauo2/86KCi+YVq+X39PuRdhaxTrS5b2VvS0ONOucJxj8B@lists.linux.dev
X-Gm-Message-State: APuU4Z9NWB75TPr0NA1qsdeKXFvs9O80rtOt4aNQXZrCRu77o4l6aI83
	w+BzYYPpJ49Hc0rsYYAJBaYjbJIrpKy62yauek+wB2PNAnbf/pMlC7R1B40Lo8oDbQHoA3Utwjb
	5d019JhUch1/KmefUxnWzVYmZTAdu0l0=
X-Gm-Gg: AYBFou0gYuis6hEymxOAlMV81MIXjFuP453Cc3y/sVzH4PONCAjYmz/klBePwzzZYx3
	Jut4M1XEuUO7sgFEJkuGAeqhfeqSZTf+OqSZS1Ey0A1hbrLF6Ll/54p/fGDbr5yX+bertRoO66I
	KtczoKzh+sq4BBQk5EqVuAmFLNnKEfngNl/QZoEUfihuDV/AHD0AFKrZZ8AH868IWM7BXDw6NwU
	8W/h42bM1sXmbBra0ZOAg3hlTkBusK2mMxcYL3KIRwB1wVb0eTnA0oKEqJBJXfmmHoK1DBM/XBH
	qzFjhUvfEG5bZ+IhEBv6flzzvMIgiF3jM5hTZ94YKbViCOYBYXKmlYOjYnGMPgZewFgC96ws27h
	27PGvB+7G+FWN1EVvvKu3Y58vstVi6+e2KComO2c2KCnbHznD8nKa9swyYmiCi0SjvizNg2Lw+E
	TZf+VJ3j7AbyAU0rzTPuwIbdKW2nyBgdFmFpBZARzmC+h0tru3nq8=
X-Received: by 2002:a05:693c:639b:20b0:369:ef92:bd7b with SMTP id
 5a478bee46e88-3752021a4b3mr405313eec.41.1794254879591; Mon, 09 Nov 2026
 12:07:59 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108094253.83899-5-clamor95@gmail.com> <202611090518.mm6yt2nO-lkp@intel.com>
 <avInQ08dVrsc-Rbo@ashevche-desk.local>
In-Reply-To: <avInQ08dVrsc-Rbo@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 22:07:47 +0200
X-Gm-Features: AclHuK-uW4-VZbHI3Cd7Hqy4mW6DNnwVcXugR9i4sn8vPx7NjzrQMM_Kf1jGWpY
Message-ID: <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kernel test robot <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, 
	oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:04=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 09, 2026 at 05:48:09AM +0800, kernel test robot wrote:
> >
> > kernel test robot noticed the following build errors:
>
> ...
>
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: trace_initcal=
l_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: .i=
nit.data)
> > WARNING: modpost: vmlinux: section mismatch in reference: __arch_xprod_=
64+0xac (section: .text.unlikely) -> initcall_level_names (section: .init.d=
ata)
> > >> ERROR: modpost: drivers/iio/light/ltr501.ko: symbol 'iio_find_channe=
l_from_si' undefined!
>
> Forgot to import namespace?
>

It is not exported in the core

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/iio/industrialio-core.c?h=3Dnext-20261109#n319

> --
> With Best Regards,
> Andy Shevchenko
>
>
