Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36442367B85;
	Tue, 19 May 2026 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209771; cv=none; b=Zypw2Ys3NkQ85tZnNhUePpyLDlBVDP8Q4ccwQgp2dNQNOLD0ywj4RmQJc/8wnmoLssZjoJeFBl0t9CFKDlfrNs6ALdNkptjT3ZMhEUXolBsIjc4N0JG5qWhwa1GYHWhzO35iFSAuWvkG7OeFVb5D6Vyn+5Mg/yD3VCB8yLWQPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209771; c=relaxed/simple;
	bh=PDQgN43QFIl8ZeM48U1lMCZfjRriJgbAwj0AKHMx4/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uz3CJXjCUSJ8fpSfWM4f23kP3/MG+ugO1Pd3GlhpCs2fwpXqJbSsCrTxhzdC5HQEarD+8mUbDXEn3xXEeZaBm2JW5oAP7WppBIdC5t70sqZQdn5DfvFntJMnwoLUeik6huOnn0bp1p73SWLbwx2+4B8FUNg8lQSCf1DWARdLMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf7KYgB9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf7KYgB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55CDC2BCB8;
	Tue, 19 May 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779209770;
	bh=PDQgN43QFIl8ZeM48U1lMCZfjRriJgbAwj0AKHMx4/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf7KYgB9JeXPIN9v3JRj4FvGZz/WRuvZHv677E/qH5gLbMKtxy2k6W7Auv0NTldZR
	 8y8esKeo4vpUnG/WXrnVO0vNOCeZwXvWrY+AP3X0p7lXcvsy1VCHbOSBPDUrdPh9Bn
	 aEEFkOceibxjA8zVTSlTNBKTgzUFo4KYcjWWgfptmuDNplSo7fIyXUpGqjTDhVox/p
	 OObM9LC2aRLwdAUVNiNLJQDfOvf8IwZryx0uC+3DzakVflPZLIqrisZYBWzoEZZPvk
	 mdwWh4xf+HPrIVUqq17NYCiRxoZQEQIF7bxVe07aEuW2L0pHzMMjKVtP3rmqx7uKyJ
	 jHc1eZklRUhxA==
Date: Tue, 19 May 2026 17:56:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Nishanth Sampath Kumar <nissampa@cisco.com>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16
Message-ID: <24185434-2ca5-41ca-8ebc-c4f2befb8727@sirena.org.uk>
References: <202605161621.mY5zFh4D-lkp@intel.com>
 <20260519165205.4813518000193@rcdn-l-core-04.cisco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="07WBO2FenYtAc+pu"
Content-Disposition: inline
In-Reply-To: <20260519165205.4813518000193@rcdn-l-core-04.cisco.com>
X-Cookie: Huh?


--07WBO2FenYtAc+pu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 04:52:05PM +0000, Nishanth Sampath Kumar wrote:
> From 12085a8445d18202a59e3558118f74db32673b17 Mon Sep 17 00:00:00 2001
> From: Nishanth Sampath Kumar <nissampa@cisco.com>
> Date: Tue, 19 May 2026 09:41:53 -0700
> Subject: [PATCH] regmap-i2c: fix sparse warning in
>  regmap_smbus_word_write_reg16

Please post the patch as covered in submitting-patches.rst, not as an
attachment.  If you're having trouble with your mail server b4 send is
helpful:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html

>  	return i2c_smbus_write_word_data(i2c, addr_hi,
> -					 cpu_to_le16(((u16)val << 8) | addr_lo));
> +					(u16)(((u16)val << 8) | addr_lo));

What is the top level (u16) cast doing here?  This is not a legibility
triumph...

--07WBO2FenYtAc+pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMliYACgkQJNaLcl1U
h9Banwf+KIL8Zy0KVxanxnxcX4ItyR8abhr9wi5/shX5OncQk/K8ALL5jY3v9hsJ
IsYjPUll/X9rIhHxoChpsB8f2bvu5vFODVa+v4Bci+uUsoJ2fnWwlVMHCsSxGEsS
t2OqiACNk5k0Er5jNIgqpqwAr8C5NMSCq5FT1eTMVm/XQcwQn4ToJcdFQll0hrSa
en+bg07RtC1bGZ2UzhdajE8jazbbF2SbgKbzbkWMObDmxPuXFnYiSzwqnUwS7h1N
IqTpBAa3mISdVR0+yG3byIVPcoLDLk9e4J1LY1fXoaulkxtHqsq9ZDrgCJVOBAl/
lJxCysqn+VOR3qx5CkV2eJKHxB2dQg==
=evM4
-----END PGP SIGNATURE-----

--07WBO2FenYtAc+pu--
