Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7839C210A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693473460; x=1725009460;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=DaO9T36MMNfmfMeRgqvAUa9URoi+h0X+g8+mWQowBdE=;
  b=Zj0mGJOTbRUiC3qrVlgzYN6KmfbnC7Wguunj+LiqeLzQakBizGIgVQ+H
   ni2dH4vURqD7h8DWSVnJmnZIGnDZKnBZO+5oqsFckAaSMsJcALH/LLU7K
   1+RM6fyiwuhSHVUvRIN6GYc9pnpD5JFs4b2G5YsMHlSHAoTNo63yzZn9g
   naUQcwVUOtuj6P+Kf6JgUqj/xH9c4koTrvCNOiIo9RQrOPLV4PYx75hpP
   OyK+6VTT96UyPzalKpNY2QtVizzUP+2+8y0OgplQb8fI11LJ5WEfUqmiP
   CZ3J39gCBMZUqw6Nxw0oeaz5PLP41VQeB4G/ZVwKhmFQP6xTQVqNJldZu
   A==;
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="asc'?scan'208";a="169227944"
X-Amp-Result: UNSCANNABLE
Subject: [WARNING: ATTACHMENT UNSCANNED]Re: [linux-next:master 13230/13643]
 arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't
 known
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2023 02:17:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 31 Aug 2023 02:17:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 31 Aug 2023 02:17:25 -0700
Date: Thu, 31 Aug 2023 10:16:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: kernel test robot <lkp@intel.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <20230831-congested-monument-44ddb496204d@wendy>
References: <202308311610.ec6bm2G8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jEaJa9Ge9iLC/T33"
Content-Disposition: inline
In-Reply-To: <202308311610.ec6bm2G8-lkp@intel.com>

--jEaJa9Ge9iLC/T33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 04:52:00PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv: err=
ata: Add Andes alternative ports
> config: riscv-randconfig-001-20230831 (https://download.01.org/0day-ci/ar=
chive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp=
@intel.com/
>=20
> All error/warnings (new ones prefixed by >>):
>=20
>    arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workarou=
nd':
> >> arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' i=
sn't known
>       29 |         struct sbiret ret;
>          |                       ^~~
> >> arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of=
 function 'sbi_ecall' [-Werror=3Dimplicit-function-declaration]
>       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_E=
XT_IOCP_SW_WORKAROUND,
>          |               ^~~~~~~~~
> >> arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret'=
 [-Wunused-variable]
>       29 |         struct sbiret ret;
>          |                       ^~~
>    cc1: some warnings being treated as errors
>=20
>=20
> vim +29 arch/riscv/errata/andes/errata.c
>=20
>     26=09
>     27	static long ax45mp_iocp_sw_workaround(void)
>     28	{
>   > 29		struct sbiret ret;
>     30=09
>     31		/*
>     32		 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is=
 missing and
>     33		 * cache is controllable only then CMO will be applied to the pla=
tform.
>     34		 */
>   > 35		ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_=
WORKAROUND,
>     36				0, 0, 0, 0, 0, 0);
>     37=09
>     38		return ret.error ? 0 : ret.value;
>     39	}
>     40=09

Looks like the config doesn't enable SBI, so ERRATA_ANDES_CMO will need
to grow a dependency on RISCV_SBI.

--jEaJa9Ge9iLC/T33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPBaegAKCRB4tDGHoIJi
0vqvAP4qqC/M++PPeaMwTLDhUZZjXmvN4Inf9/2hXVkCtOyk1gEAzRg/R7rShQwO
9wh1zyjnXMhedkmLkqmZpYpAIbaMwwM=
=mAw2
-----END PGP SIGNATURE-----

--jEaJa9Ge9iLC/T33--
