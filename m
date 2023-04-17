Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440264C9A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681726735; x=1713262735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j90NrPShotCaZx7oLA6qnGzplSr/mn/dLWX6fn/QM3M=;
  b=ZTMQdkSbylxmyZzqtg0ThOxn9BxzfQ8HXNsNDpKUYr9ss7TFsswMvh8r
   Fcmj37RuszaeVhB48Sd3h2Av6ZI0xjxAQm88IcCMNVZT+qIMui02zHNV/
   uMkJ8gSgkq8iO5lqlCtBytIeQKnJ4hw7lG8K+zEQnzOy/4+TBXOw/ylbh
   cnMlGTSwAXGIqkdE+7XC3pCL+ADz0xJn8QNo/SC0TFh3ZhBfwELdg18zM
   +obRXNtzMo/rXEVKpObW/kBMbmJgYtcXoKS7y6q+enkDXyuO90rLZl7iP
   SvoG4UG3MuybeEKuTlgCU6EanXgpx2TL7tHVKnTFA3cYuxo+udAewMA1c
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677567600"; 
   d="asc'?scan'208";a="206819426"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Apr 2023 03:18:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Apr 2023 03:18:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Apr 2023 03:18:51 -0700
Date: Mon, 17 Apr 2023 11:18:35 +0100
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
Message-ID: <20230417-bolster-vitality-89d279146497@wendy>
References: <20230417074115.30786-1-hal.feng@starfivetech.com>
 <20230417074115.30786-2-hal.feng@starfivetech.com>
 <20230417-buckwheat-wilt-92a4e85a5ca0@wendy>
 <83c5a35a-c646-cbc7-83f9-c02fcb24e069@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UNJQkeLLzUY54mLk"
Content-Disposition: inline
In-Reply-To: <83c5a35a-c646-cbc7-83f9-c02fcb24e069@starfivetech.com>

--UNJQkeLLzUY54mLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 06:06:29PM +0800, Hal Feng wrote:
> On Mon, 17 Apr 2023 10:54:09 +0100, Conor Dooley wrote:
> > On Mon, Apr 17, 2023 at 03:41:14PM +0800, Hal Feng wrote:
> >> When (ARCH_STARFIVE [=3Dn] && COMPILE_TEST [=3Dy] && RESET_CONTROLLER =
[=3Dn]),
> >> RESET_STARFIVE_JH7110 can't be selected by CLK_STARFIVE_JH7110_SYS
> >> and CLK_STARFIVE_JH7110_AON.
> >>=20
> >> Considering RESET_STARFIVE_JH7110 is not a necessary option for compil=
ation
> >> test, we should select it only if ARCH_STARFIVE=3Dy. Also, delete redu=
ndant
> >> selected options of CLK_STARFIVE_JH7110_AON because these options are
> >> already selected by the dependency.
> >>=20
> >> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock =
driver")
> >> Fixes: b2ab3c94f41f ("clk: starfive: Add StarFive JH7110 always-on clo=
ck driver")
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  drivers/clk/starfive/Kconfig | 5 +----
> >>  1 file changed, 1 insertion(+), 4 deletions(-)
> >>=20
> >> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconf=
ig
> >> index 71c1148ee5f6..3fad4adee841 100644
> >> --- a/drivers/clk/starfive/Kconfig
> >> +++ b/drivers/clk/starfive/Kconfig
> >> @@ -26,7 +26,7 @@ config CLK_STARFIVE_JH7110_SYS
> >>  	depends on ARCH_STARFIVE || COMPILE_TEST
> >>  	select AUXILIARY_BUS
> >>  	select CLK_STARFIVE_JH71X0
> >> -	select RESET_STARFIVE_JH7110
> >> +	select RESET_STARFIVE_JH7110 if ARCH_STARFIVE
> >=20
> > Hmm, I don't really follow the logic above.
> > Why not just make the if be `if RESET_CONTROLLER` rather than
> > ARCH_STARFIVE?
> > I'm probably missing some obvious reason why not.
>=20
> Note that RESET_CONTROLLER is selected by ARCH_STARFIVE. Thanks.

Aye, just the explicit dependency seems like it'd be less fragile and
more obvious in the future.

--UNJQkeLLzUY54mLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD0c+wAKCRB4tDGHoIJi
0t0qAP0bDI0dkJnvMY43FLoFsCdFD9aKvpBWdIVKMFuU7DdCRgD+LYUvWpnj9rcQ
r3DR0VCbP4gpvyqBUR/uXruV26OQjgA=
=HWYz
-----END PGP SIGNATURE-----

--UNJQkeLLzUY54mLk--
