Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F27156E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 18:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXFZFgEr"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b2e73a17a0so3100702b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Nov 2023 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699294504; x=1699899304; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tafTCuaDIZv8Kn/Yy+yywU6nsPqrGi5A1KlK8AgjacI=;
        b=nXFZFgErjH4kJY3sTLnx0l9qI12whnpZRocJKRpPlNaNN8aGkm7rxa7vYcL81mOha2
         ufR2DcChpQB/FMY9AFgbV+7ScaEcoG2E+jmzjHI1zFMzcnvna6IpAqRiQKKevjDLo0rp
         6UkqnnbbrEnpFqc2MYdACscmAZKG5g0czRukkvD21hmXDMfv8Qq8ZLymSPdO3uSFnsLr
         JGvTDX7CDZkK/BrHyxScXfq5hzEMiuPB52wFjDZLky9biwyXtUjIrUQZDD8xZqetMYHH
         hzsZ6/4VzebvfsUolfsGKUXpfwXOLkEtIrUfSF+A2G0wQ9SvZeN0U02bIOmMwAZR8XX5
         zy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699294504; x=1699899304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tafTCuaDIZv8Kn/Yy+yywU6nsPqrGi5A1KlK8AgjacI=;
        b=hBeFtDFy07PYJNEzkW0igBxcYx9K6pH941OBuaNikDNFmTf6lEk7BYRuPoikQkX/3z
         oV+Z6vEw5i6XjV5ZmbMh2m0bXtfLzmphc77Q9jmZr2uc43Wb5J670gjHyHPRs45DHEex
         FNCsc1qvfQqljE2RMkmV59WvXqYYRhW2FIdygkZsoj+KuS1PG340WXaRE38cljEvWtRN
         FBID/dx4JGitkGMeCGZFXs/npeIHfkwWOnT5i3UysYccqTIp3MHfcpGSMj7gq7DRe3oU
         N0CqcDzxmV9VuEgpLlbQsv/8X+IjfK3UB2oxGqdnEJOtIWo40EbUIDEG6XWgSWiGJsIQ
         wTzA==
X-Gm-Message-State: AOJu0YyjR2+IGT1DofP0ySxXayNv5nhar4TE2d0hIy9t8j1XCMZ0l8Eo
	0q8Bz8YZsCeFJjWc5x3NSvs6n9cw7hQr2u7teEheW3I6mmYskQ==
X-Google-Smtp-Source: AGHT+IEbNL69KgmGLe/DKKMcPk0NOJhXvqcrI8V+qSWT3aWG/7c42QsolIs3ozPRa9afveQtwIigOFd+7uk9hS8zhog=
X-Received: by 2002:a05:6830:1e87:b0:6c1:7927:6550 with SMTP id
 n7-20020a0568301e8700b006c179276550mr31678236otr.2.1699294057308; Mon, 06 Nov
 2023 10:07:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311051347.7J6bthD7-lkp@intel.com>
In-Reply-To: <202311051347.7J6bthD7-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Nov 2023 20:07:00 +0200
Message-ID: <CAHp75VcKj_zFNZTkipdJokzZWoWUk5M2RyWO-=49VbmUmt6-Pw@mail.gmail.com>
Subject: Re: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
To: kernel test robot <lkp@intel.com>, Peter Rosin <peda@axentia.se>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resend to all)

On Sun, Nov 5, 2023 at 7:03=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Chris,
>
> First bad commit (maybe !=3D root cause):

Indeed.

>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   aea6bf908d730b01bd264a8821159db9463c111c
> commit: e9e40543ad5b38b848879768359fd13650529961 spi: Add generic SPI mul=
tiplexer
> date:   3 years, 9 months ago
> config: i386-randconfig-004-20231101 (https://download.01.org/0day-ci/arc=
hive/20231105/202311051347.7J6bthD7-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231105/202311051347.7J6bthD7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311051347.7J6bthD7-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined but =
not used [-Wunused-const-variable=3D]
>      134 | static const struct of_device_id adg792a_of_match[] =3D {
>          |                                  ^~~~~~~~~~~~~~~~
>

I dunno why it's pointing out to that commit and some (random?) people
in Cc list, but the real problem there from day 1, i.e. (ab)using
of_match_ptr(). The of_match_ptr() should not ever be used. It appears
more harmful than useful.

Hence the proper fix is to drop of_match_ptr() in this file.


> vim +/adg792a_of_match +134 drivers/mux/adg792a.c

--=20
With Best Regards,
Andy Shevchenko
