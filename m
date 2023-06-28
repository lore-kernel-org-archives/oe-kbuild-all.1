Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94197322E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 16:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C74C433C8;
	Wed, 28 Jun 2023 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687971412;
	bh=qgf5FOtoDVpdjZsOaE1RhcDabfgWbVLagbas/qMccuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wvf/gUcRm2eG63dyGycFEhQe/F5vVj7bZqE7SW1PoIjqhVHZL1CXinj5z0e6Geqi7
	 MaMaIazTZEs7RVaLbWjuM7pHRIL8c+kalRFZyv2/7UZhxWu9GJ9HhnStsUVgeTfEfk
	 GT9Ncp8l+Y5GbMNyoyc1Pyapie3xqSeI6UO5D7Y9F/V8qBYrnnFQCiPiNqM12mAQuL
	 FTv9Aqt3lOPPfGntOyQzJdw/JYMB4vt+vl2XZgz3434JlqpEV0kccMehqU8bo1vXy/
	 uIuhMzh8uJeM86R68/Xaf6KTtBdjCZVWRsTklP6dq4P9bkveLrT5VbWKfrG5vqb/cY
	 xcp+iItp4wv7w==
Date: Wed, 28 Jun 2023 17:56:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [linux-next:master 11663/12731] ERROR: modpost:
 "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
Message-ID: <d9bdf8ba-ccdc-4203-a0ee-0559448fb865@sirena.org.uk>
References: <202306282012.sPQAuAN7-lkp@intel.com>
 <OS0PR01MB5922893DE97EAAD6BAA142558624A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9CvWt+5KXhPjnzp"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922893DE97EAAD6BAA142558624A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Cookie: HELLO, everybody, I'm a HUMAN!!


--s9CvWt+5KXhPjnzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 03:47:19PM +0000, Biju Das wrote:
> Hi All,
>=20
> I have come up with two solutions for fixing this issue.
>=20
> Please suggest which solution, I should submit.
>=20
> First solution allows to build the driver for m68k architecture,
> whereas the second solution skips it.

Either is fine for me.

--s9CvWt+5KXhPjnzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmScZk4ACgkQJNaLcl1U
h9BQLwf+OpR5EwMwSQHwK+whmfuKLIAYFE94wBFef0ddW26MYs08e2Voc1FxaCz2
MZ6OHxtyjOChKtV4uP7/aVwPtYKWjwLtgn5zJjLIPdh8suf7HueQ8w0aWgGwKUmt
mwUmHHy3icu/riazu/RmtSCmcKqqTQ89xKfpRdkttPrOYm6pptFRejN/JWGg5dKo
tutEzSvhcZVU5NzfCFM6euaOHgpMUHUnnZ4Fv6ZQ3FQAM2eLz5zQmyqI+iws8hQF
BKp+deT/bJ/dxRv27Dx0Kl7w+86OnTJe2dIxuvrjYLjbYO8xmQj666rCleZ04m7u
DFMg+vGCv/gVU9JnKNYRgfzYblICqA==
=vZEN
-----END PGP SIGNATURE-----

--s9CvWt+5KXhPjnzp--
