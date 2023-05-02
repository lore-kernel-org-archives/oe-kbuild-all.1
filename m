Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307533EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF46BC433D2;
	Tue,  2 May 2023 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683042611;
	bh=k8+oW+51xENwgNdUXvTvm47eDCum6/VnO8eP1zVUl+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy5Lek3tK/bmDJBhthXuIcHMInG9GSwUMxV+5g4hX7itpcVyK0RHc7QX7HQFb1GP4
	 jMl484jwz209ishRLILEdEvgqSIKYgSuwTlkaz2758LSrYzBj291ax0IlbKM03f6IJ
	 12hNFuPoUTmAl7y7h3B+yQwb96KkVg/jaBsvASpPoLJDEobr05O9TMiaXumiKugH0D
	 REruZzwy/++Q+jiBjnf2xcUnPISh8YTXAtDglKlxUD4ImXcy0h653DuYhlb/7yZRnx
	 sKPjioqeEoUM5oq05j2Ef0Q6ZuVQTWMb8QDUquLJGBuowubjZ3zHriJLGE7UsLFw33
	 AM3B9ogQjM54w==
Date: Tue, 2 May 2023 16:50:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: arch/riscv/kernel/cpufeature.c:34:1: sparse: sparse: symbol
 '__pcpu_scope_misaligned_access_speed' was not declared. Should it be
 static?
Message-ID: <20230502-undrafted-divisive-5d75da090b59@spud>
References: <202305021414.EuPdM9kv-lkp@intel.com>
 <CALs-Hsuw5WCmphzFNEnM5dRzqvoBscppcKb2ukVrU+uyGXBedA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZPGLtlGzkkJfrFeM"
Content-Disposition: inline
In-Reply-To: <CALs-Hsuw5WCmphzFNEnM5dRzqvoBscppcKb2ukVrU+uyGXBedA@mail.gmail.com>


--ZPGLtlGzkkJfrFeM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 02, 2023 at 08:42:49AM -0700, Evan Green wrote:
> Conor, this one was fixed by your patch to include cpufeature.h in
> cpufeature.c, right?

Aye. Surprised to see the LKP sparse working, but
"v0.6.4-39-gce1a6720-dirty" probably explains why!

--ZPGLtlGzkkJfrFeM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFExLAAKCRB4tDGHoIJi
0uheAQDW8toySBi/iUo0e0dMBAG5aFqwm305S4ORRRma5/5kjQD/VMPY54ijhDxs
2aXqYlTsQvIwsjq+k8h8jQWxmrhEEAY=
=I3x2
-----END PGP SIGNATURE-----

--ZPGLtlGzkkJfrFeM--
