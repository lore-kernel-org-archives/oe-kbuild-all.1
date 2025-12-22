Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF311224AE0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766443086; cv=none; b=ilBI7NrWkLRq6G4a4y2ewcuEbODxiL0ry/HfFTOOLQVmWuqUicuOAmcI4/TW2U0ERNHuTZ8plqawx1zRE4kQjgJZEo0BkfKu5tdz86546vSfxzgYJMHHNAYZnvSfHTivd4310Xa3rTbCRExx/vTo1oTSrm2yCnp1wuL8JDEKJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766443086; c=relaxed/simple;
	bh=e/ZqiB9SKkv3oLdvnUdUjq3vj8Zzs7bQjjRRuR//PGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxk9RgDrPgwvGyp25la5bcTsPoiqw3A07poO0EvDEyqLAjFSuH1LksvUQOowvZUR/NL1Ovx/y6w1PYwggmrL2u9HUrlj7yuRAt8GwtgWxMAktWhPE8n+q9ZqgdI6J7QTY3WkHNDRujdmcn50WsRw+AB3bSG4yq2Kk8o256GAaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9sATghM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9sATghM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43AFC4CEF1;
	Mon, 22 Dec 2025 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766443086;
	bh=e/ZqiB9SKkv3oLdvnUdUjq3vj8Zzs7bQjjRRuR//PGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9sATghMPu2g7Urn6UWTd3Mv+bwBvDe3pbk8O/S+usiRlZxRsPrr2mBBJLUOH7ffq
	 KKP7byzuLGmacvogcfqjkki27W0ypxODqfRzCE6Z91ZQgT9Ix/EWCEINpekBGgcgQd
	 Kyi3JKOucwWxQqRx7RlfAgrAapNRhZHjth5dssORwadvtTI3jozpiUfZkBz/8N2B1U
	 Qsb3leS+JR5urmUfPFINV/pxsF3y3lZvLPyAHOb1HidksT4jy5gXNdQtrvXNUF/0xD
	 tp/sEg+TJFr5XC6BnYLjy/qQ0ho5euoukJfc2LCScuu8zpebfROtjJ/ucMeGYlZFLn
	 9OMYVwlLLoIoA==
Date: Mon, 22 Dec 2025 23:37:50 +0100
From: Joel Granados <joel.granados@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] loadpin: Implement custom proc_handler for enforce
Message-ID: <3ssgbez3k6p5sainl3bpsf3eifspr5jhneav5nqdrazyqqenug@szi2e26nl4np>
References: <20251219-jag-const_loadpin-v2-1-a1490ab35a1d@kernel.org>
 <202512221207.wmjLxyLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="innxzvalh7ladtgl"
Content-Disposition: inline
In-Reply-To: <202512221207.wmjLxyLE-lkp@intel.com>


--innxzvalh7ladtgl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 07:10:12AM +0800, kernel test robot wrote:
> Hi Joel,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Granados/load=
pin-Implement-custom-proc_handler-for-enforce/20251219-185849
> base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
> patch link:    https://lore.kernel.org/r/20251219-jag-const_loadpin-v2-1-=
a1490ab35a1d%40kernel.org
> patch subject: [PATCH v2] loadpin: Implement custom proc_handler for enfo=
rce
> config: sh-randconfig-002-20251221 (https://download.01.org/0day-ci/archi=
ve/20251222/202512221207.wmjLxyLE-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251222/202512221207.wmjLxyLE-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512221207.wmjLxyLE-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from include/asm-generic/bug.h:31,
>                     from arch/sh/include/asm/bug.h:112,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/sh/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:18,
>                     from security/loadpin/loadpin.c:12:
>    security/loadpin/loadpin.c: In function 'report_writable':
> >> security/loadpin/loadpin.c:86:25: error: 'loadpin_root_writable' undec=
lared (first use in this function)
Indeed, this will happen with CONFIG_SYSCTL=3Dn. Let me address this in
V3.

--=20

Joel Granados

--innxzvalh7ladtgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmlJyD0ACgkQupfNUreW
QU8FhQv/asta6X5jBXCUlROy9mriwgzRQKlMFs3OFzOuJcOqPEf1UZgvQPLJuBx2
K82LIv6XSpPpIfJ8lazCeQGvvIku3x/DnDh9kmlgsrwTDFQv8gH336N8azjhC1lu
Jq99f2bTmn6xLMRq5LGW4rYWgC/KzoAqss1kdBFPagWNfaJ6/eBzDJtWpAGwIbW8
MFyGIY2kjoh0ih4ODoEMoyfnncYwAwXAouI3GWEyK9V7ix93Flnb6XseGFMIAbLq
ZjbGaIxVo2LSg5SlavGnVufQOfoCzGm8HKZXs0nsdyTCBHXmFXmb3UM4sGb0tf4A
Yu/fCGalWv90gNBH3hnOpid61wBeEoVEDl3bJOHXNrrnRrtAEWve5OPjor1DevCe
1NaSw+TRvi4E6FZEwvQgeNAW36hwg5xIn7WP/JH3agH1qGWmofmY0hb4aiNQbWuA
4/6s5dg5Z7/AyvcMD91yb2VA5XGHxKP/6NXdwKsfcHArsgPB7T65cCVs6z0N7Eoe
mhdgcwca
=5oaQ
-----END PGP SIGNATURE-----

--innxzvalh7ladtgl--
