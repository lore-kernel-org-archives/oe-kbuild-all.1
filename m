Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD38A200BA3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725835; cv=none; b=pad5pG71gKTb1mXV+IuG6KZlIPjiCYK/J6lPgptxRGkLq5tjRsvWG6gDW+KSQG8k9ZzykKeoiU4I0IiA3uIhdkRoSlzZkZqhZWaDI29Q9+5RySNXiCTzxZhZepZjyj75jpA1GNo3ytqUCm6Q/MBWSTF4PVC1fL4f0nkYvP+tyn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725835; c=relaxed/simple;
	bh=cvCOzzgQJTWFX5Mj+UrjDhwnrtVMHRgvfV+p/CrX8Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3H0w5uophHS8XBSaeCpq2CuFjLidheBJQ5vvGRs5+ejkomC4BrH+TsOF51U46kHsmmaNWyhSm3Kxou98eaRciHg6bqprTvPjya2vcPrEDB2P0KM6Yp2wMcOOEyNURF9L3E/xZNRhoMiagL6GdgdVn5JdZY/i5DOmLovFkR4RuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WkkpllHz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WkkpllHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b6hN
	DuSqEhLeHBbmD9w1gepDNrMcrhNnt88eUUwHFXk=; b=WkkpllHzEGks7eBuFk+S
	yx51V4tn48uDkLk+Tudi1l59elDw9OnRN7xZ7BhIW6DFCENtq9hwZvzx4iFYUbBY
	txqztGPOKGUAkOKwqF1dviptZ40cCKiwC0O+d0SuFy8pNdQ35mNH+MUQo5aOy7ZO
	Sg6lEy2TjFwBGQDhFWeEjEhHoJODE6jnulsfy2Ca+/nDdA3OITLY1m+8Gtcy59R8
	Y5cQLLYbjK/RZaVys+NeK0InGovnmY3OnaMhgNXWO+4CBFGnBon3lzaCrU22vQ7B
	+1uOHC0NYAHqdkYtfnAeb20p0DNaKabfY70mg64Cq3Kwr0MVs8yC4PN5GbkHFX3A
	vA==
Received: (qmail 629716 invoked from network); 27 Nov 2024 17:43:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Nov 2024 17:43:45 +0100
X-UD-Smtp-Session: l3s3148p1@BDZUq+cn4Kkujntz
Date: Wed, 27 Nov 2024 17:43:43 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: kernel test robot <lkp@intel.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [wsa:i2c/for-next 2/8] drivers/of/base.c:661: warning: Function
 parameter or struct member 'prefix' not described in
 'of_get_next_child_with_prefix'
Message-ID: <Z0dMPx4liFBHkogS@shikoro>
References: <202411280010.KGSDBOUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DfJvP04gijVGjymR"
Content-Disposition: inline
In-Reply-To: <202411280010.KGSDBOUE-lkp@intel.com>


--DfJvP04gijVGjymR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 10:26:35PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c=
/for-next
> head:   44b682694a0ca366bf15c26c3c3c16d26c9e9f6d
> commit: 1fcc67e3a354865775355eafec1fb061a755c971 [2/8] of: base: Add for_=
each_child_of_node_with_prefix()
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/202=
41128/202411280010.KGSDBOUE-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241128/202411280010.KGSDBOUE-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411280010.KGSDBOUE-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/of/base.c:661: warning: Function parameter or struct member 'p=
refix' not described in 'of_get_next_child_with_prefix'

Chen-Yu, can you send an incremental patch fixing this, please?


--DfJvP04gijVGjymR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdHTDsACgkQFA3kzBSg
KbYuzg//R5004INRfTOoF5e0UmQySiHRi93jEEYMbhKbrYAeJOn9CvvCho849bZg
3/SXPBZawwDyu/JNCQJSDL3p2GDHFKTTsm/THWAhfr2i4nKfxvxNZHF7sbyRlgr/
d8b+M9QDBT5JKNZHz0Q444KCyQrgtjNb48yktAF7gPIE9MigAgUphmEEvibhUVQD
QBAbmMVV1J3MKQgYVXpjSsH6MuLMDZ5/I0EiWUePLWZ7hy/pz3eBSD0pZgLJcDf8
Sudy1oUbu5Ivg1GtbyEAiwDS+4kE5LagNtWYpZzsMJJwNjlYMQNDz2b5s6F0u33s
78tk5nbxyVlQObTnSJSXEbDRfmZu8HXtHrqkV4BeVWoypA2oqMrjtcDeJv/DqXeG
RnV4rhrH0nFFAnF6QPdt9hmPdfuMW5e2w6r2ak2EJJ6DWIOquv+4QNfOnZhAfw31
HFNvQfbVMuvFQQTFSq0RyDrdd12fDtnLX1bwHm1RT8rf6tZzHkAkZwPcmhiKiI4q
l4FvVFZ9QlC68oNQB+pUgC+KtuDxmMrRP7CivPUCPlUZRATGlzNUx7bhbzFWE1s2
Oh2vZSMLdHbyyh271j8U/6i6wh5hLLYMIvU7tBSfglGuJcJLGl2rKP012uIPnVqA
aN0fOyvKfDGamemc0IY7JCboNbIBf5z0r9NCgY2Io3k5TExftcg=
=S7BD
-----END PGP SIGNATURE-----

--DfJvP04gijVGjymR--
