Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50D63CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 12:01:27 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bd3317144fso611338a34.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 05:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693483286; x=1694088086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9bc6fKng+UnSmfH+niYbTUHXqxhmRFh+l6XH8C7zl4=;
        b=BWxvSNMFlzT9khDfdA75frOVGoY5IZMyNo/tuMJG9Eshj6KztJL1gGUvA67c+GWOK8
         xG0uOxkn8srGflMgZItnNzgWFP4TY91o/1ppDU11thnKhrd2JzQfhUlCPZVw1a0sxtbJ
         e1eLuDr8hOwYxGSGw6hWeMybHN9Ty57ga/FuT2LPzlN07diULntgsMc/MnxxzNQXK0h9
         HNnyWt1j5HYRViuKCzXVBKNOiYjBmBJ0qyLudvMBsryJhHh7L0fPSa8jd8dhVrDWabRA
         35ZKAiH9FJaRMBXrFzJdpF/nYf7Er3eejjatC7x08nbZsa3WTozJkoYRhbHed8GfZKWZ
         2xRw==
X-Gm-Message-State: AOJu0Yx4Wdjx7at5rEA5SIkzjwM4psDWG5yya50Oo0vcWpvWfn+XHG+r
	cjUtKZUXLSBIuAqOvUzKz5WVnWY0k4xzqw==
X-Google-Smtp-Source: AGHT+IER4t57C8DkwNdVlo4jkfEzvKhMWW1AkiYUskNnTo8vfi6nBj3bjKPGGdOElmRKqjm9Ku6lUQ==
X-Received: by 2002:a05:6358:2789:b0:133:a8e:6feb with SMTP id l9-20020a056358278900b001330a8e6febmr5875312rwb.12.1693483286516;
        Thu, 31 Aug 2023 05:01:26 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id z15-20020a25ad8f000000b00d6a4bae16bbsm269451ybi.49.2023.08.31.05.01.26
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:01:26 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7b91422da8so491960276.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 05:01:26 -0700 (PDT)
X-Received: by 2002:a25:6c55:0:b0:d78:2967:93ea with SMTP id
 h82-20020a256c55000000b00d78296793eamr4324533ybc.1.1693483285941; Thu, 31 Aug
 2023 05:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308311610.ec6bm2G8-lkp@intel.com> <20230831-congested-monument-44ddb496204d@wendy>
 <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>
 <20230831-imperial-surviving-afdf6d275388@wendy> <CA+V-a8vT-LLsUOf+E1g4L+JBnFBn2SGhpDavHRS6k8DduK3KNQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vT-LLsUOf+E1g4L+JBnFBn2SGhpDavHRS6k8DduK3KNQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2023 14:01:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXDVpQeTD-ZdJi2Nk1JUgmSvaBfGUo-CtKpJDKXUdu0A@mail.gmail.com>
Message-ID: <CAMuHMdWXDVpQeTD-ZdJi2Nk1JUgmSvaBfGUo-CtKpJDKXUdu0A@mail.gmail.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Aug 31, 2023 at 1:54=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Aug 31, 2023 at 12:34=E2=80=AFPM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> > On Thu, Aug 31, 2023 at 12:22:50PM +0100, Lad, Prabhakar wrote:
> > > On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
> > > <conor.dooley@microchip.com> wrote:
> > > >
> > > > On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git master
> > > > > head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> > > > > commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] ri=
scv: errata: Add Andes alternative ports
> > > > > config: riscv-randconfig-001-20230831 (https://download.01.org/0d=
ay-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> > > > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-=
ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6b=
m2G8-lkp@intel.com/
> > > > >
> > > > > All error/warnings (new ones prefixed by >>):
> > > > >
> > > > >    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_=
workaround':
> > > > > >> arch/riscv/errata/andes/errata.c:29:23: error: storage size of=
 'ret' isn't known
> > > > >       29 |         struct sbiret ret;
> > > > >          |                       ^~~
> > > > > >> arch/riscv/errata/andes/errata.c:35:15: error: implicit declar=
ation of function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> > > > >       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, AND=
ES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > > >          |               ^~~~~~~~~
> > > > > >> arch/riscv/errata/andes/errata.c:29:23: warning: unused variab=
le 'ret' [-Wunused-variable]
> > > > >       29 |         struct sbiret ret;
> > > > >          |                       ^~~
> > > > >    cc1: some warnings being treated as errors
> > > > >
> > > > >
> > > > > vim +29 arch/riscv/errata/andes/errata.c
> > > > >
> > > > >     26
> > > > >     27        static long ax45mp_iocp_sw_workaround(void)
> > > > >     28        {
> > > > >   > 29                struct sbiret ret;
> > > > >     30
> > > > >     31                /*
> > > > >     32                 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT=
 checks if the IOCP is missing and
> > > > >     33                 * cache is controllable only then CMO will=
 be applied to the platform.
> > > > >     34                 */
> > > > >   > 35                ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, =
ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > > >     36                                0, 0, 0, 0, 0, 0);
> > > > >     37
> > > > >     38                return ret.error ? 0 : ret.value;
> > > > >     39        }
> > > > >     40
> > > >
> > > > Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO will =
need
> > > > to grow a dependency on RISCV_SBI.
> > > I think adding dependency for RISCV_SBI on ERRATA_ANDES would be a go=
od idea.
> > >
> > > While at it I am seeing below warnings with this randconfig:
> > > WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
> > >   Depends on [n]: ERRATA_ANDES [=3Dy] && MMU [=3Dn] && ARCH_R9A07G043=
 [=3Dy]

So the issue is that CONFIG_MMU=3Dn.

> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -3,6 +3,7 @@ menu "CPU errata selection"
>  config ERRATA_ANDES
>         bool "Andes AX45MP errata"
>         depends on RISCV_ALTERNATIVE
> +       depends on RISCV_SBI
>         help
>           All Andes errata Kconfig depend on this Kconfig. Disabling
>           this Kconfig will disable all Andes errata. Please say "Y"
> @@ -12,7 +13,7 @@ config ERRATA_ANDES
>
>  config ERRATA_ANDES_CMO
>         bool "Apply Andes cache management errata"
> -       depends on ERRATA_ANDES && MMU && ARCH_R9A07G043

Why does this depend on MMU?

> +       depends on ERRATA_ANDES && MMU
>         select RISCV_DMA_NONCOHERENT
>         default y
>         help

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -333,11 +333,9 @@ if RISCV
>
>  config ARCH_R9A07G043
>         bool "RISC-V Platform support for RZ/Five"
> +       depends on AX45MP_L2_CACHE

This looks backwards to me...

>         select ARCH_RZG2L
> -       select AX45MP_L2_CACHE
>         select DMA_GLOBAL_POOL
> -       select ERRATA_ANDES
> -       select ERRATA_ANDES_CMO
>         help
>           This enables support for the Renesas RZ/Five SoC.

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
