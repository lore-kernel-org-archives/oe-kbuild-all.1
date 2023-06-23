Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540015BD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 06:53:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qCafl-0002UG-HG; Fri, 23 Jun 2023 08:53:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qCafi-009RYZ-P8; Fri, 23 Jun 2023 08:53:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qCafh-00Geru-PI; Fri, 23 Jun 2023 08:53:29 +0200
Date: Fri, 23 Jun 2023 08:53:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [daniel-lezcano:timers/drivers/next 6/9]
 drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No such
 file or directory
Message-ID: <20230623065329.mrjplb3vplfpuky4@pengutronix.de>
References: <202306231333.gPkThiXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2wxzncszn6w7zlx"
Content-Disposition: inline
In-Reply-To: <202306231333.gPkThiXk-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild-all@lists.linux.dev


--a2wxzncszn6w7zlx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 23, 2023 at 01:45:45PM +0800, kernel test robot wrote:
> tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/=
next
> head:   6d0eb9759ac71fb5d008c90c0810d142f5a3ce99
> commit: 9e9d7570485d724838322714cd413eb90d9459f4 [6/9] clocksource/driver=
s/imx-gpt: Fold <soc/imx/timer.h> into its only user
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/2023062=
3/202306231333.gPkThiXk-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231333=
=2EgPkThiXk-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306231333.gPkThiXk-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No su=
ch file or directory
>       14 | #include <soc/imx/timer.h>
>          |          ^~~~~~~~~~~~~~~~~
>    compilation terminated.
> --
> >> drivers/clk/imx/clk-imx35.c:13:10: fatal error: soc/imx/timer.h: No su=
ch file or directory
>       13 | #include <soc/imx/timer.h>

I think happens because
https://lore.kernel.org/r/20230328100531.879485-3-u.kleine-koenig@pengutron=
ix.de
was applied, but its prerequisite patch https://lore.kernel.org/r/202303281=
00531.879485-2-u.kleine-koenig@pengutronix.de
=66rom the same series was not.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--a2wxzncszn6w7zlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSVQWgACgkQj4D7WH0S
/k5wGQf+LUsqIRh5DgTEu4ZYmLCQvEnFzBtyVGUbjfUs+GIOY0/VHNaRjnVAQ2iu
TKvsZkIgd99J1PliBjdClOH/YCCBGpVtwFRDEEtTdb5cdmjsqtdgipokuH1DDMOG
2BHynIERHhUiNSxf7tB8s0f7L1RgHsZejBLBnSyq2o5H5Zo8NAAEAG1WwPbK/pbN
umWv4icd6ef1dS3fkBa5lTOFFmhxbkyOEjr/zpv+vBTEAyR510vj4C+Hy+s3QUTZ
l4McNh/kW7A8JLyhhVtUB6SYouNEUhfUaQoNQ4yX6b8bUtW+r82wh+VhgS1SvOOk
JDwaSezyYIy0bCyeX37hE1X6SzTkdg==
=LsyI
-----END PGP SIGNATURE-----

--a2wxzncszn6w7zlx--
