Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9321BD9DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731498378; cv=none; b=RP9b+PTJ9fIrSLURWscdcJCZDFWw5/Uad6GtspRgjXSeETJzNU9GiuLtMad/GgV3Etzq0EC+V0b8n5+BuJ1E97+zdoeXCZd9ZB4biMvx5badMIbFnFz3Ma57vV5hlqIhTKV5f1lkxAdIr5hqKQaI40P16pbHy3xs7K2z33IkiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731498378; c=relaxed/simple;
	bh=cu4/gamufvrLqKVtrGDBoSBaM4M/bqIYdzIUoW5Rhds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDAc3JE69BdyRm4wfld47ymDwgxOsHbXBFbWNlnhWy6MsTrCrp4RRcIlBArKiXNg9vWBQ6QAqAcDEKaZh4vNNK6pBF/Hc7B8cXBVtiP31B2wBcdgLhqrwz4i91d5AxJzpNPH9p/8SFaxAEFdK7an0qqsX1GvQ96+THPmPiNGpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Bogj4877; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Bogj4877"
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 405733F336
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1731498367;
	bh=jy2Kqg0W8TFdjCYaiKruDdoCLBuD2YnSpFG/AdKZUNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Bogj4877loJAXGAJrOqn+fUOCVfMPYQqLAOnXpTYNRIIKHAWim66O/Lo00bA2Jzvv
	 rv8SzOCvs9AEYx4Cv04ZKfhFpeRvQhqMktMIKauxLx1Lo9oQlJC+j4spyaHyrG/2k/
	 aCCu4LDyJuZZdADkSwKs8X2tX5j2buhEjWH8xnzKKNe2dIFHi4F2YD3rJzPrBoxPdH
	 8CDashXEMp8WROweMDLaTmv4sq/0HlpEx2hiEkHeRSrw/1urxHdbxEh44ILflHHcpz
	 tBA2SleFHKvFya3vU4XiK7BqWCkQVmbbTGbzSukYFBdpyvu8FYjU4PLoCbwt7k+NX/
	 Cwlj4h2KaulfA==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2886446d741so541158fac.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 03:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731498364; x=1732103164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy2Kqg0W8TFdjCYaiKruDdoCLBuD2YnSpFG/AdKZUNk=;
        b=PuCwqFw+CkuaplgNUqKjO2Nhm3K/J7izydpQ2pe4fiGBnnPrt3UH5qHZZYzmz47z/y
         eCBxwsCaIXt9ARlPt9OHnfgWBFtY7hYcbx+KONIVT6IhrxTBQk6QtYbp/DKvJhAivSwr
         6Ba+9AMXNW9V/Vb+xS6U9Emi8majs0g1Xe8DgVnIk+w+R8ywp84UPbVZUJ0yUovDZv88
         qxfpjSf3evQ1+shgPVVQgsXCjjP6vIxXJq+u2KDjHrJk9WMiDCpZyYKj0kEccn+rpgJt
         336QYhrvJo9uAFssT8LqGTGvISKsUhUt0dNORxlTGqCaEFsWVblJEIzg8lJwUj5pxmU9
         61Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUUED6W09ccDnwe8vJPOmyIXodE4O2A7YjJmdWN2fWuKRoMiseniyudMzHdCi2Ig1b2hhcSy8Lo3o+P4/z2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3iZElU7VJYSd8AvcqXl/8Ru6vr1AupE4+LhePQZid7rSVvNXw
	x1OVyx7dlyvKDxug+seMb4u+vuWz82Uf/Kxdl6+UcvcXdWi/8c5MM3NMyl10iEfqVRRTtne6JJO
	tdBAV1pnIhwHcaO6Yp3IwvBNwFeceigUjs8nqzsI//R9FRlE+TW5D/bbBifdB6Jp1T+ns4W6hJz
	/wa1B7UpfHM6BhMEoQIJggNMqP8PmZWjfhezyA3hXa4fTctf2P5N/txw==
X-Received: by 2002:a05:6870:3051:b0:28c:84b5:6d5 with SMTP id 586e51a60fabf-2955c504d22mr11277856fac.15.1731498364164;
        Wed, 13 Nov 2024 03:46:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjXCmHz6/9KpklKmR/tOHSDRqEQSPJRalVnZoD3mi1pqz97LJMXH9ODqPrsBlVVYHca8cA1BqG7IZKNEYdgdU=
X-Received: by 2002:a05:6870:3051:b0:28c:84b5:6d5 with SMTP id
 586e51a60fabf-2955c504d22mr11277844fac.15.1731498363828; Wed, 13 Nov 2024
 03:46:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411131732.BNe0iugn-lkp@intel.com> <CACRpkdaQPqY+H0OxLjzOVDHSNS4TTi4weDDvLGs6OymVpjPNZA@mail.gmail.com>
 <CAJM55Z9N77gkuZdh3gFqhL5-NbOMmEYo8vkZeesmy0iBK1EkDA@mail.gmail.com> <ZzSAw2+kSnM26c3N@rli9-mobl>
In-Reply-To: <ZzSAw2+kSnM26c3N@rli9-mobl>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 13 Nov 2024 12:45:36 +0100
Message-ID: <CAJM55Z9QSxom_AAzwZ=_7y0fkeYzBbYrY08z3NhFfbj1QEY2GQ@mail.gmail.com>
Subject: Re: [esmil:th1520 2/48] drivers/pinctrl/pinctrl-th1520.c:457:9:
 error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99
 and later do not support implicit function declarations
To: Philip Li <philip.li@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, Drew Fustini <dfustini@tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Nov 2024 at 11:35, Philip Li <philip.li@intel.com> wrote:
>
> On Wed, Nov 13, 2024 at 10:59:43AM +0100, Emil Renner Berthing wrote:
> > On Wed, 13 Nov 2024 at 10:58, Linus Walleij <linus.walleij@linaro.org> =
wrote:
> > >
> > > This randconfig is for Hexagon which is a bit insane to begin with bu=
t OK.
> > >
> > > On Wed, Nov 13, 2024 at 10:28=E2=80=AFAM kernel test robot <lkp@intel=
.com> wrote:
> > >
> > > > >> drivers/pinctrl/pinctrl-th1520.c:457:9: error: call to undeclare=
d function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not supp=
ort implicit function declarations [-Wimplicit-function-declaration]
> > > >      457 |                 ret =3D pinconf_generic_parse_dt_config(=
child, pctldev, &configs, &nconfigs);
> > > >          |                       ^
> > >
> > > This is because in this config:
> > > # CONFIG_OF is not set
> > >
> > > But HOW is that even possible? The Kconfig fragment for TH1520 reads:
> > >
> > > config PINCTRL_TH1520
> > >     tristate "Pinctrl driver for the T-Head TH1520 SoC"
> > >     depends on ARCH_THEAD || COMPILE_TEST
> > >     depends on OF
> > >     select GENERIC_PINMUX_FUNCTIONS
> > >     select GENERIC_PINCONF
> > >     select PINMUX
> > >
> > > depends on OF!
> >
> > Hi Linus,
> >
> > Sorry about this. This report is against my personal th1520 branch on
> > github and I forgot to pull in those fixes from upstream.
>
> Sorry about this, which is related to how the bot configures the mail,
> that by default, it sends mail to all related members of the commit.
>
> Hi Emil, is it ok to allow bot configuring this repo as private which
> will then only send report to you?

Yes, please. This repo is not listed in the MAINTAINERS file anyway,
so private was probably the right configuration to begin with.

/Emil
