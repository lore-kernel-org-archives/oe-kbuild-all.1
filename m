Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4779F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693481675; x=1725017675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aFapu2wzHsQUwh9wHN+w40P5tsB+oKfwhLNA8baR4Ic=;
  b=xXNZzQxCk+7935g7Ei4cyOZIg8zi0UtxjM8aEExcX97+TQ2XZlGN6BdV
   ruYBLynsxa3jkpm2tvkdl1ssOpxtaYziw8IGOQaYOSVtw3zaRREvCDhbw
   6/rgUPd7pzzhegiZ5KDWErfv8hTXPTIKn5SayU9b7bMW3Bm8+bOp/e9Zk
   th5GSUOSMm1xHMZQYC2l/4zAvzJkq3tFnuo26gWHBoROIhdK8ryyioQu5
   2mT7vW5ViTaGoMteTN8/SFdXeOE+iqmDhZsQku9reHL1O2uycFrBXLARD
   tZgsBivmXmiYuGfuLB/3b1mqsP0QDrTb2ZGmr2JUvsXJ/sWLx0Ut4h1+C
   w==;
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="asc'?scan'208";a="169242918"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2023 04:34:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 31 Aug 2023 04:34:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 31 Aug 2023 04:34:30 -0700
Date: Thu, 31 Aug 2023 12:33:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, kernel test robot
	<lkp@intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master
 13230/13643] arch/riscv/errata/andes/errata.c:29:23: error: storage size of
 'ret' isn't known
Message-ID: <20230831-imperial-surviving-afdf6d275388@wendy>
References: <202308311610.ec6bm2G8-lkp@intel.com>
 <20230831-congested-monument-44ddb496204d@wendy>
 <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="urOk9nLuj+RcA2yU"
Content-Disposition: inline
In-Reply-To: <CA+V-a8thx2qah2gJVG6mmrSCtnLTBRFS7fr+cpTMU-6RpqoaTQ@mail.gmail.com>

--urOk9nLuj+RcA2yU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 12:22:50PM +0100, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> On Thu, Aug 31, 2023 at 10:44=E2=80=AFAM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> >
> > On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> > > commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv:=
 errata: Add Andes alternative ports
> > > config: riscv-randconfig-001-20230831 (https://download.01.org/0day-c=
i/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8=
-lkp@intel.com/
> > >
> > > All error/warnings (new ones prefixed by >>):
> > >
> > >    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_work=
around':
> > > >> arch/riscv/errata/andes/errata.c:29:23: error: storage size of 're=
t' isn't known
> > >       29 |         struct sbiret ret;
> > >          |                       ^~~
> > > >> arch/riscv/errata/andes/errata.c:35:15: error: implicit declaratio=
n of function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
> > >       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_S=
BI_EXT_IOCP_SW_WORKAROUND,
> > >          |               ^~~~~~~~~
> > > >> arch/riscv/errata/andes/errata.c:29:23: warning: unused variable '=
ret' [-Wunused-variable]
> > >       29 |         struct sbiret ret;
> > >          |                       ^~~
> > >    cc1: some warnings being treated as errors
> > >
> > >
> > > vim +29 arch/riscv/errata/andes/errata.c
> > >
> > >     26
> > >     27        static long ax45mp_iocp_sw_workaround(void)
> > >     28        {
> > >   > 29                struct sbiret ret;
> > >     30
> > >     31                /*
> > >     32                 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT che=
cks if the IOCP is missing and
> > >     33                 * cache is controllable only then CMO will be =
applied to the platform.
> > >     34                 */
> > >   > 35                ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDE=
S_SBI_EXT_IOCP_SW_WORKAROUND,
> > >     36                                0, 0, 0, 0, 0, 0);
> > >     37
> > >     38                return ret.error ? 0 : ret.value;
> > >     39        }
> > >     40
> >
> > Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO will need
> > to grow a dependency on RISCV_SBI.
> I think adding dependency for RISCV_SBI on ERRATA_ANDES would be a good i=
dea.
>=20
> While at it I am seeing below warnings with this randconfig:
> WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
>   Depends on [n]: ERRATA_ANDES [=3Dy] && MMU [=3Dn] && ARCH_R9A07G043 [=
=3Dy]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
>   Depends on [n]: RISCV_DMA_NONCOHERENT [=3Dn]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy]
> configuration written to .config
>=20
> *** End of the configuration.
> *** Execute 'make' to start the build or try 'make help'.
>=20
> For which I will send the below fix:
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -334,10 +334,10 @@ if RISCV
>  config ARCH_R9A07G043
>      bool "RISC-V Platform support for RZ/Five"
>      select ARCH_RZG2L
> -    select AX45MP_L2_CACHE
> +    imply AX45MP_L2_CACHE
>      select DMA_GLOBAL_POOL
> -    select ERRATA_ANDES
> -    select ERRATA_ANDES_CMO
> +    imply ERRATA_ANDES
> +    imply ERRATA_ANDES_CMO
>      help
>        This enables support for the Renesas RZ/Five SoC.

I've only ever heard bad things from Arnd about using imply.

Why don't you just make the erratum config option select
RISCV_DMA_NONCOHERENT, just like the THEAD_CMO erratum does?
The cache driver should probably then depend on the erratum Kconfig
option, since there's no point in having it otherwise?

--urOk9nLuj+RcA2yU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPB6mwAKCRB4tDGHoIJi
0kGvAP9ybdfClhDRmiBy0YULH+tI/yizqM4J7yaSTXrF74by7AEAxMFWW1R0xEiF
jg+FaeKo7shHTcbzeUNwYCBQYEE0YgQ=
=0b9u
-----END PGP SIGNATURE-----

--urOk9nLuj+RcA2yU--
