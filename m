Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609614;
	b=lWG0+pk/Ugb540Ng7lO9T6TponXilg0cKCnhkDQcycLEpLBYieNdntB5PchtKctqvvpz
	 ny8RwlkWqzFSgy0nH+uzLb0toAvdnBbOBJr/xBMxyuPzck3JPynTswxts37wi5Oxo1LnY
	 aYbGLxl5O9BuJQ2FLweBYfUKp3OB1cpQGcpE+O0P0nCy4YTtaofpJS158cQgcO9xDzJm6
	 6IRGpdmZy+7bE8Q1lV0CVRlDBkexiqccT8A6D87nZ2Isy2Umcz+TnxNtUUXkOggQDcZwq
	 e57KYm9Xuv0sNGwQdZcB38Ed7Gsb8yyK61zazHw7rkT7h5xoSWKhaE7OhPLeXIyiY0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609614;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=xAqd28s4f8vn1CrPK/sg0IERT2pAzAOTznJJ6Lxcu44=;
	b=H8Yt4Ep4pwW8+F0PBxAYBKgoYY2B+1q5fQwsHBAK9yjSJh1MIrzXeagwAnAnyS6gKX9R
	 r6/St1ODHNVTFhk9qDTg+EmQsqKd3EL5Pa8yhq28RpCsZWHQYJpwLkmuWBP9vA9/C56GQ
	 qg9tI6EdCmFXXP8qRG77SAO/qQeD5rQj9YE1I2rZFBJZNNtw45OM15z3Y1XEBtA16l9QK
	 JqKVExbsqzfEIU86tqI0bvJTXIArSc8z9jT5RcGjFKuqybiiAPY5tMk/eHIgGhYJ+pc/X
	 ba/4LU/bKyZUJfT0b4jM/r/FlJMZ4XoxdefSwIs8k0nwlmQ1ZDX7cN5MPLxxPvnyMfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DWeCe/ac";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C1606A31E;
	Wed, 25 Nov 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWeCe/ac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE991F000D1;
	Wed, 25 Nov 2026 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609613;
	bh=xAqd28s4f8vn1CrPK/sg0IERT2pAzAOTznJJ6Lxcu44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWeCe/acoIloP0qvIzI2VYdET6w/HRxcI/8E0hOcoqIVzpvd6EgIMiNFHx1AHzZ/f
	 wo3WBL9CJJvQjFxp9oO/sc/xu0SA0UZE5PBycT0IuvoZlhGQBrm0AjfpdINYMS32fb
	 c9NXhaNTaECYmGgQ2Kr9BeSoqY42/3qp7TpxL2Qicqxv5pyQpmGR+JoJNgyY5iU+T9
	 X+4ase/EPiLovIyN9YpnHElNyox2rX7Sg+E9lP5bdf3o5VdyZA5V3DhsJCHAZYTVbW
	 896vVtiaa8XeZJ/VsP5pm3H6OI3mKbAFnXB8uainb6ggaZmSkdjLSdmZbDiq/bFe/B
	 3kN2ajV7yqkvA==
Date: Wed, 25 Nov 2026 12:26:49 +0000
From: Mark Brown <broonie@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <5fc38eb6-f999-4aaa-98df-21a0b1bca01b@sirena.org.uk>
References: <awXJ__-grexFFPb4@sirena.org.uk>
 <20261125093804.Ygd8f4XE-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NwNhpivsrId1/Hnp"
Content-Disposition: inline
In-Reply-To: <20261125093804.Ygd8f4XE-lkp@intel.com>
X-Cookie: -- Owen Meredith


--NwNhpivsrId1/Hnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 09:44:55AM +0800, kernel test robot wrote:
> Hi Mark,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on next-20261123]
> [cannot apply to drm-tip/drm-tip linus/master v7.4-rc4 v7.4-rc3 v7.4-rc2 =
v7.4-rc4]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

This wasn't even a patch submission....=20

--NwNhpivsrId1/Hnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG1AgACgkQJNaLcl1U
h9AUcgf9FCehQxiRPZplaPK3PfRXFgPpW5RqatRU00lJ+gznpQJ+QZwuQ6ITguXe
tX7XNPs9u7/zLqkilzRnrgCutfnONo7iQi9043zQj5jcbYxF6Mf8EcQGYWva3ASd
h9/JgKI3e0Ye6RBr1c8fpV2LmCHDBDWP/WjIdPoGd/cnfvtl+P0CQhONuHKD20Xm
0SStIcukvf9hdgZHm8+PK/d0wE3a331wT+aryED+ZoMLNh3o58XO4lDyKbwQmhRR
3ExbSXNviix0GHjQJVYgGfeREGMuvkWCBs320YG1jwaJ1lQyVIywg+JUlzgOp0yM
zDNd4HjDyZw4Hg+plhuj63WjdUjhOA==
=ufWC
-----END PGP SIGNATURE-----

--NwNhpivsrId1/Hnp--
