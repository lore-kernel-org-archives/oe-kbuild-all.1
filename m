Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD36C8D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 07:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447FAC433C8;
	Wed, 19 Jul 2023 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689752220;
	bh=2bZkptLEVnv1enX4bZBWQqqQlJRS0/+8nbD5gNdGN+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=flXBR/Zbv4jbsYeEvOmrKv04u8tWeuTAtRSzmroJ1p0dQd3/lMa/d2Mgdtz1nhWDQ
	 aHvh6oU8rdfaUxP5+FZ1XqBx7bDfH4CWcLiF/7WJtJXZNFK8IiWpeGMp63vH4cWJju
	 A4aKaA0FjNHrCTEw+2/0nR2mbsjFWPUxj5PfLm5CU9fQTub6xFz6M/PUt6WxXhtkBi
	 UtgwoTf1y/jnOEe8kFMRdZG25Krovbj6fIW11HEWR5Uw114b+be2/8jOtzIYCiku6E
	 I2NPteKNveCrii+JxkDJCopRtUL5MVn2ZWV6ApWHTPdbw9IVl9yr8sfDOjU8OkPjRX
	 Vv3enEsfmll2g==
Date: Wed, 19 Jul 2023 09:36:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, 
	dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev, andrealmeid@igalia.com, 
	tzimmermann@suse.de, tales.aparecida@gmail.com, mairacanal@riseup.net, 
	davidgow@google.com, michal.winiarski@intel.com, arthurgrillo@riseup.net
Subject: Re: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Message-ID: <wstx2kkfgszzekdqtem6dqnffkmlmwbj3mbdwfvxsfpjiet5wk@kilzqzv4qi6i>
References: <20230718181726.3799-3-gcarlos@disroot.org>
 <202307191411.kDvvppjm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dwv7arpteb5tco73"
Content-Disposition: inline
In-Reply-To: <202307191411.kDvvppjm-lkp@intel.com>


--dwv7arpteb5tco73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:50:16PM +0800, kernel test robot wrote:
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> ERROR: modpost: "drm_framebuffer_check_src_coords" [drivers/gpu/drm/te=
sts/drm_framebuffer_test.ko] undefined!

Yeah, drm_framebuffer_check_src_coords isn't exported to modules. This
wasn't an issue before because it was only used by the core KMS which is
always compiled in the same module, but your new tests are in another
module :)

Maxime

--dwv7arpteb5tco73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLeSmQAKCRDj7w1vZxhR
xSPWAQCBX9ffEDqNdVaawfeNXe/Z+ngNk1/TzHT27TCwB/477AD7BM5ynasERxOZ
dX+iv5HSrU0gkfKbFezCwMfJSfOscwk=
=8QJM
-----END PGP SIGNATURE-----

--dwv7arpteb5tco73--
