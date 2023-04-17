Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BD2586
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 09:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681725277; x=1713261277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7IKmUrUbmAjjOroL5Mi4bl0RbwHdhJ3Qea7NbVaNjsA=;
  b=Gn2E0Zj0xFvK0+5BvHjCgjqLfTezHBfQfl3WLNHOOQgZew9QDb+ktVKF
   1RypXV3a0Ow46UQYSk1V6niXFpTg2tjK72fCHRS+xWTf7lT5QXEKleie+
   X+ex1ZazB2MngrJj480PJOaA4mtWz6Ty2w0CvoMeCqoNUq9CQDixmH34S
   dQE2I9IFkkpAQuslMe7AX7nwT2dIHYL8JVlj1C/iTQRHTHVy6doYaAPFK
   LoFkZBT9GP3hkcpNVFm1GPWTv6TN/CGCYJeZBwDbkIb/qWxuOVf4Gf6s/
   RZCBl6bQ8A3HUYzZVMKO6CQ5xm9M3hyopgfvO4yjHL+yYhFvsRek75+th
   g==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677567600"; 
   d="asc'?scan'208";a="147379595"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Apr 2023 02:54:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Apr 2023 02:54:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Apr 2023 02:54:25 -0700
Date: Mon, 17 Apr 2023 10:54:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: <linux-clk@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-mm@kvack.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Paul Gazzillo <paul@pgazz.com>, Necip Fazil
 Yildiran <fazilyildiran@gmail.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] clk: starfive: Fix RESET_STARFIVE_JH7110 can't be
 selected in a specified case
Message-ID: <20230417-buckwheat-wilt-92a4e85a5ca0@wendy>
References: <20230417074115.30786-1-hal.feng@starfivetech.com>
 <20230417074115.30786-2-hal.feng@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4HqbxmHeCq5x71ZE"
Content-Disposition: inline
In-Reply-To: <20230417074115.30786-2-hal.feng@starfivetech.com>

--4HqbxmHeCq5x71ZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 03:41:14PM +0800, Hal Feng wrote:
> When (ARCH_STARFIVE [=3Dn] && COMPILE_TEST [=3Dy] && RESET_CONTROLLER [=
=3Dn]),
> RESET_STARFIVE_JH7110 can't be selected by CLK_STARFIVE_JH7110_SYS
> and CLK_STARFIVE_JH7110_AON.
>=20
> Considering RESET_STARFIVE_JH7110 is not a necessary option for compilati=
on
> test, we should select it only if ARCH_STARFIVE=3Dy. Also, delete redunda=
nt
> selected options of CLK_STARFIVE_JH7110_AON because these options are
> already selected by the dependency.
>=20
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
> Fixes: b2ab3c94f41f ("clk: starfive: Add StarFive JH7110 always-on clock =
driver")
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 71c1148ee5f6..3fad4adee841 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -26,7 +26,7 @@ config CLK_STARFIVE_JH7110_SYS
>  	depends on ARCH_STARFIVE || COMPILE_TEST
>  	select AUXILIARY_BUS
>  	select CLK_STARFIVE_JH71X0
> -	select RESET_STARFIVE_JH7110
> +	select RESET_STARFIVE_JH7110 if ARCH_STARFIVE

Hmm, I don't really follow the logic above.
Why not just make the if be `if RESET_CONTROLLER` rather than
ARCH_STARFIVE?
I'm probably missing some obvious reason why not.

Cheers,
Conor.

>  	default ARCH_STARFIVE
>  	help
>  	  Say yes here to support the system clock controller on the
> @@ -35,9 +35,6 @@ config CLK_STARFIVE_JH7110_SYS
>  config CLK_STARFIVE_JH7110_AON
>  	tristate "StarFive JH7110 always-on clock support"
>  	depends on CLK_STARFIVE_JH7110_SYS
> -	select AUXILIARY_BUS
> -	select CLK_STARFIVE_JH71X0
> -	select RESET_STARFIVE_JH7110
>  	default m if ARCH_STARFIVE
>  	help
>  	  Say yes here to support the always-on clock controller on the
> --=20
> 2.38.1
>=20

--4HqbxmHeCq5x71ZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD0XQAAKCRB4tDGHoIJi
0rY9AP9ofdEH/qXRLOt97E7lHIo0soJkVo2xSIy6xiugYzf6MgEA8rXhn0dYFMRe
3LI6GDM5MHGdtnwkhboCM7rEtr+jvAo=
=rK9S
-----END PGP SIGNATURE-----

--4HqbxmHeCq5x71ZE--
