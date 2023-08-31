Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36981944D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 11:54:32 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7923ae72111so27484239f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693482871; x=1694087671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz9f/egUuFrZeCNCO5EIlnzTcZaG1U5LzWIOhQb1uXc=;
        b=DbzIB2uXMVCuVV3XWYrmIFdelwir/JXx6QRD2T2ms5HZmcy1yF05ybxXaDHzJ8vK+y
         r2NScFBlDlWLLFSLEpewYe7u6i2RlO3x4GR2A1lzLHA5G9VJIHI+E8mPsK15vX9vb9Vl
         IBZYppy8kICpR1uYnOGnEIJ2oHC+3M2/Ooo5r1SaUX2JhZ28cBD2xVE8EVMA7Kr1N7dY
         PQu2RKoAMtjX9ckpQM6iuF/azsYzyq18fTrtaBaE3weMMbqvZoSdqc19O4EK+aJwXgDo
         DmNbqdLpL8MkS6P4LTl9ya6hT1NAJ2r0WCRbJb3rDL6ynBevAqiQM7taL9UcJNOaHDcs
         2D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693482871; x=1694087671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bz9f/egUuFrZeCNCO5EIlnzTcZaG1U5LzWIOhQb1uXc=;
        b=hHcJVnCQOh5URBd/5IOGvVDo3s1hNT7BbzgSIhBU0P3h/VSN/IkkBHjcAjbi7nVtqU
         NcTIl+0R0rehAXNrCHObABiq7HpsSwkS+rMG98c5wQZxXF8qraiD0ryI6rf8X5IKWyvu
         xTIrpGBQvq2GbhNyU/VhmWq9a7Q3pxqHT7XFK/o4AE3jrfsfBgqirmgRPoBcHkbGojde
         jGph/M6a91PTXDgpHGCsQvkIj8hQRk1ljcyZxuTKXSXs5E5YqPZf9twlFxS63etO3DBz
         xL/j2/JqIYK7KTVxk/hIdA6eiIoVIEl+M456444TsOGMQF2+mkNYlCVA0nO8g4Pr9dIz
         Fh+g==
X-Gm-Message-State: AOJu0YwA21Swhv2ldMSwEvPKtyAObu49wCQo5yysfhwzci4N2v+bVqtw
	LTXC9mc9QTv+iKITxEl2pybW6kw+vLkyiEWcLPI=
X-Google-Smtp-Source: AGHT+IFQzVYsJvN8uDG6aise2xpTldkpLyWXEG9aNiyAFrW2gU0vZxIb/T3MD2V4KKmehYU7UCNJevIcJkq9BoJfAN4=
X-Received: by 2002:a5e:c70a:0:b0:791:16ba:d764 with SMTP id
 f10-20020a5ec70a000000b0079116bad764mr5559584iop.16.1693482871145; Thu, 31
 Aug 2023 04:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308311610.ec6bm2G8-lkp@intel.com> <20230831-congested-monument-44ddb496204d@wendy>
 <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com> <20230831-imperial-surviving-afdf6d275388@wendy>
In-Reply-To: <20230831-imperial-surviving-afdf6d275388@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 31 Aug 2023 12:53:40 +0100
Message-ID: <CA+V-a8vT-LLsUOf+E1g4L+JBnFBn2SGhpDavHRS6k8DduK3KNQ@mail.gmail.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
To: Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel test robot <lkp@intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, Aug 31, 2023 at 12:34=E2=80=AFPM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> On Thu, Aug 31, 2023 at 12:22:50PM +0100, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> > On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
> > <conor.dooley@microchip.com> wrote:
> > >
> > > On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> > > > head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> > > > commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] risc=
v: errata: Add Andes alternative ports
> > > > config: riscv-randconfig-001-20230831 (https://download.01.org/0day=
-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> > > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2=
G8-lkp@intel.com/
> > > >
> > > > All error/warnings (new ones prefixed by >>):
> > > >
> > > >    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_wo=
rkaround':
> > > > >> arch/riscv/errata/andes/errata.c:29:23: error: storage size of '=
ret' isn't known
> > > >       29 |         struct sbiret ret;
> > > >          |                       ^~~
> > > > >> arch/riscv/errata/andes/errata.c:35:15: error: implicit declarat=
ion of function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> > > >       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES=
_SBI_EXT_IOCP_SW_WORKAROUND,
> > > >          |               ^~~~~~~~~
> > > > >> arch/riscv/errata/andes/errata.c:29:23: warning: unused variable=
 'ret' [-Wunused-variable]
> > > >       29 |         struct sbiret ret;
> > > >          |                       ^~~
> > > >    cc1: some warnings being treated as errors
> > > >
> > > >
> > > > vim +29 arch/riscv/errata/andes/errata.c
> > > >
> > > >     26
> > > >     27        static long ax45mp_iocp_sw_workaround(void)
> > > >     28        {
> > > >   > 29                struct sbiret ret;
> > > >     30
> > > >     31                /*
> > > >     32                 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT c=
hecks if the IOCP is missing and
> > > >     33                 * cache is controllable only then CMO will b=
e applied to the platform.
> > > >     34                 */
> > > >   > 35                ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, AN=
DES_SBI_EXT_IOCP_SW_WORKAROUND,
> > > >     36                                0, 0, 0, 0, 0, 0);
> > > >     37
> > > >     38                return ret.error ? 0 : ret.value;
> > > >     39        }
> > > >     40
> > >
> > > Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO will ne=
ed
> > > to grow a dependency on RISCV_SBI.
> > I think adding dependency for RISCV_SBI on ERRATA_ANDES would be a good=
 idea.
> >
> > While at it I am seeing below warnings with this randconfig:
> > WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
> >   Depends on [n]: ERRATA_ANDES [=3Dy] && MMU [=3Dn] && ARCH_R9A07G043 [=
=3Dy]
> >   Selected by [y]:
> >   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
> >   Depends on [n]: RISCV_DMA_NONCOHERENT [=3Dn]
> >   Selected by [y]:
> >   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy]
> > configuration written to .config
> >
> > *** End of the configuration.
> > *** Execute 'make' to start the build or try 'make help'.
> >
> > For which I will send the below fix:
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -334,10 +334,10 @@ if RISCV
> >  config ARCH_R9A07G043
> >      bool "RISC-V Platform support for RZ/Five"
> >      select ARCH_RZG2L
> > -    select AX45MP_L2_CACHE
> > +    imply AX45MP_L2_CACHE
> >      select DMA_GLOBAL_POOL
> > -    select ERRATA_ANDES
> > -    select ERRATA_ANDES_CMO
> > +    imply ERRATA_ANDES
> > +    imply ERRATA_ANDES_CMO
> >      help
> >        This enables support for the Renesas RZ/Five SoC.
>
> I've only ever heard bad things from Arnd about using imply.
>
> Why don't you just make the erratum config option select
> RISCV_DMA_NONCOHERENT, just like the THEAD_CMO erratum does?
> The cache driver should probably then depend on the erratum Kconfig
> option, since there's no point in having it otherwise?
>
Agreed.

I have the below proposal:
---------------------------------------
diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 92c779764b27..672480f4f983 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -3,6 +3,7 @@ menu "CPU errata selection"
 config ERRATA_ANDES
        bool "Andes AX45MP errata"
        depends on RISCV_ALTERNATIVE
+       depends on RISCV_SBI
        help
          All Andes errata Kconfig depend on this Kconfig. Disabling
          this Kconfig will disable all Andes errata. Please say "Y"
@@ -12,7 +13,7 @@ config ERRATA_ANDES

 config ERRATA_ANDES_CMO
        bool "Apply Andes cache management errata"
-       depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
+       depends on ERRATA_ANDES && MMU
        select RISCV_DMA_NONCOHERENT
        default y
        help
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index a57677f908f3..14d0ff5ec71b 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -3,7 +3,7 @@ menu "Cache Drivers"

 config AX45MP_L2_CACHE
        bool "Andes Technology AX45MP L2 Cache controller"
-       depends on RISCV_DMA_NONCOHERENT
+       depends on ERRATA_ANDES_CMO
        select RISCV_NONSTANDARD_CACHE_OPS
        help
          Support for the L2 cache controller on Andes Technology
AX45MP platforms.
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 67604f24973e..4f14fa149985 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -333,11 +333,9 @@ if RISCV

 config ARCH_R9A07G043
        bool "RISC-V Platform support for RZ/Five"
+       depends on AX45MP_L2_CACHE
        select ARCH_RZG2L
-       select AX45MP_L2_CACHE
        select DMA_GLOBAL_POOL
-       select ERRATA_ANDES
-       select ERRATA_ANDES_CMO
        help
          This enables support for the Renesas RZ/Five SoC.

Cheers,
Prabhakar
