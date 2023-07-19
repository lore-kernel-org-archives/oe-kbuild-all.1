Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D211C93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 16:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E4CC433C8;
	Wed, 19 Jul 2023 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689782938;
	bh=eELOx7eg8lMFvajOTQiIVNju3KRIPZFe0QI3+hzeX3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bY4XjpeHT072yc/PPP2SLyNCFQmBH9R3+XuAfu/DB2/JxuRzODRJRN/VeFMm0xo+e
	 9p+e6Q23PkKoT6zEZ5HjGJDqqv2iorvJ4mzT5sHWnITYIt7uekCQgvIrozgrw5xnDw
	 aF+dkasEOcHrwOHYespu9L1tkLesVVnIDHKVCN6+yYDgAnrZXoF5IdUwQoBjhv+VqT
	 XC3B3TH9SNHTnXVPV3DLoRAL3OirbdG1lohSq4EVrlJMzWUpcdKtcMncWo0kZfcfhK
	 rNafdaO9Gutpls49MlSVO5swJyqY8Wvwe0cY82IdiLSCjYsh97wXiIu/GnJrns8SIj
	 j1PaenwlCwXOw==
Date: Wed, 19 Jul 2023 17:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [linux-stable-rc:linux-5.4.y 9090/9095]
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1159:17: error: label
 'err_cleanup_components' used but not defined
Message-ID: <46b3bcbc-e56d-41b9-b423-61c0aae8fd1d@sirena.org.uk>
References: <202307170454.7nYQFRx1-lkp@intel.com>
 <CANiDSCv4qLmnLbE2qmx_XcHBzDmGrzD_r6uiJo9AihPnLpoz-g@mail.gmail.com>
 <2023071912-gloomy-riddance-3c47@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aDwwFxABcMef8Fh5"
Content-Disposition: inline
In-Reply-To: <2023071912-gloomy-riddance-3c47@gregkh>
X-Cookie: They just buzzed and buzzed...buzzed.


--aDwwFxABcMef8Fh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 05:38:51PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 19, 2023 at 05:00:13PM +0200, Ricardo Ribalda wrote:
> > Hi Greg
> >=20
> > What is preferred in this case? A follow-up patch? or a new patch?
>=20
> Is there an upstream fix for this that should be applied instead?  Or is
> this patch incorrect?

This is fine upstream, I guess you're missing some dependency.

--aDwwFxABcMef8Fh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS4CpUACgkQJNaLcl1U
h9DHswf8C1/1bARX/nFv0uSpbvoXW4yl4uLdChqt4G8LQMznwjw/o3GP4f6IkANs
kzGaIWQZnt0mdUHGd1fT2XzR5moqlKs/bUUj9khy+CUeUkB4bWN3AeHItLPQwT/l
AHeD92x5oGvaOlqkNmfFuLCmBmRD7rdWHtXA+3ZD+SARAjY5g0WcxPdXI8Mruket
Ht7Xr/gKBTdOWRzo3QpccWIaa6EL0rHtUuUhDxNc+eQZttX+SFW2pGrsksPHcAAP
qoUjV3mwl/Q1f9pH0k832sI7trBumnzzlFJfoQ4MPvNcUK2bhMSHXzYcn5mDZZK8
aFJ6mf1iqfLXo4dIjB2T7K2csvYvPA==
=JQXG
-----END PGP SIGNATURE-----

--aDwwFxABcMef8Fh5--
