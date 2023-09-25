Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8110942
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 07:32:14 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f55c276c3so35984397b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 00:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627133; x=1696231933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xThiWU+H5y1zPVxgj/ULPXRi0AJOVCXd78/fbyAqgmg=;
        b=uiWqJ9hsJAIiu3UPjDr6IV0ltN2kLuatfs61wVXvH9AIaSlqJOTk/70sJTpeNvIHNd
         YsqFxL9EuD+U0QjeOUigZ4V7+EzM9g7ST6E7lJcK4OEYLO5sqAYjg2sAzOkExbW6i0re
         3NeyE8pSvYsKKXQY+1vBR1lelexi572AynYf19XZvUh2JW1eW9gZoCouJhf+AKIGhplU
         etZmvaTjHnFHw59qJS8DHssUBMp5284Iy4gRscZMYve8k75WsHQuJUgJ1B3HwfVrBvtN
         9+9zyNzkngFFjHvNeSU6az5fMCxf3ns9xVBgcj2sZy+YvVO0O15QJuJHyifMQQ5EPpZM
         VL3A==
X-Gm-Message-State: AOJu0Yy6ZY/dxa2PkzDm6ctHl99EZ5sM4wkG5BM8SBwEMS5WuLy4k45I
	72Jne2ig1ZL1DPhYYLWnDw5AfEzf/xwCcg==
X-Google-Smtp-Source: AGHT+IHEY9fVlvagJCB7LHdBqlV1UH+tQ+kq7uFxhW03Mcp+Fwg9iCmyKqQzE6Ijl6gFlELrygm+ww==
X-Received: by 2002:a81:88c2:0:b0:59f:21c1:30b6 with SMTP id y185-20020a8188c2000000b0059f21c130b6mr6028950ywf.51.1695627133144;
        Mon, 25 Sep 2023 00:32:13 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id b145-20020a0dd997000000b00583d1fa1fccsm2270394ywe.0.2023.09.25.00.32.12
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:32:12 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d8181087dc9so6365382276.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 00:32:12 -0700 (PDT)
X-Received: by 2002:a25:ec0c:0:b0:d81:bb7e:f47f with SMTP id
 j12-20020a25ec0c000000b00d81bb7ef47fmr6282466ybh.44.1695627132454; Mon, 25
 Sep 2023 00:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309130632.LS04CPWu-lkp@intel.com> <feadd6a5-0f56-4575-9891-3a7d88e69e64@infradead.org>
In-Reply-To: <feadd6a5-0f56-4575-9891-3a7d88e69e64@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 09:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRyaq5xT+2GGREHS95Nm86wHmmU0cE_qR5-eza1vMExw@mail.gmail.com>
Message-ID: <CAMuHMdVRyaq5xT+2GGREHS95Nm86wHmmU0cE_qR5-eza1vMExw@mail.gmail.com>
Subject: Re: sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:undefined reference
 to `fb_io_read'
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-fbdev@vger.kernel.org, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Wed, Sep 13, 2023 at 7:13=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> On 9/12/23 15:42, kernel test robot wrote:
> > FYI, the error/warning was bisected to this commit, please ignore it if=
 it's irrelevant.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   3669558bdf354cd352be955ef2764cde6a9bf5ec
> > commit: 5f86367006c6a0662faaf36f753f437afe42fb63 fbdev/sh7760fb: Use fb=
dev I/O helpers
> > date:   6 weeks ago
> > config: sh-randconfig-r012-20230913 (https://download.01.org/0day-ci/ar=
chive/20230913/202309130632.LS04CPWu-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20230913/202309130632.LS04CPWu-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309130632.LS04CPWu-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_=
probe':
> >    sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_v=
ideomode_to_var'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x39c): undefined reference to `fb_a=
lloc_cmap'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `regi=
ster_framebuffer'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_d=
ealloc_cmap'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `fram=
ebuffer_release'
> >    sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_=
remove':
> >    sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebu=
ffer'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_d=
ealloc_cmap'
> >    sh4-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `fram=
ebuffer_release'
> >>> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefined=
 reference to `fb_io_read'
> >>> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefine=
d reference to `fb_io_write'
> >    sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefin=
ed reference to `cfb_fillrect'
> >    sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefin=
ed reference to `cfb_copyarea'
> >    sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefin=
ed reference to `cfb_imageblit'
>
> The problem is CONFIG_FB=3Dm and CONFIG_FB_SH7760=3Dy.
>
> This can be fixed by this simple change ... if it's correct.
>
> or this Kconfig entry can be made into a tristate, but that may not
> help with booting a system.

What kind of problem do you foresee? Users could still configure it builtin
when needed.

I see no reason to restrict this to builtin.
The driver already has all MODULE_*() boilerplate.

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1762,7 +1762,7 @@ config FB_COBALT
>
>  config FB_SH7760
>         bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
> -       depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
> +       depends on FB=3Dy && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>                 || CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>         select FB_IOMEM_HELPERS
>         help

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
