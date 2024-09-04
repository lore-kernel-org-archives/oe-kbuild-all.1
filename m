Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47B1474B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436741; cv=none; b=Z8wokNs51+o6yk1Um3qeKooE8npU8zMvU4W2P7bABHE0koXXbNdNOg+iN4ONpwZHQ5HqRG5j1R7eIR37YSOEXOba9Pasng5MvczkRwCF2doASzfDnNHBNocxVEYWbQUzgwm4DeCxKROfGeCo+KPZOTV61z2vm92fggvD/fgIVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436741; c=relaxed/simple;
	bh=c2jAvJRISFmKTJLAivo6CZeVFTI+zZ70Yr/35SjCgB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuHn0zpqQp8r/ZZVgzQ4r1Z3UNNG9nUlcvtkIjFv2eo7JV1V47TeB3AMuT+VpHUnZdcOnPoNp4zlOifKkeTOXW1cBQYiQfynsw+21nLNic1lURuGJkorCcItBKDvcU96knapNcN8JSo8RkylRG9CYzehsoXXaExA09CzshWDY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WyuHmc3n; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WyuHmc3n"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so4061665a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Sep 2024 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725436738; x=1726041538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o38ll/1shPkcH2c9qDR658TMHisQqMl2xPlWoUMdupM=;
        b=WyuHmc3nOCTr1OazF1hu3c6LRbqy90864YgadX1Tdfce3w6zjc3tVnB8SwbkN7KTT1
         PMY4+x9wwjqvPi+GLPnyfJxBgYelp08Aa0JyPu4n9JsQvaPiYVhTpB1Gy6LVQmXlSupv
         bDTF+oAFsTVcOd4ruANfsOOwDXIEwB0tN0INBxctMJJQ2/G5b/T3E5Jkp4gxjI5h9yUd
         o7/hyGK7IMNGQ8UzV2h4At+8nQmjYkLDhLX4D7FEWCDEuWTG6k1X3SqRY4fALPZ17Gl2
         uxMBgT+o9QqC5Tu1Yz/xR503Namx4UjQb8nCOmbwPuQmM5zlbbu+9SLnMt0dPFvTX3BL
         mKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436738; x=1726041538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o38ll/1shPkcH2c9qDR658TMHisQqMl2xPlWoUMdupM=;
        b=plmfzuTM65TfYbnHqxfqymxJJNi7aHx9NMGb2OPdlLmK37jKntfN6ekG28BRxiijvn
         igCRNnJ1t9BwH8N4DfGRvGcfeXLk1/fGP+5c2cnEr6tYAcTIUeiAjtb2i7ktXdEqfZAs
         JzcQ0qwhj/EpFJIyC9CEiKb/HzhgLO3xSWSJvlFW78AE2rzfPSEzjhVn17vPDU+k8VEw
         He/so4AoOsEZkbZB3/ZHiyr0deLqYq+ICyGIljSE4RmV8FK8qo4osin5emqpw4htqq2W
         0o4O0Ow8dupx/ZsmZ+UybTlVYgNJQ0RyIt4m8g75BM4/HIikLTiZS58+3b/s77HH6nZY
         Wgvg==
X-Forwarded-Encrypted: i=1; AJvYcCXCoMxAR4mPBjBsqZneTV0MnMppBRBx7F55nQgSp7G8ZT65jIRd3uG+sLZGl1F/DbBt404lStIwtkJX9trf@lists.linux.dev
X-Gm-Message-State: AOJu0YyXgK78LDIwZahS3eeNaOE3258DXU4eTtJ5jBgKaWAWMPee74Wp
	JbM30cRw2i0RT2/IlqydDLiLeF2pTz4uzRQhamK9/00psFoqVlEFe1Jc9XKDX5s=
X-Google-Smtp-Source: AGHT+IHbXWBNh7i4cmQrik4TDTg1G8pCMakv2oa+Dk+9s51s/80FIoXVDzhEC95r4WGClTNuCsuPdA==
X-Received: by 2002:a17:907:97d1:b0:a86:bb5f:ebbd with SMTP id a640c23a62f3a-a8a32fe029cmr183723666b.63.1725436737475;
        Wed, 04 Sep 2024 00:58:57 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892232c7sm768623066b.222.2024.09.04.00.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:58:56 -0700 (PDT)
Date: Wed, 4 Sep 2024 09:58:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: kernel test robot <lkp@intel.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Lechner <dlechner@baylibre.com>, oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: ad7625: add driver
Message-ID: <mgsig2v65adwgfhofxk3snfbtibgjfeiqqj4iw5r2aquak22ve@3ssolag3ousl>
References: <20240819-ad7625_r1-v3-2-75d5217c76b5@baylibre.com>
 <202408201520.lFtco3eF-lkp@intel.com>
 <7658aca4-a408-480c-98b6-4637bb86b5ad@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yytpvatfhmknuuz"
Content-Disposition: inline
In-Reply-To: <7658aca4-a408-480c-98b6-4637bb86b5ad@baylibre.com>


--3yytpvatfhmknuuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trevor,

On Tue, Aug 20, 2024 at 05:07:27PM -0400, Trevor Gamblin wrote:
> On 2024-08-20 3:19 a.m., kernel test robot wrote:
> > Hi Trevor,
> >=20
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on ac6a258892793f0a255fe7084ec2b612131c67fc]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Trevor-Gamblin/d=
t-bindings-iio-adc-add-AD762x-AD796x-ADCs/20240819-221425
> > base:   ac6a258892793f0a255fe7084ec2b612131c67fc
> > patch link:    https://lore.kernel.org/r/20240819-ad7625_r1-v3-2-75d521=
7c76b5%40baylibre.com
> > patch subject: [PATCH v3 2/3] iio: adc: ad7625: add driver
> > config: alpha-randconfig-r132-20240820 (https://download.01.org/0day-ci=
/archive/20240820/202408201520.lFtco3eF-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 13.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20240820/2024082015=
20.lFtco3eF-lkp@intel.com/reproduce)
> Seems to be a problem with missing static inline definitions in pwm.h if
> CONFIG_PWM isn't set. I've replied to the relevant series on the PWM mail=
ing
> list and will add "select PWM" to Kconfig for this driver.

I'm not a big fan of the dummy static inlines. It seems to be a somewhat
subjective thing, but I think that usually if a driver makes use of PWM
functions it doesn't work at all if CONFIG_PWM=3Dn. Does your driver work
with CONFIG_PWM=3Dn? If not, even if the dummy inline was there, I'd
recommend at least a

	depends on PWM || COMPILE_TEST

=2E (This is also the implicit recommendation to use "depends" and not
"select". Currently all drivers needing PWM use "depends" and mixing
yields strange effects in menuconfig.)

Currently there is only a single driver that uses "depends on PWM ||
COMPILE_TEST" (i.e. SENSORS_PWM_FAN). I already considered changing that
to plain "depends on PWM" and get rid of the dummy defines. While I
didn't tackle that one yet, I'd like to not introduce dummys for the new
waveform functions. So I suggest you either stick to

	depends on PWM

or try to convince me that these dummys are a good idea (and then
probably use "... || COMPILE_TEST").

Best regards
Uwe

--3yytpvatfhmknuuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbYEzwACgkQj4D7WH0S
/k5SvQf+NO8vcbtNzPEQ93q8b0bUlyJ0RMbzu+c2gvXGTNCZfFrxMknBXCxauxnk
NsFS69G2JzB3Q/LG/Lny6rguZd9gkvYDBVKSjid2wdf4Kekr/2cKXSbAkPaFVQHu
QQndCDqL6XKMpug1f5f3ehcxFnL7LVw5ZMSWMqO19bzpYGa6zgEH1JJVTmpVPDa5
ZoOJoTb3njfPDLqGjBgdaZVaI0dAgwkP7Nf8DUbzXKqdZEl7d50T8c2LoJOEpZ1I
NP/Jl0xMi8oWc3KtVuLvslL87nmXyRsW8bGdDFOlg+i7tYO3bJlBO4zoJ+2Nm0tx
pSJaiqTBJkyu0HmnLg2VtkcQBqwZzA==
=Ps67
-----END PGP SIGNATURE-----

--3yytpvatfhmknuuz--
