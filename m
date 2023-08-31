Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866048F7A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 16:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48193C433C8;
	Thu, 31 Aug 2023 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693499769;
	bh=DbkjI5fCXetjSSIuXgR1W10vvZtbaLuMnAXzmZwx0No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggwI8/8r/YjQPSCQqeAsq0oi1BQP8suGaV/p0BPlpLrSxDrsQNDRHIzjlXFizRYHs
	 ugbqcQVb/YdXZ3tSJC4UH/V1l3LkYEO0ErN70Fv4NbbU5y/W/s5+J/gofRdv5fQGxG
	 AMFNrPL76t0SvvWNILqT4/FRAcuZ3xthyh4CpBShTwJ7sM8GZM35WzpnZzJqcdZUxz
	 Kv5fOOSnSJ/neza9ILZLd8DAMd9ifGFvsdJ8D9ZBdBT0N9dzun1LCKUXOR5sB+NLlq
	 713eIDMsokt18O7+BxEF51VMKUw/n0t0tKy4dCcH5ZO3nqqdqSKZnMW3YX+UWc2f3e
	 n/wfaZ+fJtMCA==
Date: Thu, 31 Aug 2023 17:36:05 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
Message-ID: <20230831-nimble-rust-00821dccffdf@spud>
References: <202308311610.ec6bm2G8-lkp@intel.com>
 <20230831-congested-monument-44ddb496204d@wendy>
 <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>
 <20230831-imperial-surviving-afdf6d275388@wendy>
 <CA+V-a8vT-LLsUOf+E1g4L+JBnFBn2SGhpDavHRS6k8DduK3KNQ@mail.gmail.com>
 <CAMuHMdWXDVpQeTD-ZdJi2Nk1JUgmSvaBfGUo-CtKpJDKXUdu0A@mail.gmail.com>
 <CA+V-a8s67RrfpfpJd_tqBtk1d_zanbCLVWqCHhUirBYs1zey9A@mail.gmail.com>
 <CAMuHMdWkjtH0JJ6xOLBSUd7J-Jsd-vALtqmxiXrhtaQRO6cTHQ@mail.gmail.com>
 <CA+V-a8saBGu4t99k+7KD5o4g0p-Ou+ztFdwVAwmkRjFGFk_X3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0ZWLegoGS3NBH/qw"
Content-Disposition: inline
In-Reply-To: <CA+V-a8saBGu4t99k+7KD5o4g0p-Ou+ztFdwVAwmkRjFGFk_X3Q@mail.gmail.com>


--0ZWLegoGS3NBH/qw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 03:59:37PM +0100, Lad, Prabhakar wrote:

> > > Currently ARCH_R9A07G043 selects DMA_GLOBAL_POOL and we have
> > > RISCV_DMA_NONCOHERENT selecting DMA_DIRECT_REMAP which causes below
> > > build issue when MMU is disabled:
> > >
> > > kernel/dma/pool.c: In function 'atomic_pool_expand':
> > > kernel/dma/pool.c:105:44: error: implicit declaration of function
> > > 'pgprot_dmacoherent' [-Werror=3Dimplicit-function-declaration]
> > >   105 |
> > > pgprot_dmacoherent(PAGE_KERNEL),
> > >       |                                            ^~~~~~~~~~~~~~~~~~
> > > kernel/dma/pool.c:105:44: error: incompatible type for argument 3 of
> > > 'dma_common_contiguous_remap'
> > >   105 |
> > > pgprot_dmacoherent(PAGE_KERNEL),
> > >       |
> > > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >       |                                            |
> > >       |                                            int
> > > In file included from kernel/dma/pool.c:8:
> >
> > Hmm, kernel/dma/mapping.c has its use of pgprot_dmacoherent() inside
> > an #ifdef CONFIG_MMU block.
> > kernel/dma/pool.c has it inside an #ifdef CONFIG_DMA_DIRECT_REMAP block.
> >
> > I guess that select should get a dependency on MMU:
> >
> >     config RISCV_DMA_NONCOHERENT
> >             select DMA_DIRECT_REMAP if MMU
> >
> > For comparison, m68k does take that into account:
> >
> >     select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> >
> Thanks for the pointer. With this changes we dont get an unmet
> dependencies warning.
>=20
> arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaround':
> arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn'=
t known
>    29 |         struct sbiret ret;
>       |                       ^~~
> arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of
> function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
>    35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES,
> ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
>       |               ^~~~~~~~~
> arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret'
> [-Wunused-variable]
>    29 |         struct sbiret ret;
>       |                       ^~~
> arch/riscv/errata/andes/errata.c:39:1: error: control reaches end of
> non-void function [-Werror=3Dreturn-type]
>    39 | }
>       | ^
> cc1: some warnings being treated as errors
>=20
> To fix the above build issue reported by the bot, adding a dependency
> for RISCV_SBI in ERRATA_ANDES won't help as ARCH_R9A07G043 is
> explicitly selecting it. To avoid imply should explicitly select based
> on dependency something like below?
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 92c779764b27..566bcefeab50 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -2,7 +2,7 @@ menu "CPU errata selection"
>=20
>  config ERRATA_ANDES
>      bool "Andes AX45MP errata"
> -    depends on RISCV_ALTERNATIVE
> +    depends on RISCV_ALTERNATIVE && RISCV_SBI
>      help
>        All Andes errata Kconfig depend on this Kconfig. Disabling
>        this Kconfig will disable all Andes errata. Please say "Y"
> @@ -12,7 +12,7 @@ config ERRATA_ANDES
>=20
>  config ERRATA_ANDES_CMO
>      bool "Apply Andes cache management errata"
> -    depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
> +    depends on ERRATA_ANDES && ARCH_R9A07G043
>      select RISCV_DMA_NONCOHERENT
>      default y
>      help
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 67604f24973e..543300fe9862 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -334,10 +334,10 @@ if RISCV
>  config ARCH_R9A07G043
>      bool "RISC-V Platform support for RZ/Five"
>      select ARCH_RZG2L
> -    select AX45MP_L2_CACHE
> +    select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
>      select DMA_GLOBAL_POOL
> -    select ERRATA_ANDES
> -    select ERRATA_ANDES_CMO
> +    select ERRATA_ANDES if RISCV_SBI
> +    select ERRATA_ANDES_CMO if ERRATA_ANDES
>      help
>        This enables support for the Renesas RZ/Five SoC.
>=20
> Or am I missing a simpler way to fix this.

This seems reasonable to me at least /shrug

--0ZWLegoGS3NBH/qw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPDBdAAKCRB4tDGHoIJi
0nPgAP9y4+oZNdjct60KvEmHHZwE1zqeZf2Ee4XFCJIHFiUf0QEA2pn5RbzQQXYO
Fv+B1/EnTwmZpAx5zwp1iyKEs4mvjAw=
=CuAP
-----END PGP SIGNATURE-----

--0ZWLegoGS3NBH/qw--
