Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB97C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681453398; x=1712989398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5wSlteKHrySkQy3JYosn2+6VaLPgFPsoqMhsH4nLPm0=;
  b=FH+5Thtz9pwfVNe20b47SEsve1K8XVD+Z/t6pW9SF71iEqT4B6LnmiME
   YLUkbt5vLAmsqqaVD7G9Js9iyP6uC+uNVpO1W9PT23hroZ1TqAdwxYMQ6
   Y6lCiSeuS2ErcYv+dN6iECsebF9+IdrYH1CgchoSRhGXhqMB2kT/UWDZs
   0Ov0pcNDcFXuJeAWMpvyoqTXyg+24DOMp6fYlsiB88frvLVWZz/TsH8YP
   /gM9uGcq9JBxH7OdvFjpshKWXAkvljF1e0+wbBBFA5Q/AIgdcCm4U0vxX
   yomZyYrQNy7/fnxb0WBiVYnDBmmSSY1vc7INAbuMBI5+mn4gdLAwQz2b3
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,195,1677567600"; 
   d="asc'?scan'208";a="206486706"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2023 23:23:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Apr 2023 23:23:07 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Apr 2023 23:23:05 -0700
Date: Fri, 14 Apr 2023 07:22:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: kernel test robot <lkp@intel.com>
CC: Hal Feng <hal.feng@starfivetech.com>, Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: Re: [linux-next:master 8653/11447] kismet: WARNING: unmet direct
 dependencies detected for RESET_STARFIVE_JH7110 when selected by
 CLK_STARFIVE_JH7110_SYS
Message-ID: <20230414-spiritism-nape-b5c340dfb4e7@wendy>
References: <202304140706.aOBNhUj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KZDiyHx948qHsreG"
Content-Disposition: inline
In-Reply-To: <202304140706.aOBNhUj2-lkp@intel.com>

--KZDiyHx948qHsreG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hal,

Could you please submit a fix for this?

Cheers,
Conor.

On Fri, Apr 14, 2023 at 07:55:32AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
> commit: 82327b127d4117e5b867cca945f97a5074aef786 [8653/11447] reset: star=
five: Add StarFive JH7110 reset driver
> config: csky-kismet-CONFIG_RESET_STARFIVE_JH7110-CONFIG_CLK_STARFIVE_JH71=
10_SYS-0-0 (https://download.01.org/0day-ci/archive/20230414/202304140706.a=
OBNhUj2-lkp@intel.com/config)
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit/commit/?id=3D82327b127d4117e5b867cca945f97a5074aef786
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 82327b127d4117e5b867cca945f97a5074aef786
>         # 1. reproduce by kismet
>            # install kmax per https://github.com/paulgazz/kmax/blob/maste=
r/README.md
>            kismet --linux-ksrc=3Dlinux --selectees CONFIG_RESET_STARFIVE_=
JH7110 --selectors CONFIG_CLK_STARFIVE_JH7110_SYS -a=3Dcsky
>         # 2. reproduce by make
>            # save the config file to linux source tree
>            cd linux
>            make ARCH=3Dcsky olddefconfig
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304140706.aOBNhUj2-lkp@i=
ntel.com/
>=20
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for RESET_STARFIVE=
_JH7110 when selected by CLK_STARFIVE_JH7110_SYS
>    .config:4526:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' inval=
id for ARCH_MMAP_RND_BITS
>   =20
>    WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110
>      Depends on [n]: RESET_CONTROLLER [=3Dn] && AUXILIARY_BUS [=3Dy] && C=
LK_STARFIVE_JH7110_SYS [=3Dy]
>      Selected by [y]:
>      - CLK_STARFIVE_JH7110_SYS [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_STARF=
IVE || COMPILE_TEST [=3Dy])
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

--KZDiyHx948qHsreG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDjxNQAKCRB4tDGHoIJi
0jnfAQCsZbKP9zdjglaSnEXnPDMmSwynESOkCjdAJ9j0vD0dbgD+PV33vQeYCppQ
wSZy90DhVc7GHSuJZFnp+sJCEJ+sPQI=
=Tt01
-----END PGP SIGNATURE-----

--KZDiyHx948qHsreG--
