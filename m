Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C322259A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203503; cv=none; b=Jn8fdL3/hUE6L9uwIucnlPw1eogt5GGbxbQyoxUSI518iYn/iEQghRKX21qN4IQB5dldOEgwZZWZsdRuOICkOApRoAv7fP1lfE3d2zNuEu0rq4BAUvI6II6/ZxF+zhUHUoAVQ2gABC8NhhWyeUR1u/kk6+RA0mKmU3v4JqX5OZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203503; c=relaxed/simple;
	bh=6L4VzhZjwdCAIdVOguFfCcitNzrrwkmLjNhCsFe3YGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWXEzohbQZQurgNpLxKZNh6zVn0nsfGLwSSG0LrYLlXNzVyAZcZjxwwtsJve9wIojlHXSBx/aq10DMiM7+B7nlAPpGCDtzzwNb+haUi9taeDLReFFsntlvs62oinqV41OcBVg7PP2xxHp+ODcLjhtBnfWPqcSLBian7HDeuQJiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1z1pT3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1z1pT3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09715C4CEE9;
	Mon, 17 Mar 2025 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742203503;
	bh=6L4VzhZjwdCAIdVOguFfCcitNzrrwkmLjNhCsFe3YGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1z1pT3mESSNVYC5461SKRt4AEpap8YJyHaIvkFphotlhrsQ6Cw3xKLkXe5A7vfEi
	 cPHzq7I8sVNA2Cdm35Xx6NdKorZ0uHbfxbzkjX4iiE0gpmieQbY43xfWkgQaqwyBBa
	 dgxHrNC8n14RVZapLrScF0sxAufEYci3dzqBsvQutOhllNRFUjP95FFLidE8b4mkPX
	 bf6fh7Yjzn/3YW4/s1iFZcUBWS3KTG/+3zaJqFt8lkd4J1CU3jIX7vO/QDGAczU7Ri
	 uTtLy2Vn6fOru6LWAVWhONTAN/cd1OpLmUNUeM4K1+LElooYc/Lbp7M6xSFF238sbW
	 +KXS8BHuIe1Yg==
Date: Mon, 17 Mar 2025 09:24:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros
 183/194] WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol
 sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
Message-ID: <6a4539f9-575f-4dd7-a7b2-b77dea1f7489@sirena.org.uk>
References: <202503171311.Y0CltFV2-lkp@intel.com>
 <87frjcf5z5.wl-tiwai@suse.de>
 <a5353ff0-c906-42cf-a8e4-e5b6e62419d6@sirena.org.uk>
 <871puwf3he.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5VKx05DC6Y37Kl0"
Content-Disposition: inline
In-Reply-To: <871puwf3he.wl-tiwai@suse.de>
X-Cookie: I know how to do SPECIAL EFFECTS!!


--y5VKx05DC6Y37Kl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 17, 2025 at 09:47:25AM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > No problem, please just send the affected patches (should be amd,
> > xtensa, tegra, sunxi, stm, sof and samsung) - everything else should be
> > fine, non need to repeat review and test for the rest.

> Many patches had typos in the descriptions (e.g. RUNTIE_PM_OPS()), and
> they can be fixed, too.

> But it's your call - let me know your preference.

It'd mean I'd have to redo all my build and runtime testing for the
majority of the commits which I'd rather avoid.

--y5VKx05DC6Y37Kl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfX6moACgkQJNaLcl1U
h9CD5gf+Ky3K3pN5IxQkEu30iKi/k6mOEYN3Z1I7hU34qrjM04hGYOfAbai6TYXM
GWj5Szh2bfqoXEufa8jS2PjO0rOYW57yt1UqRoWx+n0Rqhv72CYt1QmkJ4dvWdLY
lLORBWVZctiqh8nZlh1IcpiUbPdEN+exgVkVz9xNluoFIdWjFrUZp1c30IKR0cXm
rx0ZAMHAFxNJsM1zWLdOH05WH4cdIdT03NuqdTy6kQ809ycyp50GtnLK7DHhLU1E
b/L0ppoG3CvgsLxVRftgUdY1tReaMngImV1MLx2TXZ65ZSfVNWZXNgIJ1EcnlkHd
zvxox9TC4sVWOeVrPiPieA7UDfUhNg==
=Ooci
-----END PGP SIGNATURE-----

--y5VKx05DC6Y37Kl0--
