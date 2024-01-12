Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85FF55C00
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5fc2e997804so873937b3.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 01:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705051376; x=1705656176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ+2Dp9TWzBAJs7a7HXex6+HAK1whEFISVpRMsIzFtY=;
        b=NKIcZeMxArd5PFOiXyKyMyfheKGvLc67mmOxjQ3+ICkjQsdw+vCNDrfm/PgYunDF+P
         Rk+q7J4uKh0hpdH/kkFxwhTfpQycShntl09y7eNHj0ZI9FB7lBYYJrxeZJowKHOx93ZQ
         rVXCuKaOQmbW7od9xggwlKfYug32grigb6eXlFcCTd3gW5dPi5O24sFCasd03ZUKz2lC
         xX2BBZ0w2bg1eeF0zx/Azd2Kzdi/ioJ0uFGBkrvn7oa7udNsufNrFPuyY/Z0nuPw5QtW
         +SqyOa0Rpjdnh1L/9wrxVtTlqEqSrCYmC118Bn85BYknfz9qNdfCQm6Xnop+1dM6RqG6
         uUlA==
X-Gm-Message-State: AOJu0YyRwj/o1IqTEo/S3AdMAY6pnVM6T72XqEOe8ysHW9LvE6ECBM8x
	cAqOvtS2QNIUvPnqmwKk5BsVz8pJtgW2jQ==
X-Google-Smtp-Source: AGHT+IEftYHGDvzfNa71MihpAhisk8dGOKzWY2KC8aL+HNWIcPL72yJbXDSE0tMrevZwSM3mT7uz0w==
X-Received: by 2002:a0d:cbc9:0:b0:5e7:c191:8417 with SMTP id n192-20020a0dcbc9000000b005e7c1918417mr979123ywd.43.1705051376538;
        Fri, 12 Jan 2024 01:22:56 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id cp10-20020a05690c0e0a00b005f134299392sm1181509ywb.52.2024.01.12.01.22.56
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 01:22:56 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5fa4b03f3f5so32862267b3.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 01:22:56 -0800 (PST)
X-Received: by 2002:a81:4522:0:b0:5fa:7e0a:b133 with SMTP id
 s34-20020a814522000000b005fa7e0ab133mr895241ywa.79.1705051375948; Fri, 12 Jan
 2024 01:22:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240111162419.12406-1-pmladek@suse.com>
In-Reply-To: <20240111162419.12406-1-pmladek@suse.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jan 2024 10:22:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1XyimybybSwAfwgzeUyFj6riRZZZzQK7zjTVUJziX-Q@mail.gmail.com>
Message-ID: <CAMuHMdW1XyimybybSwAfwgzeUyFj6riRZZZzQK7zjTVUJziX-Q@mail.gmail.com>
Subject: Re: [PATCH] scsi: core: Safe warning about bad dev info string
To: Petr Mladek <pmladek@suse.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Down <chris@chrisdown.name>, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Thu, Jan 11, 2024 at 5:26=E2=80=AFPM Petr Mladek <pmladek@suse.com> wrot=
e:
> Both "model" and "strflags" are passed to "%s" even when one or both
> are NULL.
>
> It is safe because vsprintf() would detect the NULL pointer and print
> "(null)". But it is a kernel-specific feature and compiler warns
> about it:
>
> <warning>
>    In file included from include/linux/kernel.h:19,
>                     from arch/x86/include/asm/percpu.h:27,
>                     from arch/x86/include/asm/current.h:6,
>                     from include/linux/sched.h:12,
>                     from include/linux/blkdev.h:5,
>                     from drivers/scsi/scsi_devinfo.c:3:
>    drivers/scsi/scsi_devinfo.c: In function 'scsi_dev_info_list_add_str':
> >> include/linux/printk.h:434:44: warning: '%s' directive argument is nul=
l [-Wformat-overflow=3D]
>      434 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__V=
A_ARGS__)
>          |                                            ^
>    include/linux/printk.h:430:3: note: in definition of macro 'printk_ind=
ex_wrap'
>      430 |   _p_func(_fmt, ##__VA_ARGS__);    \
>          |   ^~~~~~~
>    drivers/scsi/scsi_devinfo.c:551:4: note: in expansion of macro 'printk=
'
>      551 |    printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
>          |    ^~~~~~
>    drivers/scsi/scsi_devinfo.c:552:14: note: format string is defined her=
e
>      552 |           " '%s'\n", __func__, vendor, model,
>          |              ^~
> </warning>
>
> Do not rely on the kernel specific behavior and print the message a safe =
way.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401112002.AOjwMNM0-lkp@i=
ntel.com/
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
> Note: The patch is only compile tested.
>
>  drivers/scsi/scsi_devinfo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/scsi_devinfo.c b/drivers/scsi/scsi_devinfo.c
> index 3fcaf10a9dfe..ba7237e83863 100644
> --- a/drivers/scsi/scsi_devinfo.c
> +++ b/drivers/scsi/scsi_devinfo.c
> @@ -551,9 +551,9 @@ static int scsi_dev_info_list_add_str(char *dev_list)
>                 if (model)
>                         strflags =3D strsep(&next, next_check);
>                 if (!model || !strflags) {
> -                       printk(KERN_ERR "%s: bad dev info string '%s' '%s=
'"
> -                              " '%s'\n", __func__, vendor, model,
> -                              strflags);
> +                       pr_err("%s: bad dev info string '%s' '%s' '%s'\n"=
,
> +                              __func__, vendor, model ? model : "",
> +                              strflags ? strflags : "");

Do we really want to make this change?
The kernel's vsprintf() implementation has supported NULL pointers
since forever, and lots of code relies on that behavior.

Perhaps this warning can be disabled instead?

>                         res =3D -EINVAL;
>                 } else
>                         res =3D scsi_dev_info_list_add(0 /* compatible */=
, vendor,

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
