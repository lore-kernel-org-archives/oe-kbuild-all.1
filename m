Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E429A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 13:02:00 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-34baeb01942so2733955ab.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693486919; x=1694091719; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpJWFwXbjpBPJKdgfU1P3LDYz3QvE+vc+2XTO0Izgdw=;
        b=i3H4Wzfc5OJ4dwp7ihxchxA+XRahGj9JJAc0BpOJmnbk3ZB5XTe2RrSWxCRbvsTzQN
         xBdsGpGZ0P2JPDSrOsk4RiH6AFVwu7TCp1H3LWhMxYrReI7HuEcxFnnspbcqRspeHK4d
         gceb1coKdp/Vbuq4zCXbTBCE9o2JfCkr0TQIN9D2yoPzC0R8i5kKoYlc4eYepXML7N63
         Nilcksue+fgS4ZeyixEtWzGnVmStwa7FjB4r0IcCtrwU4naYwO90qxO1TbGTKQ45F91C
         iMfPsXLj2vu6uQkWBwm97JBItfCvt8YNm28WG5jmY8mlbz9RIqcIJZiuz0v9gQMAJguD
         1egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486919; x=1694091719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpJWFwXbjpBPJKdgfU1P3LDYz3QvE+vc+2XTO0Izgdw=;
        b=DL4EQ7HjF/aDVsahPM3bcKDPwd2hw3q734u+dhJBb/vV45Q0frRYeacvpDbLSX/YNu
         tjWl9eSoH75fwdn42PTfWDErqNOEe++w3dlfIt5GP+yiC00iSb2nxJVpgM5LSXImam/i
         /A9bPXhbtCg58Esjkm2c1xZBrv5lJGg1jRguYY7VluzWvrKxYuh46Sq0k22bFZwGheBV
         9roXHSV/jwZGhol/9efjMeq+JgkoCHBrxD0fUDFJIM73wVC3jrZl+Q/3YHahTDTA9LqL
         MPf5AcByGlwnKUtrJ9JaHfoLgINJXgBQoEqV1Lt+YkVwYhElacVeHzLOnbwP7egnEy9L
         Tr5w==
X-Gm-Message-State: AOJu0Yx0BEIPygvcooUjcf+8Rovf+v1ubjaYdmNmvLg7DGLYuXVwuqVU
	Zw2lspCd3KOGLSYhWU1k9y906QGMxO7JecmumwQ=
X-Google-Smtp-Source: AGHT+IHJps3hnk8E8l1z8WvBtp8AIxG8dbn+uLFjyWsXxVA4Stfdvio9HOCUnnVm+4nhdvVW2W7A3dDGhJnww0/tSLM=
X-Received: by 2002:a05:6e02:1071:b0:345:f28f:cc26 with SMTP id
 q17-20020a056e02107100b00345f28fcc26mr5021202ilj.24.1693486919382; Thu, 31
 Aug 2023 06:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308311610.ec6bm2G8-lkp@intel.com> <20230831-congested-monument-44ddb496204d@wendy>
 <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>
 <20230831-imperial-surviving-afdf6d275388@wendy> <CA+V-a8vT-LLsUOf+E1g4L+JBnFBn2SGhpDavHRS6k8DduK3KNQ@mail.gmail.com>
 <CAMuHMdWXDVpQeTD-ZdJi2Nk1JUgmSvaBfGUo-CtKpJDKXUdu0A@mail.gmail.com>
In-Reply-To: <CAMuHMdWXDVpQeTD-ZdJi2Nk1JUgmSvaBfGUo-CtKpJDKXUdu0A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 31 Aug 2023 14:01:08 +0100
Message-ID: <CA+V-a8s67RrfpfpJd_tqBtk1d_zanbCLVWqCHhUirBYs1zey9A@mail.gmail.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Aug 31, 2023 at 1:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 31, 2023 at 1:54=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Aug 31, 2023 at 12:34=E2=80=AFPM Conor Dooley
> > <conor.dooley@microchip.com> wrote:
> > > On Thu, Aug 31, 2023 at 12:22:50PM +0100, Lad, Prabhakar wrote:
> > > > On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
> > > > <conor.dooley@microchip.com> wrote:
> > > > >
> > > > > On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wrote=
:
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/li=
nux-next.git master
> > > > > > head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> > > > > > commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] =
riscv: errata: Add Andes alternative ports
> > > > > > config: riscv-randconfig-001-20230831 (https://download.01.org/=
0day-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> > > > > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0da=
y-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
> > > > > >
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just =
a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec=
6bm2G8-lkp@intel.com/
> > > > > >
> > > > > > All error/warnings (new ones prefixed by >>):
> > > > > >
> > > > > >    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_s=
w_workaround':
> > > > > > >> arch/riscv/errata/andes/errata.c:29:23: error: storage size =
of 'ret' isn't known
> > > > > >       29 |         struct sbiret ret;
> > > > > >          |                       ^~~
> > > > > > >> arch/riscv/errata/andes/errata.c:35:15: error: implicit decl=
aration of function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> > > > > >       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, A=
NDES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > > > >          |               ^~~~~~~~~
> > > > > > >> arch/riscv/errata/andes/errata.c:29:23: warning: unused vari=
able 'ret' [-Wunused-variable]
> > > > > >       29 |         struct sbiret ret;
> > > > > >          |                       ^~~
> > > > > >    cc1: some warnings being treated as errors
> > > > > >
> > > > > >
> > > > > > vim +29 arch/riscv/errata/andes/errata.c
> > > > > >
> > > > > >     26
> > > > > >     27        static long ax45mp_iocp_sw_workaround(void)
> > > > > >     28        {
> > > > > >   > 29                struct sbiret ret;
> > > > > >     30
> > > > > >     31                /*
> > > > > >     32                 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI E=
XT checks if the IOCP is missing and
> > > > > >     33                 * cache is controllable only then CMO wi=
ll be applied to the platform.
> > > > > >     34                 */
> > > > > >   > 35                ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES=
, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > > > >     36                                0, 0, 0, 0, 0, 0);
> > > > > >     37
> > > > > >     38                return ret.error ? 0 : ret.value;
> > > > > >     39        }
> > > > > >     40
> > > > >
> > > > > Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO wil=
l need
> > > > > to grow a dependency on RISCV_SBI.
> > > > I think adding dependency for RISCV_SBI on ERRATA_ANDES would be a =
good idea.
> > > >
> > > > While at it I am seeing below warnings with this randconfig:
> > > > WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
> > > >   Depends on [n]: ERRATA_ANDES [=3Dy] && MMU [=3Dn] && ARCH_R9A07G0=
43 [=3Dy]
>
> So the issue is that CONFIG_MMU=3Dn.
>
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -3,6 +3,7 @@ menu "CPU errata selection"
> >  config ERRATA_ANDES
> >         bool "Andes AX45MP errata"
> >         depends on RISCV_ALTERNATIVE
> > +       depends on RISCV_SBI
> >         help
> >           All Andes errata Kconfig depend on this Kconfig. Disabling
> >           this Kconfig will disable all Andes errata. Please say "Y"
> > @@ -12,7 +13,7 @@ config ERRATA_ANDES
> >
> >  config ERRATA_ANDES_CMO
> >         bool "Apply Andes cache management errata"
> > -       depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
>
> Why does this depend on MMU?
>
Currently ARCH_R9A07G043 selects DMA_GLOBAL_POOL and we have
RISCV_DMA_NONCOHERENT selecting DMA_DIRECT_REMAP which causes below
build issue when MMU is disabled:

kernel/dma/pool.c: In function 'atomic_pool_expand':
kernel/dma/pool.c:105:44: error: implicit declaration of function
'pgprot_dmacoherent' [-Werror=3Dimplicit-function-declaration]
  105 |
pgprot_dmacoherent(PAGE_KERNEL),
      |                                            ^~~~~~~~~~~~~~~~~~
kernel/dma/pool.c:105:44: error: incompatible type for argument 3 of
'dma_common_contiguous_remap'
  105 |
pgprot_dmacoherent(PAGE_KERNEL),
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                            |
      |                                            int
In file included from kernel/dma/pool.c:8:


> > +       depends on ERRATA_ANDES && MMU
> >         select RISCV_DMA_NONCOHERENT
> >         default y
> >         help
>
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -333,11 +333,9 @@ if RISCV
> >
> >  config ARCH_R9A07G043
> >         bool "RISC-V Platform support for RZ/Five"
> > +       depends on AX45MP_L2_CACHE
>
> This looks backwards to me...
>
Ok, then how about going with the imply approach?

Cheers,
Prabhakar
