Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D1415B984
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735394118; cv=none; b=k2M1lALB8SfHW489DHsEfs5HyfCI5PAFMUmbwz5ZWz35nCAjZkH4KTBXlJKijo8MGE93seIFjGPSDoJGV6eMfwqa2Cecr1C+mSy1dMu+/yCg1z1DGxBrbUUVF367QxVqbmanOGrf9HeaITuJQf+qqasWpAzNt90h4zOq8pNEuYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735394118; c=relaxed/simple;
	bh=N2Y0tdP2ya5cC2WUSKApfz754N+JS5n0MEifSr0gup4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HooLp0fM7s9x40FwTK5qMRTRFQ5TZjUukQrkfwuXLu8/VbyoC/11djzjS6OMDO+zOoxVSb5t6AvZ1Tk4RTECf4BqASjrctqcrsf78/eFxLv+arVmESw6KqONKNJAMrgWNvXhRK0JOw4x4vyyRba4GE8XZWr3F4nFK5VRhC3aWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afe99e5229so2190153137.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 05:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735394115; x=1735998915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ulB3Yf+fkH5MLC4jt3SEiT76TCvud6P3XUQaFnmoGs=;
        b=BuS7FAKXeQHyf+JWMAYWNlGGJyWVWQt3j5g5sY9PpDEnLQTca1iIMxgWFRxwEGEzsw
         LKi+mW0GYh2JjLWK1SLC1mHaMdJYWd3iEUYKnWHgou5lgJIn1nhf9M2GA8zat0tf8EDS
         5vRwOifqxIkrrft3yfAATX5ymNJwVLyuhL05zsHBXFIgJX+mWY3NeSI5OfJpqe6UA0Zd
         0p8aObrN+QxLuCKhRWoAwr8if05mTRbom1bUrS2jQFx1tYJClCInrnWZESSaXVCU8tF1
         XXGDjGdPMWcZRjR3SxRUgcmRxrr4jGZYxstqfxK8qrUzuAfOgq+Ymb7sGmIRGKOo41oI
         cMKg==
X-Forwarded-Encrypted: i=1; AJvYcCUr0uVJY34Nuzo7v6LsTkE8vf3yz1RXyFSMfOYdkIQaecV4Nzta8xp/evbVvlOwOgxseWwctmpmbKLhhw9m@lists.linux.dev
X-Gm-Message-State: AOJu0YwqhpBRDpya12Lh1GYLJMdEW9zB3v4V8sy2XzHkjUDemAtdbPRM
	7iEiva81HVGjshG5Ktiskv8cap/ilxtrajtYxoikJbSrzxr2MGKpu8wnMOWd
X-Gm-Gg: ASbGnct4IW8QdWfX/l3LsnxBE025zczw1ln4e8WHYkYEHOMS0eGashW+HjD1z7aCBVM
	/im+yZ9t59D88FdHGouXYJIIiqqc1aU+43iCSNtQzSxkGzvUgnDGJRBYHDfbsy1y3LFleBE4idh
	5XkG7u6OzVSG7Hq6qRc1LxoYPQe0JaXYkR4l5xK0eyMFqEQAr3pMzjXOA0Lnsqtl9zgJdK27Uts
	cDPOTqLzm/tyGLXd3dIUc70dIS/7U3v6HT227a0pecyPR9eyD4WoprixhEXn4kAtntFdAvorIsJ
	X6vEByWDuFFMn5rv7Qw=
X-Google-Smtp-Source: AGHT+IHAJQPPSF28PyhNpB3icvOKJuAU9Qt2CqdwjHzT4YqqwhrIDKykMYJhX+y+XiUtQ6UF8WFqHg==
X-Received: by 2002:a05:6102:26c1:b0:4b2:4877:30bd with SMTP id ada2fe7eead31-4b2cc3580aamr26805172137.12.1735394114716;
        Sat, 28 Dec 2024 05:55:14 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d62fsm3408336137.22.2024.12.28.05.55.14
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 05:55:14 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so2463176137.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 05:55:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaea0rNbA7mCTaxi1Fm6dMlUM0zyrfogLYdDCq+uaba/c4cubcj0g/ID9n0ZP52TQK/g6RC/aoZNoyRwN0@lists.linux.dev
X-Received: by 2002:a05:6102:3f0f:b0:4af:df15:7d6d with SMTP id
 ada2fe7eead31-4b2cc45f0bcmr22952488137.21.1735394113966; Sat, 28 Dec 2024
 05:55:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412282326.0DSE4HbR-lkp@intel.com> <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 28 Dec 2024 14:55:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHGz=0d_bGOu7RtF7-ssgnNmHk=MwEbTK77=+UgKGmYA@mail.gmail.com>
Message-ID: <CAMuHMdVHGz=0d_bGOu7RtF7-ssgnNmHk=MwEbTK77=+UgKGmYA@mail.gmail.com>
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 2:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> Hi Kernel Test Robot,
>
> On Sat, Dec 28, 2024 at 2:36=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
> > commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO d=
rivers into a new subdirectory
> > date:   4 years, 4 months ago
> > config: sh-randconfig-001-20241212 (https://download.01.org/0day-ci/arc=
hive/20241228/202412282326.0DSE4HbR-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241228/202412282326.0DSE4HbR-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412282326.0DSE4HbR-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefine=
d!
>
> The real issue was introduced in commit 1eefee901fca0208
> ("phy: mdio-octeon: Refactor into two files/modules").

Silly me: commit 2fd46f47be0f96be
("netdev: mdio-octeon.c: Convert to use device tree.").
But even before that, the driver used a different non-portable construct.

> Drivers must not use __delay() directly, as that is non-portable, and
> doesn't work in the presence of cpufreq.

And looking at
https://lore.kernel.org/all/202412282326.0DSE4HbR-lkp@intel.com
all of this has been said before...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
