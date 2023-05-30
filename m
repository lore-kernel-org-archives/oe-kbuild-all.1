Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B073C1E528
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 12:58:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230530125814euoutp02ba913d34f116e3ec566fadbb0374765d~j7TRUanxy0104801048euoutp02P;
	Tue, 30 May 2023 12:58:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230530125814euoutp02ba913d34f116e3ec566fadbb0374765d~j7TRUanxy0104801048euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1685451494;
	bh=nagO82Vavn5TOkxaReJkLkkQA4r+IrWEoqDNaFE7GAY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LT7m6OpDOPxcRy8goOOPnpBx8oeCtF78rgF3uF828DFLLnqPrm60Y7QCmFx3RTBSX
	 abDlk9eAFVXZtuJ4DupJIacHo/CLUizCCEzVnD0PbxXMzCDzxaNFTw5pWzosX0AuK6
	 7DOsKt/Ij8zGJ4t8LjNBcmLLwGLYsCmCiZaAsak4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230530125814eucas1p1aed8bece2452611d4fa5078613b92c22~j7TRL9jPa0665206652eucas1p1x;
	Tue, 30 May 2023 12:58:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 8F.35.11320.6E2F5746; Tue, 30
	May 2023 13:58:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230530125813eucas1p1fe784f10a93fbb32a5ea3bc6da89829e~j7TQphdGM3085130851eucas1p1u;
	Tue, 30 May 2023 12:58:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230530125813eusmtrp178ad29c2cb93ead3ecbdaa0a36cde368~j7TQpCe2j3165031650eusmtrp1B;
	Tue, 30 May 2023 12:58:13 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-70-6475f2e673ee
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 4D.A2.10549.5E2F5746; Tue, 30
	May 2023 13:58:13 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230530125813eusmtip1ee287dd04626430d15c7456e600530ff~j7TQhCPmA2166621666eusmtip1L;
	Tue, 30 May 2023 12:58:13 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 30 May 2023 13:58:13 +0100
Date: Tue, 30 May 2023 14:58:11 +0200
From: Joel Granados <j.granados@samsung.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [linux-next:master 3890/5779] m68k-linux-ld: section .rodata
 VMA [00001000,00154967] overlaps section .text VMA [00000400,006e714f]
Message-ID: <20230530125811.vz5evlb7ipqbx35e@localhost>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="bfglyfdun5eqvrwp"
Content-Disposition: inline
In-Reply-To: <202305301505.a1hJGgBM-lkp@intel.com>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSe0hTcRTH+93d7V5Xi+sUOmlZLStMM3tAo1o1lFpFJElmSY9Lu/jcFpsz
	KwqtsLKX3VHm7InkSsXMRLceVOshc4VRS9fLqOzhstKpPUVz/XpB/32+33O+nHPg0AKpTRhE
	p2gzOL2WTZeJxGTNra8NE157jeqoq/lieXN5n1Du2fZCJHfnv0Jy+xkXMYdUFV9qJVRVpbtE
	qiovT6neni9EseQK8Uw1l56SyeknzlojTt5tka/LHZ51xnkQZaPKoXnIjwZmKjT1fafykJiW
	MqcR1Fs//RJdCMptfSIsOhHc+nqA/B1503iSxAULgs7uRvSnq7OIJ7CoRnD06QeBL0IyY+BB
	bw7ysYiJgIa2Jz/9wH7f+ryE8LGA2QL7HHhEAMMjeOYc4WMJMw0sO3ZTmP3BUdhC4v4s8Ny5
	LcxDdD8Hg6WX9qEfMxlemkPxojLobtsrxLwZ6qsf/VwNmC80NLpaRbgQA3ZXF8IcAJ66agrz
	MHCa9pA4YEJwpbedwqIMQUlON4G7ZsB2VwvlmwyMEu5c12EcDO73/njNwcDXFAiwLYGduVIc
	HAtlzW1kPhpt/ucw8z+Hmf8ehu0IOHHRK/rPDoeSk+8EmBVQUfGRPIGoUjSEMxo0SZxhspZb
	H2lgNQajNilyrU5Thfo/ytlb12VFFk9HpB0RNLKj0P7wi8qyuyiI1Oq0nCxQomANaqlEzW7Y
	yOl1q/XGdM5gR8E0KRsiCVc41kqZJDaDS+O4dZz+d5Wg/YKyidz5R9z3gGw95qw6borNKTWr
	lAG1Hn1q7DGq7vIC3jEzNMtxI3Z6SP2ouzWpIWr+tKaJ7UjeGjG3r7mg4tnSOX7zww6lPWbj
	l9k0DmXXyjgHVcsXNXnRbWmry5RQEP52e/bB4E3RLeP4tMDyvMPCJqIcvVkUtfxBh7910qyH
	RYX3l3piPDLBFPcF7+cE77Sw8HmPExItwrRdMd/c7ZqFn14z4xYWW5fdd7cxldU6W0j8oOKe
	xGjy2jlm/3s6csn6uOfRYe8W2+7dnJ3Zk6iYHbUi/kK7sjjFW7DTaMsdqcwcPWFg7TBqQIOJ
	ylBp+Yn+mp5VA09ZUi/vjUsdlXFWISMNyeyk8QK9gf0BDCNmbswDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xu7pPP5WmGLx+bWhxb81/VotXzY/Y
	LG5MeMpocWjlFSYHFo/Fe14yeWxa1cnmsenTJHaPF5tnMgawROnZFOWXlqQqZOQXl9gqRRta
	GOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlNK5fwl7QIltx628XcwPjOskuRk4O
	CQETiefXFrJ0MXJxCAksZZT4v2QOG0RCRmLjl6usELawxJ9rXWwQRR8ZJZ72HWIBSQgJbGGU
	+L7UGMRmEVCVuPqvkRHEZhPQkTj/5g4ziC0CFN/xcBkTiM0sUCfRd3Ii2DZhgUmMEpf+bGMH
	SfAKmEssb+9mh9jQyihxqG8uE0RCUOLkzCcsEN1lEs8PPAWKcwDZ0hLL/3GAmJwCRhKPZ6lA
	HKok8fVNL9TRtRKf/z5jnMAoPAvJoFlIBs1CGAQR1pK48e8lprC2xLKFr5khbFuJdevesyxg
	ZF/FKJJaWpybnltsqFecmFtcmpeul5yfu4kRGKvbjv3cvINx3quPeocYmTgYDzGqAHU+2rD6
	AqMUS15+XqqSCK9tYnGKEG9KYmVValF+fFFpTmrxIUZTYChOZJYSTc4HJpG8knhDMwNTQxMz
	SwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQamNemro999Msq8sjo0U1Jp/gMOmSqJ
	rms6wm+XzJM/fGDyysNXFRpup8kUvkp822d519dgeirjr28hRjxLO+XdW/dyxTe/FJ3m967+
	reDxuiCZSu1bgls8fm7Z9f/h/BdfrGu+LrVui2RfeTFW5cZ7no0lXvHtN+JqJU763p+ucNHi
	skrxmbXhvx4+LtTJtv30dUF/yaNZxm5nGayYfvBeXl6i/cdyrmP4wp4F80+oLeeYKWmast/Q
	jIMvqO2+61adN1GbAoyW79dNr/ZRTvxe3OL5L6w1aZ+53udZK3aon1GRmCG/sE/28suS1kOP
	tVJ//+s/MbveMf+5z/TkBcU/2Nf4RqTnzX7PXfxT+t8uJZbijERDLeai4kQA95PSz2oDAAA=
X-CMS-MailID: 20230530125813eucas1p1fe784f10a93fbb32a5ea3bc6da89829e
X-Msg-Generator: CA
X-RootMTR: 20230530071234eucas1p1a9740bd2be0a81fd5f83a94504d214fd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230530071234eucas1p1a9740bd2be0a81fd5f83a94504d214fd
References: <CGME20230530071234eucas1p1a9740bd2be0a81fd5f83a94504d214fd@eucas1p1.samsung.com>
	<202305301505.a1hJGgBM-lkp@intel.com>

--bfglyfdun5eqvrwp
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 03:11:21PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8c33787278ca8db73ad7d23f932c8c39b9f6e543
> commit: b8cbc0855a22fe386c704ee29fb21282f999b995 [3890/5779] sysctl: Remo=
ve register_sysctl_table
> config: m68k-randconfig-m031-20230530 (https://download.01.org/0day-ci/ar=
chive/20230530/202305301505.a1hJGgBM-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://protect2.fireeye.com/v1/url?k=3D05062a97-5a9d13f2-05=
07a1d8-000babff32e3-9a09be2bd3e7ab3d&q=3D1&e=3Df0f9eecc-4a88-410b-8a07-7b66=
ef5707a5&u=3Dhttps%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2F=
master%2Fsbin%2Fmake.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit/commit/?id=3Db8cbc0855a22fe386c704ee29fb21282f999b995
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout b8cbc0855a22fe386c704ee29fb21282f999b995
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dm68k olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305301505.a1hJGgBM-lkp=
@intel.com/
>=20
> Note: the linux-next/master HEAD 8c33787278ca8db73ad7d23f932c8c39b9f6e543=
 builds fine.
>       It may have been fixed somewhere.
>=20
> All errors (new ones prefixed by >>):
>=20
> >> m68k-linux-ld: section .rodata VMA [00001000,00154967] overlaps sectio=
n .text VMA [00000400,006e714f]
This smells like a false positive triggered by removing a bunch of code
and changing the overlap numbers. I See the same error when I compile
the v6.2 kernel. This is what I get when I cross-compile in my test
machine:

/home/joel/0day/gcc-12.3.0-nolibc/m68k-linux/bin/m68k-linux-ld: section .ro=
data VMA [00001000,00151a77] overlaps section .text VMA [00000400,006d588f]

best
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=3D4848a58a-17d39cef-48492ec5-000bab=
ff32e3-7adb4685867fc7de&q=3D1&e=3Df0f9eecc-4a88-410b-8a07-7b66ef5707a5&u=3D=
https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki

--=20

Joel Granados

--bfglyfdun5eqvrwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmR18tkACgkQupfNUreW
QU99tAv/Y9q2e1e16ot6kxOu5chdrjG1tmIayR9U1QTV1RJBhwyRchq7nhZcVgTG
haHSb5xDq1slA8S8PBQnwRELpyXJLZzLAXonKH9yi1v13SZpfL51y6a1mWL2c81v
ILBqADn5UxWya43A9sd9GmOg0Y0n8zm+O2Z4vVxP0/WBVPhtUB4EkizsUqb0oiMH
8NVA/4YQo+ahMj+QxT/yy0FuAET4iXkPmNdjrFo5/MaHj76qgtKvPrzt3L6pUtqJ
xcqoeuomOGoFAOX9qxvZU4GoSmZL7uVXQwdVqTMEBJwsm6Vg5Ibytv4Ri6ovYPmI
F3c++ej53mFFozIvPY96lUorSBQoLJ0xjsLfBT/U0sBsV9NkaM6mLEizLgIiAKgw
YLiI06VIv8VNhi0r3OPBidO5uij0rH3wn1/onbIC7JtehJ+Itw8FBLmxoZb+9V7H
xqhEfQ50eHgg5JvqJ91XplOfqwX27J/HhPOt3Dhdc7bP6QmKCPg52XaiTfICNSok
ge2LJEdY
=sKyU
-----END PGP SIGNATURE-----

--bfglyfdun5eqvrwp--
