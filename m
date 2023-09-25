Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0AA10942
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 07:33:52 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59f6e6b206fso19568077b3.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 00:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627231; x=1696232031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4DkV30tiTF+/Nd4PKu9iZtuKtXNv4GedklEIC0otY4=;
        b=p3i2uhCeb9RumxKef0hgBREoLMKTYxgj/Lo/HW2b6J3jb9JQW5xRobfYbxZJtB1Mza
         gw8E1DJh8NimC5I+NiLtBz/AfPJyZ177EmP8zkFA8DDS+hg0s5BDF2S0yCu6cpOA30Bt
         B2yQyQ8vtPc8a6A5YwtyJTK7NkGtoZ/RHHs3x+Dr6iqvzEGnj9LcWvcBwFdcMFemn21S
         fh0Ucx2jWP8fbnMH5RWzB3NIstwWSmRhhkBJgboYFq64F0TicKUg60KjMNJSDS3Bjkqk
         GqW99u1QjrBsZpF0S6+Z0pGylxm8dTS3b5nChBXDK/2hJl7b5q+Lprb1sG5y/TXwpngw
         d+vQ==
X-Gm-Message-State: AOJu0Yx8jXaw7q3ZeePIffnxavyF75ogVX4r+h6IylHSocu8nHMWx/m+
	6oR/KWIFXd465FMQjLrDWvS5fX7kJ4B0zQ==
X-Google-Smtp-Source: AGHT+IEJBJqLWglCKVrXnpBinS+vdTS7/ObrnC7RWaXdi1w6dcFSkV5Cj4hnUUIxlaqtGVJO78q5Dg==
X-Received: by 2002:a0d:e307:0:b0:59b:e449:2d51 with SMTP id m7-20020a0de307000000b0059be4492d51mr7664766ywe.49.1695627231131;
        Mon, 25 Sep 2023 00:33:51 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id n185-20020a0dfdc2000000b00589a999038asm2272625ywf.77.2023.09.25.00.33.50
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:33:50 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59f82ad1e09so8770797b3.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 00:33:50 -0700 (PDT)
X-Received: by 2002:a25:37d4:0:b0:d77:91db:e5c6 with SMTP id
 e203-20020a2537d4000000b00d7791dbe5c6mr6003949yba.17.1695627230398; Mon, 25
 Sep 2023 00:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918090400.13264-1-tzimmermann@suse.de>
In-Reply-To: <20230918090400.13264-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 09:33:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
Message-ID: <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
Subject: Re: [PATCH] fbdev/sh7760fb: Depend on FB=y
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, sam@ravnborg.org, arnd@arndb.de, javierm@redhat.com, 
	rdunlap@infradead.org, glaubitz@physik.fu-berlin.de, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Sep 18, 2023 at 11:45=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Fix linker error if FB=3Dm about missing fb_io_read and fb_io_write. The
> linker's error message suggests that this config setting has already
> been broken for other symbols.
>
>   All errors (new ones prefixed by >>):
>
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_=
probe':
>      sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
>      sh4-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_v=
ideomode_to_var'
>      sh4-linux-ld: sh7760fb.c:(.text+0x39c): undefined reference to `fb_a=
lloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `regi=
ster_framebuffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_d=
ealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `fram=
ebuffer_release'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_=
remove':
>      sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebu=
ffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_d=
ealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `fram=
ebuffer_release'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefine=
d reference to `fb_io_read'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefin=
ed reference to `fb_io_write'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefin=
ed reference to `cfb_fillrect'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefin=
ed reference to `cfb_copyarea'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefin=
ed reference to `cfb_imageblit'
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309130632.LS04CPWu-lkp@i=
ntel.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1756,7 +1756,7 @@ config FB_COBALT
>
>  config FB_SH7760
>         bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
> -       depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
> +       depends on FB=3Dy && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>                 || CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>         select FB_IOMEM_HELPERS
>         help
> --

Any reason this can't become tristate instead?
drivers/video/fbdev/sh7760fb.c uses module_platform_driver(), and
already has all needed MODULE_*().

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
