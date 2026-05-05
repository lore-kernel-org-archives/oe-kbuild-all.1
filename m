Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9517B506
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943208; cv=none; b=IWNvLq6VPKOFqWYs2phGjv4AoV2g04N1qGSEBUrkH+dQCpAl/p7AxvOC5ET5wn3kLak+RmxpLtT/61ucFxZBGmOE+41tnYHN+S/VaFeMZjsqatXmzjX0recyCmoXIfouJdmywk2yuMy6iJlwEsis+yKdIiOKXSmK2g2zmFEqJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943208; c=relaxed/simple;
	bh=zVcTRNW/LMYkIn2rlXZ392Z7CNYuTJSkUkHcC+IiJ24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KR5+KEnX3yyAuFbWUOVfPmtcx7cbiOspO3+5SHoKzpNXXjZED+S2qVp3spBtV5lCOB1bM+eLy1tlCqvWQm+1xF4zxAOBBr5OZhejsid4oMgH6w9k5njnZO0nFZyd0gYuD2PkIARK1z0iC7i24BLgbh61FZDSFjiDPD9OFe3ynik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBXTw+O1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBXTw+O1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8D8C2BCB8;
	Tue,  5 May 2026 01:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943207;
	bh=zVcTRNW/LMYkIn2rlXZ392Z7CNYuTJSkUkHcC+IiJ24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBXTw+O1tt4E54rSr7BKCBgwiEhPqYMJFH6M0vD3Ab08QzVbu4sQ2JGV53XjjGYVm
	 uHIBf7BdnNx1TCzCQiGDmQOnWGsJqC6WhN0e3LDaywWVrschXGKAD8qbcC11AW5xeu
	 7rg3C1FR+U677SBnuK30JNkmfop04G3XI1SKfIIxU1bI85YfAVQ3abjy7nmQASeftQ
	 FubaglrDRs0elxk9n8Eq/fzalN8xApnh48+UAKrUrN05lI1/7fPEPLh/+7+qHM4nae
	 k7axtBqSYyv/ZeMTUH9avH+qo8+by4rvrvBAmse3E2lagd+BZAxPdu31GcYOf/oW2c
	 61ZgPJaBsqdhQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B0AF01AC586B; Tue, 05 May 2026 02:06:44 +0100 (BST)
Date: Tue, 5 May 2026 10:06:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Guodong Xu <guodong@riscstar.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [broonie-ci:spi-7.2 9/9] drivers/spi/spi-spacemit-k1.c:393:38:
 warning: integer overflow in expression of type 'long int' results in
 '-589934592'
Message-ID: <aflCpEYKjO64ECFW@sirena.co.uk>
References: <202605050317.Tf9j487w-lkp@intel.com>
 <5da3b012-80df-44aa-bd32-e5336a222899@riscstar.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ycf9Wq2jwkCr6XX"
Content-Disposition: inline
In-Reply-To: <5da3b012-80df-44aa-bd32-e5336a222899@riscstar.com>
X-Cookie: Alex Haley was adopted!


--/ycf9Wq2jwkCr6XX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2026 at 04:40:10PM -0500, Alex Elder wrote:

> Could you please submit a correction to this (by which I
> think you need to post v11 of the series).

Please send an incremental patch, I already applied before I saw this.

--/ycf9Wq2jwkCr6XX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn5QqMACgkQJNaLcl1U
h9CEIAf+I0UypkakI+EHjvJoX9rEQjNPtlT9ZSPDMEaQ4Yth79thGOTq3AxT5mZQ
A2ojVDG8PWNC/R00WLpwS25TJs/CEdMfSLF7JzFO+lzYgYPiYLvZ/lfs4t5t9Tdx
vNO1/oNAKhjHfMgqv3D3OJEg7kMLBAPLc03t5k80OTuP9HJoICCi02HhjVbR5hMY
tf8a4H/uU+IUqa6u+BGl9MPiwg/gb/qQep+iS+E7mU3P2C8wMW973R9m16k0blqt
/ByKrv5f1xYdBl3ssmzAVEF2OCg7RwDPfEvfrUbo4gWiHwNoepxl3jrtNZFyaLXq
i76Jb9ytZ3HKVP/d4xPbrVeW/jKV3A==
=2y4R
-----END PGP SIGNATURE-----

--/ycf9Wq2jwkCr6XX--
