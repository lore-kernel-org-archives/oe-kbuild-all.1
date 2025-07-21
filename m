Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E129E0F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097128; cv=none; b=HuAZJomKGka07LVDCjqqwk1gm3zSUK8w+k/9TWxi3A4bj7ZbxL/nuKsgHnyG9hASDEjYaWX63RvFOA+9fqtAasngWQ525IEoqmhNKUnELtwMGSHY8fsfQ+X18ug7GbKhaXPNMfGqaJ0UUPinKND+HqMRX4S0bh/aaDbd6FdX+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097128; c=relaxed/simple;
	bh=W0/z7OZ8d8m+/uECTv7I8WfYd0Bko5Re5wPMcOIO774=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxdB/2BUFYLSWtwXg7EN9AcMqwUCuLC+LPGIIQ7SEYZPzV50HcZZWsBdbfGvPyHxDGEpiT85Ki3itUjEr5OhcoKqQNSmaUql0kcvRoSowDzaE/zEsUAYP/JRVkoOigxuwWWbXhwlVxJRajoK170+CUCVAmDVcnEJg4TiRSp1ogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ct5Ud+96; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ct5Ud+96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W0/z
	7OZ8d8m+/uECTv7I8WfYd0Bko5Re5wPMcOIO774=; b=Ct5Ud+96YlvDcm88ZiKC
	/Oxeb62AzLjQEGtnwRDuSDlbR5Oz4BfdH3T8bdTMISaaBsk9mbKBgzX7MbXt88f9
	851awrL8EKGoOHGjL84KaRiFvrk38V84YxTRF12ffbf6sC4bUvnrHOZruifVmj5H
	lHE+G2l83EwMCHmBh3AZaoYkj+cVcOuUpBIjzNdS+MrC6+Y/cX2Ujvq39KuGoV0d
	Kd3MVmrOi9IwIfHV97w6VBCCwokPwGmhWOprpt2kBownYwFFF45UXXfWPd/zKmIF
	t+QxeuJT3yolfmDYmJxjLb0HFZT5u7QOz1Cb31vFK6xHXHv4n4/k7nSTsZB7fcs7
	nQ==
Received: (qmail 887508 invoked from network); 21 Jul 2025 13:25:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jul 2025 13:25:19 +0200
X-UD-Smtp-Session: l3s3148p1@dT4Mu246UittKPBP
Date: Mon, 21 Jul 2025 13:25:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Message-ID: <aH4jnz0RPssZ7SfF@shikoro>
References: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
 <202507010308.KUbUR1fM-lkp@intel.com>
 <TY3PR01MB1134662BDC486D781E5B263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hkKhgmnZWOSSLEQm"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134662BDC486D781E5B263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--hkKhgmnZWOSSLEQm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Maybe I can guard these functions/caller using CONFIG_ARM64 as it is appl=
icable only to GEN3
> Platforms. Similar issue seen on [1]??
>=20
> [1] https://lkml.iu.edu/hypermail/linux/kernel/2209.2/04657.html

Maybe just use 64BIT as the guard? Seems a tad more precise to me.

Other than that, looks good to me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Wasn't able to test this yet, though, sorry. I hope for tomorrow, but no
promises.


--hkKhgmnZWOSSLEQm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh+I5sACgkQFA3kzBSg
KbY7Yw/7BB2c/4UPWEH+JCLuSG6oRoQzwD7ptrcphUF0TICA2Gk+Y6YXLIykJbJ0
k3KH3RoQmS/Q6rgH8Dc3dda+8a5kGgKGqvvIH2ELoFqSlfqbMkjJmjbURRZS1VNW
LFJfpO/PmZ56/SSO0uk/GtcachTNGmxww36T/LwEXLTs/53RQkjjlex/AZ13Xjkg
llXNn8lu9pS8zFDCUWa4PTYz9q/tVErPhPQKYje3AHS19hWbywehviZGfvBaio2Y
WOlQfWz+VQOPxWLr+s7HQ6TJIp9OD6cVwkI6uziEbnFJ5D0sGEJVY0CsUSZhCCHQ
CNNeXsOZ3f/Sr31NLYnuZUMRsDZzdxPiYQHEdjKbgjt5lq3/uKqCeX+zcr8DUpmm
Bw+hG1+TcCg7zwbqZs7PTxWT3xEDhyjjUM3utWxPtd4fjs+xTbIHOmC2rVXdiVua
iodH+dnY+xi1MHnd1lcCJQL9rqd0pVkYN71gGjaP1SUgYWFNgWHH1VZnRVvnfKE1
maT3BKvvD7cUaKotOERgIsMMyHSUd/Jwgs2d152E8+4v2ra3oRR3X/IEwf43NZ6D
KX8k0rs+MsWmghGXsHDXNDWbmqb92uharOHt168Sk/mgKXaeK8bliNTKVOwMcyxC
Ub8GpPBY0RwWZF4J8pC2VEYgfJ6aq2RI4YjoJFhbs61EIHGVdK0=
=+8h+
-----END PGP SIGNATURE-----

--hkKhgmnZWOSSLEQm--
