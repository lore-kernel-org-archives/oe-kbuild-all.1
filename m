Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3656186A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 15:00:29 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-79268f36c49so33871039f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693494028; x=1694098828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maWUEzzcpZvbMut13ZGvpoiNO4A5EezHq+i4LSTx+aw=;
        b=SCDw0IOWXT7L3RHrJVuYvFXY3HS54j1fYreRNBBHUwBfT6T7msjbtZJnbi68sGWzwJ
         IJc2nF+JjVpBkdjMY5Ft6sOBTamc4mhcyzcGaL5vPAgoUMgeYRxerEock3o5IMT9utF0
         mcUU0O3wHut2i1uAd6vFtF75jvR1ZcPambSFjPcrhO1POEySAhIqkFclMfyoXi+BS3Dx
         9NpydWP750FVS/bJLP7LymSfqF3Uttr+E1g/zYp1XqjTB2eT8t3hYU7AqzRJg5h3GEKc
         3+fIA3EedX+VJZzsfZMlpX4KjitEQSXZ8TO8xyJ5AmpW/7pDxYDSCfHE8LjGvukuwIsi
         FvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693494028; x=1694098828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maWUEzzcpZvbMut13ZGvpoiNO4A5EezHq+i4LSTx+aw=;
        b=hVfIZBXgNIxH/SyGVi4GXkEi1URbI080bm8vu+Uk8HcPBDzRk7iFuiYEI508HTQTag
         3wigNSztth1eIHC9dbA/t4Dvz84pCAEhwSK8/Ap6JHJmiOE9oQGWwy40C/r3Ik36nVbl
         KleVA6HeTC9VW4np33od4ZEdvrQKYpCT0NWeyWzfcowYYPNSUzWQGdIDgWMsjFzQ1RNZ
         EqiaBAIjJ+12SPsscmN1iM3gxfIR2SkthcbxsjDAo4NEV9l9ijPkLPiKY6+xheBOvS4v
         /ReAyh4+iwF880TfsTG7rPWiGqfyKMPBu7D/ePnfFDUm7eudLdW4BNKwYwi4gq1KB0p0
         3kRQ==
X-Gm-Message-State: AOJu0YzS9OJpZ/R3RjutqZE7czwVl45kdcBod4eezbBu6JS5+o7YgAvB
	DKNl/IWgXjtadDBVOnxRLqeP/EFSMBot2nx3uQ0=
X-Google-Smtp-Source: AGHT+IE1hpLVe8DANjvKF5ZIjP2uvUmv41a6THgq2EWWovkdh94ymOSF0VaLPqZX54sKVZhmZgC955Wm4gQkSj2A8QM=
X-Received: by 2002:a5e:980a:0:b0:792:82f8:6f90 with SMTP id
 s10-20020a5e980a000000b0079282f86f90mr6079936ioj.16.1693494028601; Thu, 31
 Aug 2023 08:00:28 -0700 (PDT)
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
 <CA+V-a8s67RrfpfpJd_tqBtk1d_zanbCLVWqCHhUirBYs1zey9A@mail.gmail.com> <CAMuHMdWkjtH0JJ6xOLBSUd7J-Jsd-vALtqmxiXrhtaQRO6cTHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWkjtH0JJ6xOLBSUd7J-Jsd-vALtqmxiXrhtaQRO6cTHQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 31 Aug 2023 15:59:37 +0100
Message-ID: <CA+V-a8saBGu4t99k+7KD5o4g0p-Ou+ztFdwVAwmkRjFGFk_X3Q@mail.gmail.com>
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

On Thu, Aug 31, 2023 at 2:24=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 31, 2023 at 3:02=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Aug 31, 2023 at 1:01=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, Aug 31, 2023 at 1:54=E2=80=AFPM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Thu, Aug 31, 2023 at 12:34=E2=80=AFPM Conor Dooley
> > > > <conor.dooley@microchip.com> wrote:
> > > > > On Thu, Aug 31, 2023 at 12:22:50PM +0100, Lad, Prabhakar wrote:
> > > > > > On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
> > > > > > <conor.dooley@microchip.com> wrote:
<snip>
> > Currently ARCH_R9A07G043 selects DMA_GLOBAL_POOL and we have
> > RISCV_DMA_NONCOHERENT selecting DMA_DIRECT_REMAP which causes below
> > build issue when MMU is disabled:
> >
> > kernel/dma/pool.c: In function 'atomic_pool_expand':
> > kernel/dma/pool.c:105:44: error: implicit declaration of function
> > 'pgprot_dmacoherent' [-Werror=3Dimplicit-function-declaration]
> >   105 |
> > pgprot_dmacoherent(PAGE_KERNEL),
> >       |                                            ^~~~~~~~~~~~~~~~~~
> > kernel/dma/pool.c:105:44: error: incompatible type for argument 3 of
> > 'dma_common_contiguous_remap'
> >   105 |
> > pgprot_dmacoherent(PAGE_KERNEL),
> >       |
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                                            |
> >       |                                            int
> > In file included from kernel/dma/pool.c:8:
>
> Hmm, kernel/dma/mapping.c has its use of pgprot_dmacoherent() inside
> an #ifdef CONFIG_MMU block.
> kernel/dma/pool.c has it inside an #ifdef CONFIG_DMA_DIRECT_REMAP block.
>
> I guess that select should get a dependency on MMU:
>
>     config RISCV_DMA_NONCOHERENT
>             select DMA_DIRECT_REMAP if MMU
>
> For comparison, m68k does take that into account:
>
>     select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
>
Thanks for the pointer. With this changes we dont get an unmet
dependencies warning.

arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaround':
arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't =
known
   29 |         struct sbiret ret;
      |                       ^~~
arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of
function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
   35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES,
ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
      |               ^~~~~~~~~
arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret'
[-Wunused-variable]
   29 |         struct sbiret ret;
      |                       ^~~
arch/riscv/errata/andes/errata.c:39:1: error: control reaches end of
non-void function [-Werror=3Dreturn-type]
   39 | }
      | ^
cc1: some warnings being treated as errors

To fix the above build issue reported by the bot, adding a dependency
for RISCV_SBI in ERRATA_ANDES won't help as ARCH_R9A07G043 is
explicitly selecting it. To avoid imply should explicitly select based
on dependency something like below?

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 92c779764b27..566bcefeab50 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -2,7 +2,7 @@ menu "CPU errata selection"

 config ERRATA_ANDES
     bool "Andes AX45MP errata"
-    depends on RISCV_ALTERNATIVE
+    depends on RISCV_ALTERNATIVE && RISCV_SBI
     help
       All Andes errata Kconfig depend on this Kconfig. Disabling
       this Kconfig will disable all Andes errata. Please say "Y"
@@ -12,7 +12,7 @@ config ERRATA_ANDES

 config ERRATA_ANDES_CMO
     bool "Apply Andes cache management errata"
-    depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
+    depends on ERRATA_ANDES && ARCH_R9A07G043
     select RISCV_DMA_NONCOHERENT
     default y
     help
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 67604f24973e..543300fe9862 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,10 +334,10 @@ if RISCV
 config ARCH_R9A07G043
     bool "RISC-V Platform support for RZ/Five"
     select ARCH_RZG2L
-    select AX45MP_L2_CACHE
+    select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
     select DMA_GLOBAL_POOL
-    select ERRATA_ANDES
-    select ERRATA_ANDES_CMO
+    select ERRATA_ANDES if RISCV_SBI
+    select ERRATA_ANDES_CMO if ERRATA_ANDES
     help
       This enables support for the Renesas RZ/Five SoC.

Or am I missing a simpler way to fix this.

Cheers,
Prabhakar
