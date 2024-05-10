Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90323168AFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715339617; cv=none; b=bzegbm48Fj4Uhr/Hl7oDXPDEeuzEeDi89zdiLJIZyMR7tBX4P5rRFS+nGPcBihuEL9aWWGyBdFRm0dWNF6mwcVsENqPKZrEfxTZ13sZ/cEZ0vTN5M5alPfLrfJ+VCw7RbU1sh18Tae987Wgmty7o+vxM0bkO58sF/OG9oYNTdCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715339617; c=relaxed/simple;
	bh=SO65b/qR2avnhILJL4z2fEwsUH+12hc0kv00ChMH+/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLaxyQL6VdCKhKN8Jygx3G4vVycrsxp5eTxnYuOFQGIyuMji+OEXvx0cPTOwbW0zlQGQeRrtWhPP8QCXMhi5mNrlS327GWN2YWO6qNnfJqMlDAgRUkahelKZkAgz/9xRBUwrjPLE9vVLPb8uOPIMy9A+0q06CqMYQVSTGP+2IYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9pNhNaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9pNhNaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36268C113CC;
	Fri, 10 May 2024 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715339617;
	bh=SO65b/qR2avnhILJL4z2fEwsUH+12hc0kv00ChMH+/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9pNhNaK9DPIxhCaU+RkYyfvr2teQHDkeMnrV+kW0aA8o/WFZRNK/lCwiJMETlAf8
	 xcRQnWriO4Oq3FU2LxNzjhM1k5iRg92ETvw8oGaMpDYl90/r6ieXCG40n5tWBfAdbS
	 X9IAcB5pGAkEw7HNhT+rxdTlL/HitAVXPqjFs/CQyv9QTybV0vwyJme83B8wwYMdH8
	 echKqoKBACajFKAtYB9FnaZ8ZrJ0zw7StxGuRHHz9VPFNjNA7ONDjG3rSIOx1GK/sx
	 lUMJxaUOExlPXoWeNC6lkKxXClvpMJ652/aRxkOc+RQ9F3x7Lk6yFHe/Wiuj/fkO14
	 g538VzAFym5Gw==
Date: Fri, 10 May 2024 12:13:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Conor Dooley <conor+lkp@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [conor:qwip 5/15] drivers/spi/spi-microchip-core-qspi.c:593:2-8:
 preceding lock on line 586
Message-ID: <20240510-deceiving-hamburger-0edadb13cd1f@spud>
References: <202405101807.6rG1rE94-lkp@intel.com>
 <alpine.DEB.2.22.394.2405101258310.3320@hadrien>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LX95D+kSyBgxUXtb"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2405101258310.3320@hadrien>


--LX95D+kSyBgxUXtb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 10, 2024 at 12:59:07PM +0200, Julia Lawall wrote:
> Please check whether line 593 needs an unlock.

Oh I don't doubt it, this stuff is a complete hacky mess at the moment,
probably I deleted the lock by accident and haven't actually run this
codepath since.
I didn't realise that this was public though, I probably just don't
understand how the private report branches there work. Sorry for wastin
your time with this.

Cheers,
Conor.

--LX95D+kSyBgxUXtb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj4BXgAKCRB4tDGHoIJi
0lg3AP4gw7lGXwAkaVHaCmqxhYbg36H7+UABdObttKdlBNhfQgD/YESuDTyvOn+L
g9wPIeT+ygg0XYNQjGhxv2axMR9bkQ0=
=kyfd
-----END PGP SIGNATURE-----

--LX95D+kSyBgxUXtb--
