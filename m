Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61606181324
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715718222; cv=none; b=gfPhhmmndgjJZ3mFJ9rXvFYf1fmQqK03UQhzMiC6vllou6EMoeev2UMbrMNAoyjS4ENRC6+v1PXcCG1JHY9lZAo8xNmcMjvQM6Xbwt0RfyddjDijdCmQdZ3j2sehXEBXkjWZTT7pmMRsk+6knLE4uSALsiTXqZ6w0gZnYUfwbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715718222; c=relaxed/simple;
	bh=CseIaoIP0Ff3jD9dkbIHA1dt9w9I64+vxxroCUFa34g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScQSpyCa9dbdxS4xsJRroBEJYgPv/F6bE0hVHIrmWot/C8YzAQy8tTELIGMhOPb01CTu+f4/JOe28FxnDzPZNOo1Vh6NIknLq9rm9Og34JsHUydy3EGhLOQS6IXEog/8NOE9CR2A9arPIY2NVkOF5b1eGm6zViCiAwlXte++jZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fsHQHUKr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fsHQHUKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CseI
	aoIP0Ff3jD9dkbIHA1dt9w9I64+vxxroCUFa34g=; b=fsHQHUKry2e8yjGvjIew
	WILWZ8+/VHeScTGbGGnsnyYnM6mkVs8GHdyZPqlImPcvuBx+J+l2aQjDSUjNTo33
	t3tVcibipfND23MIVyOOTDczKoelFr2+oMK394vAdSPWbgJAuIZyI56VjS8lM42h
	/rsYtF8SUdKqMV5xpZ+wacWjOZnSV1gCAqe+ZO8kbYDqJKrAlk7IbJvdWHuRwfsc
	ZW+T6P0tZoPqn1z+0MUmLHTf/Yb8sCtC4Mo/OvyzSdcBUatLM/9vC5ENUhlnMtrD
	T5kYDzIoHHzcBiMiZrgPzBgRSXYTvdmaBK5uKikwiOFl2sH1b4Of9w5lfciVICMv
	iA==
Received: (qmail 2618969 invoked from network); 14 May 2024 22:23:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 May 2024 22:23:26 +0200
X-UD-Smtp-Session: l3s3148p1@Sz4wxm8YtORehhtP
Date: Tue, 14 May 2024 22:23:25 +0200
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] power: supply: sbs-manager: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <xc7wsxtb2xghha5x742xo3k5s335emd3oszdvazas7mpcxklar@67kfbf7t4jyg>
References: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>
 <202405142135.RneBfIx8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cjtoi7uhfm754mhs"
Content-Disposition: inline
In-Reply-To: <202405142135.RneBfIx8-lkp@intel.com>


--cjtoi7uhfm754mhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> [cannot apply to next-20240514]

It will fit on (and will be included in) next-20240515.

> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

I'll try to remember that.


--cjtoi7uhfm754mhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZDyD0ACgkQFA3kzBSg
KbZTfRAAiTW9sOV3CKUyzGJJGVrkvJn3k98wVDZn/CM7dXMs5GZNr0rHnEhuuL6b
zJf7z5DaZ+72tvvLBI/foRcYvnhnnjVuGnM1V03WzwddMzX8/T8nRGPIC1QakNUP
XNU+CtSCGrc6cOCnwGnbB7QWN96RP7T9DD30w3uWcNFdVhg5lKZx0V4UW2EuJkYV
c81Ald0j30dedTi81LbFqUf9wqNhxTIN3EQpbxlZRx61XHgiIVH+SxoBao0IXfyx
lejtqj7ZH79PCKDsroDvEbkRdJOEPSRQE2fVQL+WU0aQDeB5Xc7gA+wPE5PLDnFk
6O/+uh2CZnxBCzCd9HFtvGMzjelHzuJ9j8nzBNNFNRMMEXAvPSZtarqUVFw0iyBh
bOCShBgRg0Hksge6MR/NMAX5bAUawLtA9Xew3B3vis/6Gcmuo8q4T9a97/ec5RGy
V5Vb9ISCPBPVmXKVUdDn1hwxTpzSanntZfmW81gnVJ5cRrY4mNKINNJUvvJN2Rbx
1xTlBqRppbvJBSCVruDj5abofZlB0SALYPWWj5IVkT9enES1xZd9N6HEVBIpcgvh
NCpFPhUKGnDCXgzvo36yA99/k9yb36u/whoJyWPOFfuUPw6nN8PwbE6Eqt524jQz
aYjeJiETwZYvcxHNbHmiCP4YvsfXk41pg3Nj73BzvZWvzvQTN/4=
=2rav
-----END PGP SIGNATURE-----

--cjtoi7uhfm754mhs--
