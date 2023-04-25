Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D937B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682424145; x=1713960145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ktZDAmJABhXIc6D5OVFisqlZkbF33qJIsMcwJhPUgkw=;
  b=PVGiYVaTPnh/z4xQ0sx10ZgtwlsJW0JB/83QEzCgAZpjlKqk57RYq3GT
   nCs0ZyrCXYY+PP5F1f6fb8Y8gNggczFwN4/SWRzlr/Ds7rsmFNQyywMhP
   6o3wESA/WxRlex1uAMGhmhNDjvbqGlEMRSyHWpjkjfjpvOpJshSpnu0Xq
   DppQgar1wQM3E1BIjqdEB8eOE6spbLAiZKYUWx/ZPXaGupJ8tVs0XOApZ
   foJipMm/UDCs5cMJ7MNPn3s9welskgise4JrT5WQ6rjKXl6UQnhGhXits
   j689T7tAhluwQco1hfDf7CE7mxd58FelnHVNHnT4FG+842vqFwFr5j4o5
   A==;
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; 
   d="asc'?scan'208";a="210584387"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Apr 2023 05:02:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 05:02:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Apr 2023 05:02:20 -0700
Date: Tue, 25 Apr 2023 13:02:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: <linux-clk@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-mm@kvack.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Paul Gazzillo <paul@pgazz.com>, Necip Fazil
 Yildiran <fazilyildiran@gmail.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] clk: starfive: Fix RESET_STARFIVE_JH7110 can't be
 selected in a specified case
Message-ID: <20230425-filtrate-nearby-f62515de1ec1@wendy>
References: <20230418123756.62495-1-hal.feng@starfivetech.com>
 <20230418123756.62495-2-hal.feng@starfivetech.com>
 <aab34ed5-5b83-7e90-0bf9-a24fdf4c55a5@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GHeW0EClyRQDEg0y"
Content-Disposition: inline
In-Reply-To: <aab34ed5-5b83-7e90-0bf9-a24fdf4c55a5@starfivetech.com>

--GHeW0EClyRQDEg0y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:53:04PM +0800, Hal Feng wrote:
> On Tue, 18 Apr 2023 20:37:56 +0800, Hal Feng wrote:
> > When (ARCH_STARFIVE [=3Dn] && COMPILE_TEST [=3Dy] && RESET_CONTROLLER [=
=3Dn]),
> > RESET_STARFIVE_JH7110 can't be selected by CLK_STARFIVE_JH7110_SYS
> > and CLK_STARFIVE_JH7110_AON.
> >=20
> > Add a condition `if RESET_CONTROLLER` to fix it. Also, delete redundant
> > selected options of CLK_STARFIVE_JH7110_AON because these options are
> > already selected by the dependency.
> >=20
> > Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock d=
river")
> > Fixes: b2ab3c94f41f ("clk: starfive: Add StarFive JH7110 always-on cloc=
k driver")
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>=20
> Hi, Stephen,
>=20
> Could this patch be merged into v6.4? Thanks.

Whoops, I thought I had replied to this a week ago. In case it helps,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Best regards,
> Hal
>=20
> > ---
> >  drivers/clk/starfive/Kconfig | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> > index 71c1148ee5f6..5d2333106f13 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -26,7 +26,7 @@ config CLK_STARFIVE_JH7110_SYS
> >  	depends on ARCH_STARFIVE || COMPILE_TEST
> >  	select AUXILIARY_BUS
> >  	select CLK_STARFIVE_JH71X0
> > -	select RESET_STARFIVE_JH7110
> > +	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> >  	default ARCH_STARFIVE
> >  	help
> >  	  Say yes here to support the system clock controller on the
> > @@ -35,9 +35,6 @@ config CLK_STARFIVE_JH7110_SYS
> >  config CLK_STARFIVE_JH7110_AON
> >  	tristate "StarFive JH7110 always-on clock support"
> >  	depends on CLK_STARFIVE_JH7110_SYS
> > -	select AUXILIARY_BUS
> > -	select CLK_STARFIVE_JH71X0
> > -	select RESET_STARFIVE_JH7110
> >  	default m if ARCH_STARFIVE
> >  	help
> >  	  Say yes here to support the always-on clock controller on the
>=20

--GHeW0EClyRQDEg0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEfBOgAKCRB4tDGHoIJi
0rbrAP0V0yJ1YNh+S+KxDVsTxngYTKlRNjGmYP5q5MQo37uTyAEA24mDl+HcIrF5
XyZakrHAwWpNtM6Z4Ux111f6UVJsRwQ=
=wdU7
-----END PGP SIGNATURE-----

--GHeW0EClyRQDEg0y--
