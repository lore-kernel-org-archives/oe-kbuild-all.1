Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CBEBE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 08:35:48 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-794e0e8b588so62971639f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Sep 2023 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693557347; x=1694162147; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBwkl8r56F9MsUo4ywqpeDj588eZZ4KwRWAzOpHdTZc=;
        b=Xy6clyw1y5r5CZK7e0MhHcAA8/PLtHh3o8eG2ID1tcF92ohaM2V8LfXI5jGPiDTjsy
         4d0QzN/myNlIm46PraJEmMVdWhwTwuDPiURV0898aLowc15JBN5Jf3IOK/OuxI1myx/f
         IUCW6wI8nV8iwzuk/QLp/MKTyq0vTI8nER8U+fWhjvD5zvAlZKYtd3kx6Jss/28PELjY
         vvfsx464XFXcpXH8AKLVbVWcT1pgS92oJjvjl/6Nt/bIwO7wmn1EdEEN3ndNOCbWR29A
         PlujFBAoegwE4JaHy6CGgX79LH5FRBhRQHHmMR3qPyao/48AB99iQe/x852RqGlsW4mT
         IPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693557347; x=1694162147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBwkl8r56F9MsUo4ywqpeDj588eZZ4KwRWAzOpHdTZc=;
        b=MDa2O9KzNjU8lYTSOc2WxVvuVP1qOTWoRLnyCFBbHEHoHjaimNt0e5Bzk3wDImEOiu
         xX8TAwQtv2WsFFVMJUlwk4f5/8sqAdKR9gCiiiKJzZOU10MMNb4QJYlgKS+8hsTmyM/P
         AdUIDqGvj9G4gYOuJFjaNIE+CRrh2pMxrprJJWxXp3NQOMQwxM1TxMi7AJeSrCYDgu/f
         DjoGJebCBLPnatxkRT9m2u3+cudQ/uqkNLzaBnNs6QmKBhVYu2DHohb3/uzNzqVXgGA+
         BR2atpTJBxxJZbJjNa73x3uBb7r6T0k2miLs2LmZZSlR23d9IUMDn8wBnw4qHjZ1M+ad
         SfNA==
X-Gm-Message-State: AOJu0YzWwgs3lcIa5RMFH8epLjUEOyuoI3TyCr24eYPE7sVhOQR/RAMt
	giPXXokt0wjbjqgVhAAd9V5AKC7tSXPQwsuhVvY=
X-Google-Smtp-Source: AGHT+IGsIyPdvF6MA8CXUeTIapdA5U+Ur0uIO4xefYecaaBMCoe3Iu35bQpJWRy+7CHZNmIXTEdS6HQHSIcdW/UNRb8=
X-Received: by 2002:a5e:8b01:0:b0:792:82f8:7402 with SMTP id
 g1-20020a5e8b01000000b0079282f87402mr1914582iok.16.1693557347139; Fri, 01 Sep
 2023 01:35:47 -0700 (PDT)
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
 <CA+V-a8s67RrfpfpJd_tqBtk1d_zanbCLVWqCHhUirBYs1zey9A@mail.gmail.com>
 <CAMuHMdWkjtH0JJ6xOLBSUd7J-Jsd-vALtqmxiXrhtaQRO6cTHQ@mail.gmail.com>
 <CA+V-a8saBGu4t99k+7KD5o4g0p-Ou+ztFdwVAwmkRjFGFk_X3Q@mail.gmail.com> <20230831-nimble-rust-00821dccffdf@spud>
In-Reply-To: <20230831-nimble-rust-00821dccffdf@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Sep 2023 09:34:55 +0100
Message-ID: <CA+V-a8sNCkipAiwJTpZzuBiicN0j9vRnjb9Lz68XwppBHjB5Gw@mail.gmail.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor.dooley@microchip.com>, 
	kernel test robot <lkp@intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, Aug 31, 2023 at 5:36=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Aug 31, 2023 at 03:59:37PM +0100, Lad, Prabhakar wrote:
>
> > > > Currently ARCH_R9A07G043 selects DMA_GLOBAL_POOL and we have
> > > > RISCV_DMA_NONCOHERENT selecting DMA_DIRECT_REMAP which causes below
> > > > build issue when MMU is disabled:
> > > >
> > > > kernel/dma/pool.c: In function 'atomic_pool_expand':
> > > > kernel/dma/pool.c:105:44: error: implicit declaration of function
> > > > 'pgprot_dmacoherent' [-Werror=3Dimplicit-function-declaration]
> > > >   105 |
> > > > pgprot_dmacoherent(PAGE_KERNEL),
> > > >       |                                            ^~~~~~~~~~~~~~~~=
~~
> > > > kernel/dma/pool.c:105:44: error: incompatible type for argument 3 o=
f
> > > > 'dma_common_contiguous_remap'
> > > >   105 |
> > > > pgprot_dmacoherent(PAGE_KERNEL),
> > > >       |
> > > > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >       |                                            |
> > > >       |                                            int
> > > > In file included from kernel/dma/pool.c:8:
> > >
> > > Hmm, kernel/dma/mapping.c has its use of pgprot_dmacoherent() inside
> > > an #ifdef CONFIG_MMU block.
> > > kernel/dma/pool.c has it inside an #ifdef CONFIG_DMA_DIRECT_REMAP blo=
ck.
> > >
> > > I guess that select should get a dependency on MMU:
> > >
> > >     config RISCV_DMA_NONCOHERENT
> > >             select DMA_DIRECT_REMAP if MMU
> > >
> > > For comparison, m68k does take that into account:
> > >
> > >     select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> > >
> > Thanks for the pointer. With this changes we dont get an unmet
> > dependencies warning.
> >
> > arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaroun=
d':
> > arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' is=
n't known
> >    29 |         struct sbiret ret;
> >       |                       ^~~
> > arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of
> > function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> >    35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES,
> > ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
> >       |               ^~~~~~~~~
> > arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret'
> > [-Wunused-variable]
> >    29 |         struct sbiret ret;
> >       |                       ^~~
> > arch/riscv/errata/andes/errata.c:39:1: error: control reaches end of
> > non-void function [-Werror=3Dreturn-type]
> >    39 | }
> >       | ^
> > cc1: some warnings being treated as errors
> >
> > To fix the above build issue reported by the bot, adding a dependency
> > for RISCV_SBI in ERRATA_ANDES won't help as ARCH_R9A07G043 is
> > explicitly selecting it. To avoid imply should explicitly select based
> > on dependency something like below?
> >
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 92c779764b27..566bcefeab50 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -2,7 +2,7 @@ menu "CPU errata selection"
> >
> >  config ERRATA_ANDES
> >      bool "Andes AX45MP errata"
> > -    depends on RISCV_ALTERNATIVE
> > +    depends on RISCV_ALTERNATIVE && RISCV_SBI
> >      help
> >        All Andes errata Kconfig depend on this Kconfig. Disabling
> >        this Kconfig will disable all Andes errata. Please say "Y"
> > @@ -12,7 +12,7 @@ config ERRATA_ANDES
> >
> >  config ERRATA_ANDES_CMO
> >      bool "Apply Andes cache management errata"
> > -    depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
> > +    depends on ERRATA_ANDES && ARCH_R9A07G043
> >      select RISCV_DMA_NONCOHERENT
> >      default y
> >      help
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index 67604f24973e..543300fe9862 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -334,10 +334,10 @@ if RISCV
> >  config ARCH_R9A07G043
> >      bool "RISC-V Platform support for RZ/Five"
> >      select ARCH_RZG2L
> > -    select AX45MP_L2_CACHE
> > +    select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
> >      select DMA_GLOBAL_POOL
> > -    select ERRATA_ANDES
> > -    select ERRATA_ANDES_CMO
> > +    select ERRATA_ANDES if RISCV_SBI
> > +    select ERRATA_ANDES_CMO if ERRATA_ANDES
> >      help
> >        This enables support for the Renesas RZ/Five SoC.
> >
> > Or am I missing a simpler way to fix this.
>
> This seems reasonable to me at least /shrug
>
Ok I will go this approach then.

Cheers,
Prabhakar
