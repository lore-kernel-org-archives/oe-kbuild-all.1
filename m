Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C527F05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 14:41:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230721143204euoutp01d12504f99688bd63f6ab3113a35c021f~z6IDFRXYP2235022350euoutp01g;
	Fri, 21 Jul 2023 14:32:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230721143204euoutp01d12504f99688bd63f6ab3113a35c021f~z6IDFRXYP2235022350euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1689949924;
	bh=hShO2cQ1QCfbUDfZR7fAya81QQEGV74uIxzoS1H51JA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=qAEdq00fBhqxKSQXqyXaYw5vOOuIGxX8Ob/hrGT+g4OuqzGnvsUr/flvcGUCD0K1k
	 QlpH+JPSh7KsbiEqiwaxBGlHVlOEZgsWep2ljDOe4QxPcxcobgvFLR2kxLMiZ+f+iU
	 4A/QDnLNqKquTn+F4HojYwHQWhl+Hz/y8VGDVvKg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230721143204eucas1p14cba4f4655f0fba16c5f0b0040522f80~z6IC8y2Ah2449924499eucas1p1g;
	Fri, 21 Jul 2023 14:32:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 56.8B.37758.4E69AB46; Fri, 21
	Jul 2023 15:32:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230721143204eucas1p1503813557f20ca5eed841741af09e824~z6IChEKmu2044120441eucas1p1x;
	Fri, 21 Jul 2023 14:32:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230721143204eusmtrp1d577aa7e91b6df7d02e3310e6ac66acb~z6ICgcibJ1238612386eusmtrp1J;
	Fri, 21 Jul 2023 14:32:04 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-2d-64ba96e48094
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 78.B6.10549.4E69AB46; Fri, 21
	Jul 2023 15:32:04 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230721143204eusmtip12bb3a3b78a5a04e6e264131fee80c700~z6ICSwapq3217332173eusmtip1K;
	Fri, 21 Jul 2023 14:32:04 +0000 (GMT)
Received: from localhost (106.210.248.96) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 21 Jul 2023 15:32:03 +0100
Date: Fri, 21 Jul 2023 16:32:01 +0200
From: Joel Granados <j.granados@samsung.com>
To: Julia Lawall <julia.lawall@inria.fr>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [joelgranados:jag/sysctl_remove_empty_elem 38/65]
 drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
Message-ID: <20230721143201.qwcdf2rfez76v2bt@localhost>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="xelryheo5fkiakmn"
Content-Disposition: inline
In-Reply-To: <b68351c-37b2-1195-bde-6161e96e419@inria.fr>
X-Originating-IP: [106.210.248.96]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSe0hTYRjG/c45bsfV6jQjXzQnzZRKM6MowwrtphXdsLtQLXeY4Zy1aVkU
	lJcwDTKnluuiljrdypkOk1kosxVWZomVbdHFVumyLLXboJGnM0vov9/7vM/z8bzwkbig3N2b
	3CNPphVysUzE4RH1t3+2z7QVGiWhBfdDwtK0p/AwU1UnFoFF5/WYiOieuiK0HtvOWyihZXv2
	04pZi3fx4m9fLML3aqemnrMaOUfRK79s5EECNRcaGjrcsxGPFFCVCLIfprmGIQTnL1xC7DCI
	4LGtDY1EmofSOAwLKA2C91W7/5qe1jxzxQ0Irto1XMZFUAGg/3kdZ5hDBUN73/NhJsmJ1DSo
	e+vJyDjlD9oOzZ9HPSknAl3LZob51HzoNOXgLE+A1iIbwfpTwWYvR8wzOOUDGifJyB7UAihL
	N7t6ikBX9ovD8hG4a7BgTDWgXpFg7f/mWiyDQmu9K+AJ9jsGLsuT4Z7qJMEGVAianJ+57KBD
	UHHsK8a6wiGj08ZlWgAVCVlvVrE4Dro+TmB7joO8+jM4K/Mh67iADQaC7kUfkYv81aMuU4+6
	TP3vMlYOhpLGAc5/chBUlH7AWV4E1dX9RAniapEXnaJMlNLKOXL6QIhSnKhMkUtD4pISa9Hw
	77nnvPO1AVXav4SYEEYiE5o6HO6u0T1E3oQ8SU6LJvKlUqNEwJeIDx6iFUk7FSkyWmlCPiQh
	8uIHLWqNE1BScTKdQNN7acXIFiM9vI9iqXpHgrmi+Zp7rIV72byxaIWhv8PXIW+rukS6xW7p
	Pq2Obww1k05s+bbDlQ/8Dqaap1+xRuXhtXPXlCsC+Y7MnoH270nO7zLRhmMxtZ8SZGHjB32l
	nYcndW1d65N7o/XJhuVjYzf1ruoxlPo6uyzV0W2DL5/f8AtomZehb5ryQJUb1GgeUywU7ito
	WR81kLbudbi+jq6V3D8rXOKJnT8kdIsbCNAKvTT1YkVQfs7NnKVOr1v01tYYy/7uiGC/HWHG
	3h+5U4p79SmRme2PiMCEsjJevvsRtcMa824oeX6GIz28NLLPokruO+FtXLPSrssof6lUP0uv
	aVRjsySru+aEighlvHj2DFyhFP8G7zICP7gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7pPpu1KMTj1h8eiaVU/s8WhlVeY
	HJg8Jr04xOLxYvNMxgCmKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTub
	lNSczLLUIn27BL2MN7P/sBWsUKk4+vU7ewPjPfkuRk4OCQETiQNfmti6GLk4hASWMkr09Z9i
	gUjISGz8cpUVwhaW+HOtC6roI6PE3av3WSCcLYwSW6c8YgepYhFQlVj/czsziM0moCNx/s0d
	IJuDQ0RAQ2LzU2GQMLOAssSqS8vZQGxhgX+MEqsPh4HYvALmElcOdYO1Cgn0MEr82KkFEReU
	ODnzCQtEb5nE4wVvwUYyC0hLLP/HARLmFLCUWNJ8lBHiTiWJ1Uv+skHYtRKf/z5jnMAoPAvJ
	pFlIJs1CmAQR1pK48e8lE4awtsSyha+ZIWxbiXXr3rMsYGRfxSiSWlqcm55bbKhXnJhbXJqX
	rpecn7uJERiB24793LyDcd6rj3qHGJk4GA8xqgB1Ptqw+gKjFEtefl6qkghvevquFCHelMTK
	qtSi/Pii0pzU4kOMpsAwnMgsJZqcD0wNeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZ
	qakFqUUwfUwcnFINTPyxCzNu5qRZ84nWqycrsMbGr2mXCX20YcN/63t7mMreH1dYcuqb4Od3
	a564hHHurCz9lxV+baLb9aqHW4+9+vh82tclwue+ifMWVK45nmb9Jd9mO8f6qe+nxC7yf7Vg
	jqBc7MyDuyXVDL0+Xj77j/0Fd+QDlwWreZVbz5+f+PQWZ67CcmVLz397Fu+8nfdj2mvtlqpq
	sw0tty74FMouvmeXLFIQMu3zmWl3ljzdlr9TozS0u+qbQ5VH/NeGVi3Jzx9nqydMavV4+2VR
	UOuPhmPaPu+iRRJWxkqIeMpeOnTaI3T5qxnPQneYOk26tUf0U+fM42tMfHdNL1syI9souePM
	tbuLz9j+K955IrCa2VFFiaU4I9FQi7moOBEA3klXFlUDAAA=
X-CMS-MailID: 20230721143204eucas1p1503813557f20ca5eed841741af09e824
X-Msg-Generator: CA
X-RootMTR: 20230719152514eucas1p2011b066bf28d0b098ee410e83d8fece3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230719152514eucas1p2011b066bf28d0b098ee410e83d8fece3
References: <CGME20230719152514eucas1p2011b066bf28d0b098ee410e83d8fece3@eucas1p2.samsung.com>
	<b68351c-37b2-1195-bde-6161e96e419@inria.fr>

--xelryheo5fkiakmn
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Julia

This is not a dynamic struct with a dynamic array at the end. Its a
struct that has a one element struct at the end.

I think this is a false positive.

Best

On Wed, Jul 19, 2023 at 05:25:06PM +0200, Julia Lawall wrote:
> Should device_dir be a flexible array?
>=20
> julia
>=20
> ---------- Forwarded message ----------
> Date: Wed, 19 Jul 2023 21:40:22 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [joelgranados:jag/sysctl_remove_empty_elem 38/65]
>     drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member
>     instead
>     (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-=
length-
>     and-one-element-arrays)
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Joel Granados <j.granados@samsung.com>
>=20
> tree:   https://protect2.fireeye.com/v1/url?k=3D55f47919-347f6c5e-55f5f25=
6-000babff99aa-f23173b6769c6208&q=3D1&e=3D2213ada2-9556-4e2b-85fe-ce2d0651a=
543&u=3Dhttps%3A%2F%2Fgithub.com%2FJoelgranados%2Flinux.git jag/sysctl_remo=
ve_empty_elem
> head:   a304fafc8514647e95ddf6cae2bdf2f7cd185ac1
> commit: 03ff367f259166790e8982a17498c296193db2e5 [38/65] parport: rm sent=
inel element from ctl_table array
> :::::: branch date: 22 hours ago
> :::::: commit date: 23 hours ago
> config: microblaze-randconfig-r062-20230717 (https://download.01.org/0day=
-ci/archive/20230719/202307192154.Ti6lpJ4N-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192154=
=2ETi6lpJ4N-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202307192154.Ti6lpJ4N-lkp@intel.com/
>=20
> cocci warnings: (new ones prefixed by >>)
> >> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member =
instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zer=
o-length-and-one-element-arrays)
>    drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member =
instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zer=
o-length-and-one-element-arrays)
>=20
> vim +267 drivers/parport/procfs.c
>=20
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  257
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  258
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_tabl=
e {
> 37e9981e33e4d3 Joel Granados  2023-06-16  260  	struct ctl_table_header *=
port_header;
> 37e9981e33e4d3 Joel Granados  2023-06-16  261  	struct ctl_table_header *=
devices_header;
> 03ff367f259166 Joel Granados  2023-06-27  262  #ifdef CONFIG_PARPORT_1284
> 03ff367f259166 Joel Granados  2023-06-27  263  	struct ctl_table vars[10];
> 03ff367f259166 Joel Granados  2023-06-27  264  #else
> 03ff367f259166 Joel Granados  2023-06-27  265  	struct ctl_table vars[5];
> 03ff367f259166 Joel Granados  2023-06-27  266  #endif /* IEEE 1284 suppor=
t */
> 03ff367f259166 Joel Granados  2023-06-27 @267  	struct ctl_table device_d=
ir[1];
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  269
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=3D9cf47a02-fd7f6f45-9cf5f14d-000bab=
ff99aa-8019d91ffd5aea77&q=3D1&e=3D2213ada2-9556-4e2b-85fe-ce2d0651a543&u=3D=
https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki

--=20

Joel Granados

--xelryheo5fkiakmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmS6ltkACgkQupfNUreW
QU/tuwv/ccrnRwQNG3AjkyrvEVK3xUBuShQ5blIL9FqBoWva9DkL8jn0KKI4XasI
DGqLUljpTCvmRukAwaqC4fgAC2oI6Wgxs6wkDaY/W5dXn7FDui7TKfLaGHD2k1mK
PW+b/qiHH+0NiYpHyf/SNHksMnMM32Q60aLASg7wLt6KBSC4MEoOhr7dn35NENIT
YWx5C0xik211ydMXhmkNo2+lgteMLhHktmNSrmWWqePxEl5PDHofC0y7yuK0/u0K
3FTjQLuY5WvUQ7CmGb4d3QfhSRwBXGd1BmXUpCjnVDZyXNjVEzqVNLRWx6xRbEgt
q/gPK+KpJnWJgmjkRZSqPUML57s4CTP3Nu5TLRhi0H1gZmo3jnmydL5vftsKUtVi
35VhOpGsjGFa8sSKin9FmhQanR3kT0WDBKytPJ98QELloiNLgXlzAdPStt7GqYN4
hsBekGBWEwNfPMTl6xsB1tQuG3hVbWLCeDyXG1kXDCgqgF1omyb+cVtsPiC1ICic
VuyjBRUB
=QMJg
-----END PGP SIGNATURE-----

--xelryheo5fkiakmn--
