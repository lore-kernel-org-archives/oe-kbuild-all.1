Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08D8F5E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 11:23:41 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-79289fefdbeso27573439f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693481021; x=1694085821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/4EQg5ev/+deumnX6OUgiklslgIWa0lVWUE22HEhVI=;
        b=swPUTLaSSl7NKKBVw/k/SzbwxqLfSjB5zaThxayYGiSNgp24F0I918SEgipidaZLbk
         VcXzMRqMP3Bx9ddo1plpIHdKzRwvaW/696yQztbn04Um7GAuuD60gQ3fEPxNyqZIJ/fE
         oGbKnbeab+lOfviKJlPNY2LwH+Kzb2nwxQ+W50sXHhykIs64LubFF7c7pyAW/7SHTw2w
         gh5dQWB8YinN5+yrMzcmsb2DvfyhXuja3MdlkSaKrZW3FccoHz3TfztqnwpGkkT0d4a/
         456/vD1YsendBOQRgq9X7oXn8pEHwi6bgVTa1ScB0n3V+anmMEwYiI1O03WqVT+FrGgh
         OeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481021; x=1694085821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/4EQg5ev/+deumnX6OUgiklslgIWa0lVWUE22HEhVI=;
        b=GHI749S6hgFeld6zfebbFReMRHSGfyGVLk+kl7sbqQQornY0UVEeO+wsk/eaCoQSu+
         rAn+befbeTtQv/vtQZ3yak/KrZ0ptSDnudNfvZGcTUoc+vpJh1Zeeb5olLC952Mkhwvr
         52Cjp53M/9doul3H97PbrbPG4Qh1cVF9ic2gCkt30j90nBq+4gPIkBWe1QBTJ1iOpnsP
         ZogeaJwM2USWRm1M/uqFKi8FQPgLZPaq7mnrTilFNBAc0tMKi8Sms2tb36Sd7uUM+BQP
         QBFRztIGD9tYbF+bW6gGLvKXg1IUArcxYf+wIeW20h36hw0+IQdl3EkYp1INDd3iJ4V3
         ejdw==
X-Gm-Message-State: AOJu0Yw188VpqP8YGqB5uXsN7NVPfbZ6DSqHfUdvStfHoTMgm5vbZCjg
	lC93FVcXXGQNu8te44aJhS9yRuUsgWpoZjqZ31A=
X-Google-Smtp-Source: AGHT+IE7kYVayzAdUAGhBuecJxFu3vc4i9pwityv8OGY+ZE/76nl5azA2K6fuvqOt/HcNuVjbfCF5JyFZuuFoBpr+v8=
X-Received: by 2002:a05:6602:474a:b0:795:2274:1f3f with SMTP id
 dy10-20020a056602474a00b0079522741f3fmr5120974iob.3.1693481020894; Thu, 31
 Aug 2023 04:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308311610.ec6bm2G8-lkp@intel.com> <20230831-congested-monument-44ddb496204d@wendy>
In-Reply-To: <20230831-congested-monument-44ddb496204d@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 31 Aug 2023 12:22:50 +0100
Message-ID: <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, kernel test robot <lkp@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> > commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv: e=
rrata: Add Andes alternative ports
> > config: riscv-randconfig-001-20230831 (https://download.01.org/0day-ci/=
archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-l=
kp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> >    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workar=
ound':
> > >> arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret'=
 isn't known
> >       29 |         struct sbiret ret;
> >          |                       ^~~
> > >> arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration =
of function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> >       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI=
_EXT_IOCP_SW_WORKAROUND,
> >          |               ^~~~~~~~~
> > >> arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 're=
t' [-Wunused-variable]
> >       29 |         struct sbiret ret;
> >          |                       ^~~
> >    cc1: some warnings being treated as errors
> >
> >
> > vim +29 arch/riscv/errata/andes/errata.c
> >
> >     26
> >     27        static long ax45mp_iocp_sw_workaround(void)
> >     28        {
> >   > 29                struct sbiret ret;
> >     30
> >     31                /*
> >     32                 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT check=
s if the IOCP is missing and
> >     33                 * cache is controllable only then CMO will be ap=
plied to the platform.
> >     34                 */
> >   > 35                ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_=
SBI_EXT_IOCP_SW_WORKAROUND,
> >     36                                0, 0, 0, 0, 0, 0);
> >     37
> >     38                return ret.error ? 0 : ret.value;
> >     39        }
> >     40
>
> Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO will need
> to grow a dependency on RISCV_SBI.
I think adding dependency for RISCV_SBI on ERRATA_ANDES would be a good ide=
a.

While at it I am seeing below warnings with this randconfig:
WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
  Depends on [n]: ERRATA_ANDES [=3Dy] && MMU [=3Dn] && ARCH_R9A07G043 [=3Dy=
]
  Selected by [y]:
  - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy]

WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
  Depends on [n]: RISCV_DMA_NONCOHERENT [=3Dn]
  Selected by [y]:
  - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy]
configuration written to .config

*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

For which I will send the below fix:
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,10 +334,10 @@ if RISCV
 config ARCH_R9A07G043
     bool "RISC-V Platform support for RZ/Five"
     select ARCH_RZG2L
-    select AX45MP_L2_CACHE
+    imply AX45MP_L2_CACHE
     select DMA_GLOBAL_POOL
-    select ERRATA_ANDES
-    select ERRATA_ANDES_CMO
+    imply ERRATA_ANDES
+    imply ERRATA_ANDES_CMO
     help
       This enables support for the Renesas RZ/Five SoC.

Cheers,
Prabhakar
