Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6A176255
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866161; cv=none; b=U+svfY9iomf0sc/EY/muERwktsZnT11/CW+OS2kRzO5b40giEuTbRLwbRuBvSqB+jbBPcdLYWWqWeAuVe8k3wo8d+kQxm0E0yqbFwj8duUVJpSVxNXHrlLC+fITlUzo/t7L2vOwl19/vuFypRxSQD57u3qUnluRyIlMSyJHlKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866161; c=relaxed/simple;
	bh=WkbqNcigGXb6YlWe49wJ2MneMwxBtf2+ekquSTb+6GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3ZX6W+jXJ8ElpfZpbH03aZtAVH9pCcDQ1WaNOTHC3Ryuf8tIicT2k8Y/GhNe3ajS2g2hoU3yCr3R91rOVfTBRRX/mJyMz7HGE+6I29GqCR+2UxlqwtNoaM/GNiIUdvU0JF72VZCc8C03s8IXS2hGbP/4BX3mLrgNPjR+psmxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1snYct-0005nF-Cz; Mon, 09 Sep 2024 09:15:55 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1snYcr-006b13-VE; Mon, 09 Sep 2024 09:15:53 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id AC891336514;
	Mon, 09 Sep 2024 07:15:53 +0000 (UTC)
Date: Mon, 9 Sep 2024 09:15:53 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 9160/10296] ERROR: modpost: "__divdi3"
 [drivers/net/can/rockchip/rockchip_canfd.ko] undefined!
Message-ID: <20240909-proficient-ancient-iguana-c16ff3-mkl@pengutronix.de>
References: <202409072304.lCQWyNLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygtie3rpn7qkt7tq"
Content-Disposition: inline
In-Reply-To: <202409072304.lCQWyNLU-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild-all@lists.linux.dev


--ygtie3rpn7qkt7tq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07.09.2024 23:29:49, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> commit: 4e1a18bab1244204f873103eef1c0c88f794be85 [9160/10296] can: rockch=
ip_canfd: add hardware timestamping support
> config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/2024=
0907/202409072304.lCQWyNLU-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240907/202409072304.lCQWyNLU-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409072304.lCQWyNLU-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_=
mutex.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imx=
rt1050.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_performance.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_powersave.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_userspace.o
> >> ERROR: modpost: "__divdi3" [drivers/net/can/rockchip/rockchip_canfd.ko=
] undefined!

Good Bot!

fixed with: https://patch.msgid.link/20240909-can-rockchip_canfd-fix-64-bit=
-division-v1-1-2748d9422b00@pengutronix.de

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ygtie3rpn7qkt7tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmbeoKYACgkQKDiiPnot
vG+a6Qf/alzx9jLkOiiqV2aoFHjONdmSM0ICMXsJB77Y4vn3iaiSdwaEhqkBD4e7
W6PcIs5WKTGZBeJqpFVCONNUNZVh3OyC0uvNPJJkHBRax0JjwqlH1LNHjzfYKzdk
c/rEQsfpDGrL60GEsRhmOJcwF3VPwHsrSkWgVaUPikStAeq3VsMwKjGy9ZXiIa3t
vFIxD1KPZIWO6TdodelspM9EV+T76twMtO01nPS86FLluZd1lIqZTO1+lVzlM7Cf
P/h2CTd+7mxvikE2NQFzaJ6dG/0JmCbTMU1WOeg/drILaOeNX2V7EPUHT9cYUcnf
GSD/w1MBWV5vQF2B7S6sNuJBfMgOGg==
=7/Im
-----END PGP SIGNATURE-----

--ygtie3rpn7qkt7tq--
