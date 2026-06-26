Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED633F20FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479527; cv=none; b=VCTZPCPjy4q+5/Omd6QsUXLdvZhxCdU2VMgfyV7PxtTJf5iwQfpg9vZOe8k6wOBWJni0IEstrsc66mY2xaJxmoPG+FtUVTR9NVJh5un+DEz4ShFS62QZG3m/ood4XH8Bjc60KCrlDZcxtErmvw+am7nsVtRwtA2zrGxua4+kf1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479527; c=relaxed/simple;
	bh=WE6ofHaofYX/LZPenMUpNW4cmxFkI6IsND1IJ/wRcqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+6Pjm2T7i8Lb7QqdjSvqzrT5d0MjwY+QcvkR6seYKpaxOFgzQAPkNwfWdsgobkQxV2iIajWJBTxeaq0ejg85KB1UwCmwitwkoFnhF5jj9aIAao1wZ+hSuWb2/CElO0owiEQpOm5OrYUqMDfdQXd+RdmR0/lzWxE8XRgwpeteOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hox/Z6uG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hox/Z6uG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9451F000E9;
	Fri, 26 Jun 2026 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782479526;
	bh=goKE30chVGu/CeooQXFczf/dwWI23N7yFvNTMiJE5mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hox/Z6uG7SQq3WduUMVYZyo9aX1bxr26wvMwwFOAJnFPvG6zraLYXcsuGPIt46hPc
	 AO72b/++wLH1wPaq3GESjJRhthpsU3aDPEBUgEjoPEgZ5UT1RE7LarwwqvXHcvMMYQ
	 ctgDOjNl0ZXiDawxV0IVPKjOvrgajoJPg/zX9ZGKMbXm4STZITE7Hsv7xBHv6HUfPH
	 HdggHZE9h9dcSjUelfut+kb7coAWKhpfBK+/dzUVUPIf0P93kJUs7dpo9Cf32i5aSs
	 qm9bkjmdyiJrNmlthFsaujsVAIQUcj12rx/6glvBub5hurPrq5ZG4Rd80pnwQ7y87D
	 nQfZ0kiaE5WsA==
Date: Fri, 26 Jun 2026 15:12:00 +0200
From: Joel Granados <joel.granados@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [joel-granados:jag/dovec_consolidate 8/10]
 kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument 3
 (different address spaces)
Message-ID: <bjl7ggvoxnsvjmw5v6n7wzy2sc6mv23jrw5kcmjehgb5cjmep5@7vurkbyoznnx>
References: <202606230414.kVgMx0D2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uitayrcjpxplrifz"
Content-Disposition: inline
In-Reply-To: <202606230414.kVgMx0D2-lkp@intel.com>


--uitayrcjpxplrifz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 04:50:49AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/lin=
ux.git jag/dovec_consolidate
> head:   2d06753a2610465be86b654f02b69731c330cb01
> commit: a6e90775f118adc6a11c4edfd47be3acd4a80e4d [8/10] sysctl: Group pro=
c_handler declarations and document
> config: sparc64-randconfig-r134-20260622 (https://download.01.org/0day-ci=
/archive/20260623/202606230414.kVgMx0D2-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260623/202606230414.kVgMx0D2-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606230414.kVgMx0D2-lkp=
@intel.com/
>=20
> sparse warnings: (new ones prefixed by >>)
> >> kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:46:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:46:9: sparse:     got void [noderef] __user *buff=
er
> >> kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
this is interesting...
1. This report tells me that sparse is not happy because of the mismatch
   between void* and void __user *buf.
2. And the comment in the line producing the warnings is:
   "...cast it to __user so sparse doesn't get mad."

I see sparse getting mad even with the cast :)

I believe this might just be a false positive?

Best

--=20

Joel Granados

--uitayrcjpxplrifz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmo+epoACgkQupfNUreW
QU8Y+Qv+LLn4epzKNVR47MNRzVG1ErSrjxa8WaY+0KxrDJx5j1OkAMrNWZg0RYtC
y90NBq7lVwSL5VF8WjJF4RpgUZuNiuDj+IfMva1JrbRkug9DPDL1KPN0Uoc/lScc
BEOsjBXmshMs399YMHfoGSND9AukqXQjEOs1tvk4V5YxtQ411AAwqD6s/SdW4mi9
mgzgqiZ+6abTnhGeGFcUfqTwHwond0MhnD/Hi1Z1xb+KitJrj4Nhp2sDqwZx1CkL
WSYUGHWgENm/GPJ5W/RcFiF5yNkKWtD380Z3Ou/vpxmsGKz+Uen++knfuynBBLqp
jMmWK+DcUe9+1NWzJh99c9qHxd7JRdc8h7KmD6t0rEYeBPpxBj9b6OKC4Oi9fMmr
NumLiPXoZQ4Vpop5Eg8LzgUKAKLvy9Rwp11TTrDe6KWow+NEoW1m4wXY7zhncm69
tCWi0nv8D3XO/qfVii/b3UAPh0pWwT5QNNUScQbi0Rc+G99KLNe+AiZ7JJImh5DT
iWrHa8FP
=Bbf7
-----END PGP SIGNATURE-----

--uitayrcjpxplrifz--
