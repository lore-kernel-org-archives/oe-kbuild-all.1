Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F311719
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 13:24:19 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58fa51a0d97so9227297b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693488258; x=1694093058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ/+Xi4zcWbR6NuMjYnszGbUyAs/bLSQutm2P6DQty0=;
        b=V4HGT8QkcXWhLkOPMcD8m+6kh+Khs5u63ZIrPWR9CbUUGwKrub97BTua26R4sJfEv/
         W1v5EJv3PpnEc5vRMiU35QGwDHFW3Z28GsOpaJSo1AFLLSiOfVZwEF+sg/4JUGYRogmf
         /PYzXouXWYK2P+ySpLxKTt5a8m9fxbfyKqXFwJR0E7/XC4DoBQFeYHYcmnmzCCY5wh8j
         UvTNb0QPXitDG5fdxceRid+r/HbzTjSkqBLAZbkLmQUFbKT02A5dLRAayEVA1QXyBb4U
         BVjos6eDALcpMusbwvBuMolmQ1nJPQvtDCMdwwqfL+QJs4QgCbO07pt0r4Holow7nJPj
         5VdA==
X-Gm-Message-State: AOJu0YxnklH0G+6BUzg3fd+TxVNDVTaZkQvY7voXX6tPvExosOfoL/Xx
	FmE8dSiRIEKZpgIdB9ywtc9jhjt9Qggnyw==
X-Google-Smtp-Source: AGHT+IGUl5AYF5iDAqNjja4//A8t7/02sxwsFaCe/oGPsjEMzO5QOFDjaGhnMWi3POx/s/XuEk9POg==
X-Received: by 2002:a0d:e441:0:b0:58c:5778:420c with SMTP id n62-20020a0de441000000b0058c5778420cmr4788076ywe.27.1693488257754;
        Thu, 31 Aug 2023 06:24:17 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id l185-20020a0de2c2000000b0057a560a9832sm409563ywe.1.2023.08.31.06.24.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 06:24:17 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d73c595b558so596361276.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:24:16 -0700 (PDT)
X-Received: by 2002:a25:b323:0:b0:d7a:d716:233c with SMTP id
 l35-20020a25b323000000b00d7ad716233cmr5271223ybj.41.1693488256694; Thu, 31
 Aug 2023 06:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308311610.ec6bm2G8-lkp@intel.com> <20230831-congested-monument-44ddb496204d@wendy>
 <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>
 <20230831-imperial-surviving-afdf6d275388@wendy> <CA+V-a8vT-LLsUOf+E1g4L+JBnFBn2SGhpDavHRS6k8DduK3KNQ@mail.gmail.com>
 <CAMuHMdWXDVpQeTD-ZdJi2Nk1JUgmSvaBfGUo-CtKpJDKXUdu0A@mail.gmail.com> <CA+V-a8s67RrfpfpJd_tqBtk1d_zanbCLVWqCHhUirBYs1zey9A@mail.gmail.com>
In-Reply-To: <CA+V-a8s67RrfpfpJd_tqBtk1d_zanbCLVWqCHhUirBYs1zey9A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2023 15:24:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkjtH0JJ6xOLBSUd7J-Jsd-vALtqmxiXrhtaQRO6cTHQ@mail.gmail.com>
Message-ID: <CAMuHMdWkjtH0JJ6xOLBSUd7J-Jsd-vALtqmxiXrhtaQRO6cTHQ@mail.gmail.com>
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

On Thu, Aug 31, 2023 at 3:02=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Aug 31, 2023 at 1:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, Aug 31, 2023 at 1:54=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Thu, Aug 31, 2023 at 12:34=E2=80=AFPM Conor Dooley
> > > <conor.dooley@microchip.com> wrote:
> > > > On Thu, Aug 31, 2023 at 12:22:50PM +0100, Lad, Prabhakar wrote:
> > > > > On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
> > > > > <conor.dooley@microchip.com> wrote:
> > > > > >
> > > > > > On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wro=
te:
> > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/=
linux-next.git master
> > > > > > > head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> > > > > > > commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643=
] riscv: errata: Add Andes alternative ports
> > > > > > > config: riscv-randconfig-001-20230831 (https://download.01.or=
g/0day-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> > > > > > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0=
day-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
> > > > > > >
> > > > > > > If you fix the issue in a separate patch/commit (i.e. not jus=
t a new version of
> > > > > > > the same patch/commit), kindly add following tags
> > > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.=
ec6bm2G8-lkp@intel.com/
> > > > > > >
> > > > > > > All error/warnings (new ones prefixed by >>):
> > > > > > >
> > > > > > >    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp=
_sw_workaround':
> > > > > > > >> arch/riscv/errata/andes/errata.c:29:23: error: storage siz=
e of 'ret' isn't known
> > > > > > >       29 |         struct sbiret ret;
> > > > > > >          |                       ^~~
> > > > > > > >> arch/riscv/errata/andes/errata.c:35:15: error: implicit de=
claration of function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> > > > > > >       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES,=
 ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > > > > >          |               ^~~~~~~~~
> > > > > > > >> arch/riscv/errata/andes/errata.c:29:23: warning: unused va=
riable 'ret' [-Wunused-variable]
> > > > > > >       29 |         struct sbiret ret;
> > > > > > >          |                       ^~~
> > > > > > >    cc1: some warnings being treated as errors
> > > > > > >
> > > > > > >
> > > > > > > vim +29 arch/riscv/errata/andes/errata.c
> > > > > > >
> > > > > > >     26
> > > > > > >     27        static long ax45mp_iocp_sw_workaround(void)
> > > > > > >     28        {
> > > > > > >   > 29                struct sbiret ret;
> > > > > > >     30
> > > > > > >     31                /*
> > > > > > >     32                 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI=
 EXT checks if the IOCP is missing and
> > > > > > >     33                 * cache is controllable only then CMO =
will be applied to the platform.
> > > > > > >     34                 */
> > > > > > >   > 35                ret =3D sbi_ecall(ANDESTECH_SBI_EXT_AND=
ES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > > > > >     36                                0, 0, 0, 0, 0, 0);
> > > > > > >     37
> > > > > > >     38                return ret.error ? 0 : ret.value;
> > > > > > >     39        }
> > > > > > >     40
> > > > > >
> > > > > > Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO w=
ill need
> > > > > > to grow a dependency on RISCV_SBI.
> > > > > I think adding dependency for RISCV_SBI on ERRATA_ANDES would be =
a good idea.
> > > > >
> > > > > While at it I am seeing below warnings with this randconfig:
> > > > > WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
> > > > >   Depends on [n]: ERRATA_ANDES [=3Dy] && MMU [=3Dn] && ARCH_R9A07=
G043 [=3Dy]
> >
> > So the issue is that CONFIG_MMU=3Dn.
> >
> > > --- a/arch/riscv/Kconfig.errata
> > > +++ b/arch/riscv/Kconfig.errata
> > > @@ -3,6 +3,7 @@ menu "CPU errata selection"
> > >  config ERRATA_ANDES
> > >         bool "Andes AX45MP errata"
> > >         depends on RISCV_ALTERNATIVE
> > > +       depends on RISCV_SBI
> > >         help
> > >           All Andes errata Kconfig depend on this Kconfig. Disabling
> > >           this Kconfig will disable all Andes errata. Please say "Y"
> > > @@ -12,7 +13,7 @@ config ERRATA_ANDES
> > >
> > >  config ERRATA_ANDES_CMO
> > >         bool "Apply Andes cache management errata"
> > > -       depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
> >
> > Why does this depend on MMU?
> >
> Currently ARCH_R9A07G043 selects DMA_GLOBAL_POOL and we have
> RISCV_DMA_NONCOHERENT selecting DMA_DIRECT_REMAP which causes below
> build issue when MMU is disabled:
>
> kernel/dma/pool.c: In function 'atomic_pool_expand':
> kernel/dma/pool.c:105:44: error: implicit declaration of function
> 'pgprot_dmacoherent' [-Werror=3Dimplicit-function-declaration]
>   105 |
> pgprot_dmacoherent(PAGE_KERNEL),
>       |                                            ^~~~~~~~~~~~~~~~~~
> kernel/dma/pool.c:105:44: error: incompatible type for argument 3 of
> 'dma_common_contiguous_remap'
>   105 |
> pgprot_dmacoherent(PAGE_KERNEL),
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                            |
>       |                                            int
> In file included from kernel/dma/pool.c:8:

Hmm, kernel/dma/mapping.c has its use of pgprot_dmacoherent() inside
an #ifdef CONFIG_MMU block.
kernel/dma/pool.c has it inside an #ifdef CONFIG_DMA_DIRECT_REMAP block.

I guess that select should get a dependency on MMU:

    config RISCV_DMA_NONCOHERENT
            select DMA_DIRECT_REMAP if MMU

For comparison, m68k does take that into account:

    select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE

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
