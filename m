Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ABB67E80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5f254d1a6daso66631417b3.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 03:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705059225; x=1705664025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJjVyh+7oYXym23boo4u//OtALG0QudsORSegf3gMfU=;
        b=k5pOSN40O3/jcyoOPAheLP8QgxmU69iPkegfVDOEJTJBWM2UQM4UpXqxyUcBu/ppTF
         8KHMYmj5ZMAU51YTWAh4adEikED9BVXypqnsGjv0vqX/XGIkwikWKe0U0FCmZsIQdmoc
         g/lGf8oATDRY9SsA8aFZ/aM02suWeqG07LHScO6MhZ3SSlyIpKNxnzN+1nndINISAMF8
         YsVyTefxr4DEV5rSOTqcKn8HcwR/xHzJTNfJrvPbAFnJhJws3SJ1VWm2+3gXUVwTj8ae
         7whQc1t6lIYyBh4E+OTaa8nbujXOfiTO9byBW5yd1EiRvkafFgheiTFsfGf6Ktvs9V7R
         2I0g==
X-Gm-Message-State: AOJu0YzAwkqvRe2gbRmNWJWTTcwamsseaERISCs8NsNle0ebWy4vvfer
	0jN96m2Imf9Y2twhJeJRPyXNFh1ILiQ5TA==
X-Google-Smtp-Source: AGHT+IF6cIO+vDYlbcBZN/N5d10bqhyOBHlf4kEhpqpBRu6NaldUT0EtSxb5lkUahu2C4O3yGg85ow==
X-Received: by 2002:a0d:df4c:0:b0:5f9:e175:4390 with SMTP id i73-20020a0ddf4c000000b005f9e1754390mr1222621ywe.56.1705059224838;
        Fri, 12 Jan 2024 03:33:44 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id c128-20020a814e86000000b005e77a4a5761sm1252364ywb.113.2024.01.12.03.33.44
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 03:33:44 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5e7409797a1so62234677b3.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 03:33:44 -0800 (PST)
X-Received: by 2002:a81:b650:0:b0:5ea:5340:fb1d with SMTP id
 h16-20020a81b650000000b005ea5340fb1dmr1186575ywk.53.1705059224288; Fri, 12
 Jan 2024 03:33:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240111162419.12406-1-pmladek@suse.com> <CAMuHMdW1XyimybybSwAfwgzeUyFj6riRZZZzQK7zjTVUJziX-Q@mail.gmail.com>
 <ZaEiFXscVBdOJEeI@alley>
In-Reply-To: <ZaEiFXscVBdOJEeI@alley>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jan 2024 12:33:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5V9wQzTzYt+iGBtYEDrcL-g4nzswAB6ME1At1W42qRw@mail.gmail.com>
Message-ID: <CAMuHMdW5V9wQzTzYt+iGBtYEDrcL-g4nzswAB6ME1At1W42qRw@mail.gmail.com>
Subject: Re: [PATCH] scsi: core: Safe warning about bad dev info string
To: Petr Mladek <pmladek@suse.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Down <chris@chrisdown.name>, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Fri, Jan 12, 2024 at 12:27=E2=80=AFPM Petr Mladek <pmladek@suse.com> wro=
te:
> On Fri 2024-01-12 10:22:44, Geert Uytterhoeven wrote:
> > On Thu, Jan 11, 2024 at 5:26=E2=80=AFPM Petr Mladek <pmladek@suse.com> =
wrote:
> > > Both "model" and "strflags" are passed to "%s" even when one or both
> > > are NULL.
> > >
> > > It is safe because vsprintf() would detect the NULL pointer and print
> > > "(null)". But it is a kernel-specific feature and compiler warns
> > > about it:
> > >
> > > <warning>
> > >    In file included from include/linux/kernel.h:19,
> > >                     from arch/x86/include/asm/percpu.h:27,
> > >                     from arch/x86/include/asm/current.h:6,
> > >                     from include/linux/sched.h:12,
> > >                     from include/linux/blkdev.h:5,
> > >                     from drivers/scsi/scsi_devinfo.c:3:
> > >    drivers/scsi/scsi_devinfo.c: In function 'scsi_dev_info_list_add_s=
tr':
> > > >> include/linux/printk.h:434:44: warning: '%s' directive argument is=
 null [-Wformat-overflow=3D]
> > >      434 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, #=
#__VA_ARGS__)
> > >          |                                            ^
> > >    include/linux/printk.h:430:3: note: in definition of macro 'printk=
_index_wrap'
> > >      430 |   _p_func(_fmt, ##__VA_ARGS__);    \
> > >          |   ^~~~~~~
> > >    drivers/scsi/scsi_devinfo.c:551:4: note: in expansion of macro 'pr=
intk'
> > >      551 |    printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
> > >          |    ^~~~~~
> > >    drivers/scsi/scsi_devinfo.c:552:14: note: format string is defined=
 here
> > >      552 |           " '%s'\n", __func__, vendor, model,
> > >          |              ^~
> > > </warning>
> > >
> > > Do not rely on the kernel specific behavior and print the message
> > > a safe way.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202401112002.AOjwMNM0-l=
kp@intel.com/
> > > Signed-off-by: Petr Mladek <pmladek@suse.com>
> > > ---
> > > Note: The patch is only compile tested.
> > >
> > >  drivers/scsi/scsi_devinfo.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/scsi/scsi_devinfo.c b/drivers/scsi/scsi_devinfo.=
c
> > > index 3fcaf10a9dfe..ba7237e83863 100644
> > > --- a/drivers/scsi/scsi_devinfo.c
> > > +++ b/drivers/scsi/scsi_devinfo.c
> > > @@ -551,9 +551,9 @@ static int scsi_dev_info_list_add_str(char *dev_l=
ist)
> > >                 if (model)
> > >                         strflags =3D strsep(&next, next_check);
> > >                 if (!model || !strflags) {
> > > -                       printk(KERN_ERR "%s: bad dev info string '%s'=
 '%s'"
> > > -                              " '%s'\n", __func__, vendor, model,
> > > -                              strflags);
> > > +                       pr_err("%s: bad dev info string '%s' '%s' '%s=
'\n",
> > > +                              __func__, vendor, model ? model : "",
> > > +                              strflags ? strflags : "");
> >
> > Do we really want to make this change?
> > The kernel's vsprintf() implementation has supported NULL pointers
> > since forever, and lots of code relies on that behavior.
>
> Yeah, it was safe even in the first git commit. And it was probably
> safe long before.
>
> Well, I can't find easily how much code relies on this. I would
> personally do not rely on it when writing new code.

Lots of debug code relies on this when printing string pointers.
It doesn't warn because the compiler cannot prove (yet) that such a
pointer can be NULL...

> > Perhaps this warning can be disabled instead?
>
> IMHO, it is not a good idea to disable the warning. I believe that it
> checks also other scenarios and can find real problems.

True.

> Also I think that compilers are getting more and more "clever".
> So keeping the "suspicious" code might be fighting with windmills.

Also true, unfortunately.

So one day the whole "if (!model || !strflags) { ... }" block might
be optimized away, when the compiler decides that NULL pointers are
Undefined Behavior, and thus this cannot happen.

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
