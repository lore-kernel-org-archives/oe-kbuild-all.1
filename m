Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946D38BA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T44TYV8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7833EC433C9;
	Fri, 27 Oct 2023 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698422963;
	bh=32DaPpQ2+GGDuCnPPq4gjkvUJNBaDefp5jSQJmVDdM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T44TYV8pgAjl04XUPa/dTxwEtXG3ZzogUt4Q7uHtIFH9WU+2J8gyA77H3BpXD3p1g
	 526/A0xz0Hbc3fi7o6rjJgn8Vqxpgjo0X5ZxDlQEzSC8gLFC7asIAdSRPOKlByJTzf
	 0vSOgdyZTtCWk6Ts6hAWEPVqSpITEm4Vy4FLBjAwv0uL+R1IGiRBZ+v+CY8710mu/B
	 pjXe8FvvccGKsjfmsdFJMbjrrgMU4UYO11ZRVMVJNcIph7+hP4+jmha20u6cLm/gzL
	 AhQ5neluUalg0xAZAKzcOXKFpGvgecRHP/YqslBuxz0QRcxqPyyCoK/bZ//kcvL/Wd
	 3FOPp8QQRmWSA==
Date: Fri, 27 Oct 2023 17:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: kernel test robot <lkp@intel.com>, Eberhard Stoll <estl@gmx.net>,
	Han Xu <han.xu@nxp.com>, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 4/4] spi: spi-fsl-qspi: Add support for rx data sample
 point adjustment
Message-ID: <ZTvgJMsPgxfqxY2S@finisterre.sirena.org.uk>
References: <20231026152316.2729575-5-estl@gmx.net>
 <202310270332.mcbckKCr-lkp@intel.com>
 <abf335aa-1366-4c66-80f1-86e273143702@kontron.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DPWNaVop7Q2nZF4X"
Content-Disposition: inline
In-Reply-To: <abf335aa-1366-4c66-80f1-86e273143702@kontron.de>
X-Cookie: Save energy:  Drive a smaller shell.


--DPWNaVop7Q2nZF4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 27, 2023 at 08:51:49AM +0200, Frieder Schrempf wrote:
> On 26.10.23 22:03, kernel test robot wrote:

> >    drivers/spi/spi-fsl-qspi.c: In function 'fsl_qspi_select_mem':
> >>> drivers/spi/spi-fsl-qspi.c:558:38: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
> >      558 |         if (chip->rx_sample_delay_ns != spi->rx_sample_delay_ns |
> >          |             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~

> IIRC, when I prepared the patches for sending "checkpatch.pl --strict"
> suggested to remove the parentheses here. Seems a bit inconsistent...

Ignore chekpatch, and it does look like as well as parentheses you
should have used || not | here.

--DPWNaVop7Q2nZF4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU74CMACgkQJNaLcl1U
h9BnVgf9GY8BWySvtZ5d2AGwW76SozOSOKRpaczcNAXQI15bsOPsCiF9Yi2K6sej
hrx1DGKrtfZMiEINFgU47bM1Jm7B9DcI7LO1QZD26xcdBw0xkupHoPmiGjdHk3nw
Gb4tpZTci6NJAwbmCBvPRVrLEMjqQQKI0zYNC3O02s5dDbKnm9HMsuVCQ87UgUG7
uY2mkDZLEtceLojHnaS//JuUxGiGqRnBz2z3gwHg8RWUlzTV68ZH2Tb/fgQzc66B
PHfbWMFtQ5esveWTsp5/sqhMgD+RfMtc7xtZmqMBz43AxpBpJGlHLL6mhcCPVotw
kunJyE2e5jm7GKVCVt+w9nFATLDM+w==
=pjbf
-----END PGP SIGNATURE-----

--DPWNaVop7Q2nZF4X--
