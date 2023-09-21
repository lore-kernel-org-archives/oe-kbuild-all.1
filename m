Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F53D90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 07:08:44 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59bbdb435bfso7547877b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 00:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695280124; x=1695884924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrvL93JjA1OfTIMuGz/cONlaf0wwFcM6NEpdJQ6xEag=;
        b=mLKLJnOlMltbm8ltROhjwNXSO2puyfb1h4oyZrTMvhNDR7Y2NHm55Fa8PWohAe9/7l
         VAErCoN0yFxDdug6P+IzifJNR1yZnKdNpqGjlWEC6O0DCc5FLHZ5zl6SJJFmT49jyryJ
         a5PaG1t6NPLCLs7ho3aVGZY9ahsDZ2+SAYrb82aoXnDsGCbkrSxWfAs5Qp6xPcEHkYTf
         mafw/wABcuJTRD9F9e2uRZwCxDstP/AtkW6DYIvQ6mGfxOpCQhGt1uSKgyZ2hF2JHwe1
         rHyeTOi2oNfKpXmX6py/dNwOZRw0KnL6xnJc0uyJ0p0wSmu21Id0piNEtzaXq2a804V8
         Xz2Q==
X-Gm-Message-State: AOJu0YxRg6DWGWjBwD01+nHy3PeG+MYrZXGOIsERsES0LlVzGEq+UxLK
	9gRD0kPjl8+XrLt8kWg3/K+0zo2TBWvpYQ==
X-Google-Smtp-Source: AGHT+IGPI1PG98qGvxP/7ay83mT5emmusVJXF+FB8aLEppI5/UIPIbenHpMCvVgLlciJkPSkI9b7tg==
X-Received: by 2002:a0d:ea15:0:b0:59b:c11:ad7c with SMTP id t21-20020a0dea15000000b0059b0c11ad7cmr4710493ywe.18.1695280123763;
        Thu, 21 Sep 2023 00:08:43 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id p72-20020a0de64b000000b0059beb468cb3sm191334ywe.32.2023.09.21.00.08.43
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:08:43 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59bbdb435bfso7547707b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 00:08:43 -0700 (PDT)
X-Received: by 2002:a81:8385:0:b0:57a:2f01:31d7 with SMTP id
 t127-20020a818385000000b0057a2f0131d7mr4953764ywf.1.1695280123148; Thu, 21
 Sep 2023 00:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309192013.vI4DKHmw-lkp@intel.com> <CAL_JsqJ0BoR7Dan3=oyWPa6HU3YV=eOFTO5fx7u5zz2i=eB-jQ@mail.gmail.com>
 <a57afd40-71a2-aa68-84cb-44d2a88a1e2b@roeck-us.net> <CAL_JsqJYPJVTxH=d5nYK78+ZWhZAfh4VhEyBLqzyg4MzMhrX0g@mail.gmail.com>
 <194e2d22-9eff-ec6c-9bc9-13b62bda870a@roeck-us.net> <CAL_JsqKcD4AttSVUEi5zuF8S1E4xNdqdZVKiHmk0r79SRW5Cqw@mail.gmail.com>
 <ad1f36ab-29a6-98b6-8782-3980323760e1@roeck-us.net>
In-Reply-To: <ad1f36ab-29a6-98b6-8782-3980323760e1@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2023 09:08:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsiSfp3DGnLXfuENVLOdG91a+GXj3+g9p8Yp6aGTuqDQ@mail.gmail.com>
Message-ID: <CAMuHMdXsiSfp3DGnLXfuENVLOdG91a+GXj3+g9p8Yp6aGTuqDQ@mail.gmail.com>
Subject: Re: arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0
 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned int[]'}
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter, Rob,

CC Michael

On Wed, Sep 20, 2023 at 11:09=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> On 9/20/23 09:20, Rob Herring wrote:
> [....]
>
> >>
> >> Sure, but I still argue that this isn't worth it for drivers like this=
 one.
> >> Are you going to submit a fix ? Because otherwise I'll submit a patch
> >> to drop COMPILE_TEST from MACHZ_WDT.

I think dropping COMPILE_TEST from MACHZ_WDT is the right thing to do
anyway.  Unlike most other drivers, this is not a driver that can be
compiled in, and doesn't do anything if the hardware is not present.
In fact it is a very dangerous driver: its probe function "reads" the
ZF version register, but that involves doing an unconditional write,
which might crash any non-X86 system.

IMHO a driver must not be enabled for compile-testing if its presence
can harm the system.

> > I honestly don't know what the fix is. There's a compiler flag to
> > allow 0 address, but that seems like a big hammer. From what I read on
> > the fix for gcc-12, we shouldn't be getting this, but I haven't
> > confirmed. I was hoping for comment from Geert as the issue doesn't
> > appear to be the driver, but the arch code.

Well, Atari ROM port ISA accesses are really weird, due to the really
weird way the bus is wired to the address/data lines...
The issue is that gcc considers accessing these addresses as "not
done"...

> > Furthermore, I just built the same HEAD and config as reported and
> > don't see this error. I'm using kernel.org nolibc gcc 13.2.0 which
> > should be the same version.
>
> Exactly my point. So now we are stuck with a report like this on a
> driver which probably has 0 users and we don't know how to fix it,
> all to get the benefit of being able to compile it for an architecture
> and platform which will never use it.
>
> I seem to recall similar errors with m68k and COMPILE_TEST last time
> I tried to enable it on watchdog drivers, so I am not sure if this is
> entirely new.

Probably not.

Michael: original build failure report in
https://lore.kernel.org/r/202309192013.vI4DKHmw-lkp@intel.com/

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
