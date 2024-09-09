Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCE1B5EB0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882351; cv=none; b=BVA9OPlCZ4G9ggUNc+jdtUOFaxzdNw4ZkTx44a/UuW9N2h3FNKTxuF4K+uz0j6H2bp5dHxgTVqMRFKNs3d6V74mHx0JczCsItMK7Vc6Nl4B3tRpt/yyS/ehDwEiggrhBYdmBYh5TORX5m+B25D8KWGQw4HyCWbl4VfT6snrbv0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882351; c=relaxed/simple;
	bh=XnU5oqdkva6JlXDEjEVyReSI87QguVXWZ6VnCHwOk0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhPQUiLxUbjeWwAyJTaMSe+0dEL2ozQGUgvdlZm+Quq/k6Zq9DqHaaxuggrLOfgkk7EV0NYzYB0MZDtAKBxHQyw9sGZeUpvy4Xy1AkPPy8/8TW6sQukk0KCbJV6ndrAmJrNUnw4M1NqrwEYvuiRKoN5nKIbsA43DU7m7HcDEzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ArARnP7X; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ArARnP7X"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86e9db75b9so545359966b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Sep 2024 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725882347; x=1726487147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnU5oqdkva6JlXDEjEVyReSI87QguVXWZ6VnCHwOk0Q=;
        b=ArARnP7Xy+PDB+RC4kmNPolkz9zU3GfIzg19EUVeYRKZMp8QM8EtSygWKv3LHxbSw2
         MwfdpOieaGhhbAkUvOcZyr6lpfdX3rLmAkLYevh7aodBm/hVW2nUvd1p3hMRwEjprTgK
         ST9jnsrd+lObHzvAezu3JCaOn3by2US0PA4sJ0bX/TOGrS0ph6+qSy2rcQSpLDlyRHwi
         8LaBM0zfP4U0DT0NEam46g9y5Sg9kJBWhx7VtF6+QGbupvz/jXgXBlUK+LObI5OCwksg
         o3/HS/y1o3YlasbjSzJcWjBvDXhjwC3xDRCS8V1WQc7nAc7DSfQ7Xnzj7G+t61CgHK96
         A2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882347; x=1726487147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnU5oqdkva6JlXDEjEVyReSI87QguVXWZ6VnCHwOk0Q=;
        b=ZS3ZIpTcjaH8bcLxJHSvV/ZLz3GGhlB7xSL2H4pNgbigVhDPtpCUj8u1plOYBKr/8g
         mVmVhj64Q0dJKjBFKC1ikJcTZwNs8huUeBUGbvnDzsUgFemDn7EQ1jSZgYtXHmGwC+lb
         AWUMWjyZctik05aVgKsUYKGe5X5nZ2uGq2h1EMnPfIVN+RHN1GadAP7Z30d2QgN76asA
         Y2DenHB7VU0YbPzkAsa6xnVhfUTv7Kp4L24uYdjKWJVYTH6girv7cOu+5eSDoYkHVUuK
         Tb+pJLuUBcbCowxVHc19gaK6gXMMVVLNaL1WC60Ts1DSSeqkqcdsmU08TNspfSfhkp9Y
         42gg==
X-Forwarded-Encrypted: i=1; AJvYcCW6W893tZqihl4JcYCnziIe4KEspCmWRYNm3nSGWVCUdcmlZJryepWOb50/6wWaExU523b4zqNjUSnhelAS@lists.linux.dev
X-Gm-Message-State: AOJu0YwsJ0Dc2BErV3rLjRzoCjeD3OW0dyIVqnADA7kuszwjNx5KxLHb
	GLMGWkt2sHoenipPK7ruMP+15gWLX9zC1wdsB7UmOavHEYkHFO4LQuAuJP+7uajLDuZlsuHY7nX
	L
X-Google-Smtp-Source: AGHT+IF9sTxIuBaRpoPL61TxnkmP8Dx/HI/SPewkxhF7tomJE/hxctaNQ5MCjtCSQzuNxgnZLZHgnA==
X-Received: by 2002:a17:907:6ea3:b0:a8d:29b7:ecfd with SMTP id a640c23a62f3a-a8d29b7ef71mr484389166b.54.1725882347134;
        Mon, 09 Sep 2024 04:45:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:d821:d81a:d0ad:70b8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d64880sm326216766b.219.2024.09.09.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:45:46 -0700 (PDT)
Date: Mon, 9 Sep 2024 13:45:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Chen Wang <unicornxw@gmail.com>, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <qcpqwvffln3cb5lxnhwarmeawiudurc4v35rqz7jo6xo2es5bi@2q4e4f4zn2vu>
References: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
 <202409080100.h6lX5Asm-lkp@intel.com>
 <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
 <MA0P287MB2822B10767514B3E04E8E468FE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hri66l74asgozqa"
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822B10767514B3E04E8E468FE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>


--4hri66l74asgozqa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Chen,

On Mon, Sep 09, 2024 at 05:08:41PM +0800, Chen Wang wrote:
> On 2024/9/9 16:45, Geert Uytterhoeven wrote:
> > On Mon, Sep 9, 2024 at 10:26=E2=80=AFAM Chen Wang <unicorn_wang@outlook=
=2Ecom> wrote:
> > > I wonder why CONFIG_PWM_SOPHGO_SG2042 is enabeld for m68k? Please rem=
ove
> > > this.
> > Because it depends on ARCH_SOPHGO || COMPILE_TEST.
> > So it can be enabled on all architectures when compile-testing.
> Thanks, it's really a potential defect when CONFIG_OF is not set, will fix
> this in next version.

BTW, the right approach to fix that is to not use of_match_ptr when
initializing pwm_sg2042_driver.driver.of_match_table.

Best regards
Uwe

--4hri66l74asgozqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbe3+YACgkQj4D7WH0S
/k5YAAf/ZNKh4xi7R1WSFPG/Wv0vzAzDccHjA9P4I1+bCKuQFR8gnOzEyDCfd6Mw
dz6nqq522U9d7SpAwlpdUfp3p/NTEoZHTz3jgSc99VVNSkNWdSVn3DJJ9vM9UnPn
RmAK5y9c9uvxy18E5icgMK8e5wQOgbnJwlilxiCnAavoLlgayhXbGemxdjXvLrjA
VDCXxjjE7AxENa3iGYOZ/PmeGohtXgnhEEaYGqqcS5m9WR0B4vgowVRofEl7THDi
PMv6kHAzGbZMAfZzdRxRwTZC5i3zXlPcS3asABsYaOtZOTYxiCShltzDqHmuGDP/
pVevymnhHrTE4Ec458orVY3Km/JA1Q==
=gCpB
-----END PGP SIGNATURE-----

--4hri66l74asgozqa--
