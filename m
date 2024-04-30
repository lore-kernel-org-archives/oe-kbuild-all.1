Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF607710C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714489398; cv=none; b=LT+dVJnE+1VkNeOquIHengIMtzVslI5LB0hxF7BnPan5SB052c/+tWOI46uSz/GqohAVm8WvOOJ6c6eTYW31xTqdanjcp5cCINZ/V5BRUouieoo5/H/K2+xFDO9BbGXWW8TalGkTsS+kt4uoU08HZLKTFk1F8OadGZqSbhQHYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714489398; c=relaxed/simple;
	bh=kJz02YWTBE93pUBLb0oNO5ux6QGP1X25TMgZ2sR2Rsc=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=T+41F67iXyirnRwOQnb5XuwXLcmW6Df/MR6vjwNMWMmZ9Oj6+ze9lX6doQWOp1lMoIva5p34AsiR53YeQCWKqtAQErohyKSJanS6tq2v25p8xYJS0oUrsEVhzq/YfweJmBnG+7iDvaxg+EA+Tz3DfgVuIzWZE2NOORVKHX/HbFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=S+5G9VFh; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="S+5G9VFh"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240430150308euoutp0177dd602a17e813f9172352989e6ab34b~LFwPDgRHU2187621876euoutp01U;
	Tue, 30 Apr 2024 15:03:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240430150308euoutp0177dd602a17e813f9172352989e6ab34b~LFwPDgRHU2187621876euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714489388;
	bh=s3cSKA3ptSdtmsL1iob6mG7l++rs71vpFHgkvWOqnhI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=S+5G9VFhdXSZ/vfyMJATSiYGhwziEZLIicorvTcaXvQJcfO4CwRl+JH2WM6z1KLY0
	 U48R/zTYU/W67erzVe0HemY3MqEmGAUhYOBDTx+aOPR+4cPwrZ+18fEidlqnxFIJpX
	 X0fISZsWYiwJtoh4x3pXH9jK9q1C9a7tJnboU76E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240430150307eucas1p2c8d4a55d8ebcb9d54069ceab2a7d1c0d~LFwO9VoGu1661516615eucas1p2s;
	Tue, 30 Apr 2024 15:03:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 48.29.09875.B2801366; Tue, 30
	Apr 2024 16:03:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240430150307eucas1p19983581cded42ad5509f3783bfa76811~LFwOkDcZW0073400734eucas1p1d;
	Tue, 30 Apr 2024 15:03:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240430150307eusmtrp23d995adb84ee9e436f4d7c54c1e182e5~LFwOjj_bN0149801498eusmtrp2x;
	Tue, 30 Apr 2024 15:03:07 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-5d-6631082b3e53
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.E2.08810.B2801366; Tue, 30
	Apr 2024 16:03:07 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240430150307eusmtip1d2008f34e04b697976af17f595ea8f67~LFwOYuy2E1663316633eusmtip1V;
	Tue, 30 Apr 2024 15:03:07 +0000 (GMT)
Received: from localhost (106.210.248.68) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 30 Apr 2024 16:03:06 +0100
Date: Tue, 30 Apr 2024 17:03:02 +0200
From: Joel Granados <j.granados@samsung.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 7116/7122]
 init/main.c:613:(.init.text+0x358): relocation truncated to fit:
 R_RISCV_GPREL_I against symbol `__setup_start' defined in .init.rodata
 section in .tmp_vmlinux.kallsyms1
Message-ID: <20240430150302.rqply6lqrfh7uqov@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="6ywvw5tieyftaf3h"
Content-Disposition: inline
In-Reply-To: <202404211031.J6l2AfJk-lkp@intel.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSe0hTURzm3HvdrqvZ9Wr4Q6PHNMssZ2K53o2MVgQ9qIiw3MijrXSuLcuK
	MMmkrcTSILWiF2m5ckPtMQ1Wg6ystNAerrByVrZW9tBEY1vOu17/fed78f3g0CRr9Aullapt
	WKNSpIt4AupqQ3/zlGh6amqsSTdd0n7J4ydx7OvgSawXW4n5pOzcjQ+ErPpbEV/WVVOKlpPr
	BLNTcLpyO9aI58oFm64driDVDSuz39pzqb3IKdMjfxqYeLh19hSpRwKaZS4g0F9y+HGPHgTt
	HXaf8h3B8f0e4nfkaIGbzwkVCJxP2nh/XKUuN/K6WKYWgWGfVo9ommLGw9dHS700j5kMzc6X
	pBcHD9LX35QPlZLMWtC5XgyVBjE2BI6T54cEITMfzI06HocD4V5pJ8UFsuFuZy/h7SeZMKhw
	017an4kD/fM2khsqgoKSk77Re6Cx1ubDThoKL2IOJ0Lxjzc+fxA47tTyOTwKPOZThHcPMMUI
	LO4vfO5hQFCe2+trmgV5rZ2+hBQa7fl87yBgAuD5p0BuZwAUXT1GcrQQDuSznDsSDO1O6jAK
	L/vnsrJ/Liv7exkHo8BYJ/6P9ZqjofzMR5LDc6Cqqps6jfiVKARnaTPSsDZOhXfEaBUZ2ixV
	WszGzIxqNPiP7rvv9FxHFY6vMVZE0MiKIgbDHSbDIxRKqTJVWBQsPHpGnMoKUxQ7d2FNZrIm
	Kx1rrSiMpkQhwvEpYzDLpCm24S0Yq7Hmt0rQ/qF7iZKHnhbj+eqM0cl2xpgr44e7WwP79ltG
	XKkfGJ420K20vMy5lfcqvmCVbc175cwah2nB63pLrNEmWlXpd6jEZpebN/asDnuWnORSSheq
	JeJjVfK3fQ2k5O6UCzmTmwolIdO25pG6cQMTeMNyrkVEvVjRHHy8K+tBx/eu1Pr1o5p6A+pL
	RwRFhngisLwuaeK6ysfhc6nEd/0t0khd3UEiccZmmpX+FOxe6CqaJJ+ZEPXkMjYZ2sR5Aleh
	pWtJ0+LWp1cO1d68HROafaK7h635iOKJzeZGc/QytmVFnCN2gmnD54SEcUnqI+ul+nljp6v7
	bCNV+TkBmdZwXf/pRc7YEyJKu0kxdRKp0Sp+AUqQuYnCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7raHIZpBgueyFjcW/Of1eJV8yM2
	i0MrrzA5MHss3vOSyWPTp0nsHi82z2QMYI7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
	NDaPtTIyVdK3s0lJzcksSy3St0vQy5jQfYW54EhQxcx77A2Mrzy6GDk5JARMJKb0/mMHsYUE
	ljJK7LpjDhGXkdj45SorhC0s8edaF1sXIxdQzUdGiaa151ghnC2MEsc3rGbqYuTgYBFQlfh4
	wQekgU1AR+L8mzvMILYIUHjHw2VMIDazQIRE59/b7CC9wgK3GCVezV0KluAVcJDYeaoTakMr
	o8S1FVvZIBKCEidnPmGB6C6TWDrvGSPIMmYBaYnl/zhAwpwCRhJdN24yQ1yqJNE7Yy4ThF0r
	8fnvM8YJjMKzkEyahWTSLIRJEGF1iT/zLjFjCGtLLFv4mhnCtpVYt+49ywJG9lWMIqmlxbnp
	ucWGesWJucWleel6yfm5mxiBUbnt2M/NOxjnvfqod4iRiYPxEKMKUOejDasvMEqx5OXnpSqJ
	8E5ZqJ8mxJuSWFmVWpQfX1Sak1p8iNEUGIoTmaVEk/OB6SKvJN7QzMDU0MTM0sDU0sxYSZzX
	s6AjUUggPbEkNTs1tSC1CKaPiYNTqoFp36VPx9sPBE7Z13/KcYdD3XphD9f3HxItP2iYrtp1
	rlxI7bexqEv1lEq7M392hs9MY+5SC2PzUCtL3Wztv1vwbPo0XiZmF6GvM97vcF0i3Zem+fb3
	2+O1VQfPqRyoOMyryree+3PF566Ey7nCU9+86eHb47/u2MuQEycmFd5PXuaufvPjn/ZdnAe3
	HTSdcjnMxlG86WyY5UrxTzNuFAVqBa7mEnZRN3WtruuqDNO4+tPxef6L1zfOub39tfahWsh5
	vcL3yZdz7jZdfrlB1m754Qpr4/MHYiOLfvM4zHd/c+WRyiuT08ezJvpPb1OY1M9bbeTbq3ts
	ucSszM2bviVfOKfj25G8/EKD1zdxsQeCSizFGYmGWsxFxYkAzffAVV8DAAA=
X-CMS-MailID: 20240430150307eucas1p19983581cded42ad5509f3783bfa76811
X-Msg-Generator: CA
X-RootMTR: 20240421021112eucas1p2d8f8c557039ea1923f09668f9779ff18
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240421021112eucas1p2d8f8c557039ea1923f09668f9779ff18
References: <CGME20240421021112eucas1p2d8f8c557039ea1923f09668f9779ff18@eucas1p2.samsung.com>
	<202404211031.J6l2AfJk-lkp@intel.com>

--6ywvw5tieyftaf3h
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 10:10:26AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
> commit: 603cac6a968ab44e179e820fc0e2ca3ac2e1d829 [7116/7122] Merge branch=
 'sysctl-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysc=
tl.git
> config: riscv-randconfig-001-20231020 (https://download.01.org/0day-ci/ar=
chive/20240421/202404211031.J6l2AfJk-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240421/202404211031.J6l2AfJk-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    riscv64-linux-ld: section .data LMA [000000000099b000,0000000001424de7=
] overlaps section .text LMA [0000000000104040,000000000213c543]
>    riscv64-linux-ld: section .data..percpu LMA [00000000024e2000,00000000=
026b46e7] overlaps section .rodata LMA [000000000213c580,000000000292d0dd]
>    riscv64-linux-ld: section .rodata VMA [ffffffff8213c580,ffffffff8292d0=
dd] overlaps section .data VMA [ffffffff82000000,ffffffff82a89de7]
>    init/main.o: in function `rdinit_setup':
> >> init/main.c:613:(.init.text+0x358): relocation truncated to fit: R_RIS=
CV_GPREL_I against symbol `__setup_start' defined in .init.rodata section i=
n .tmp_vmlinux.kallsyms1
>    net/ipv4/ipconfig.o: in function `ic_dhcp_init_options':
>    net/ipv4/ipconfig.c:682:(.init.text+0x9b4): relocation truncated to fi=
t: R_RISCV_GPREL_I against `ic_bootp_cookie'
>    net/sunrpc/auth_gss/gss_krb5_mech.o: in function `gss_krb5_prepare_enc=
type_priority_list':
> >> net/sunrpc/auth_gss/gss_krb5_mech.c:213:(.text.gss_krb5_prepare_enctyp=
e_priority_list+0x9c): relocation truncated to fit: R_RISCV_GPREL_I against=
 `gss_krb5_enctypes.0'
>    lib/maple_tree.o: in function `mas_leaf_max_gap':
> >> lib/maple_tree.c:1512:(.text.mas_leaf_max_gap+0x2b8): relocation trunc=
ated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `ma_dead_node':
> >> lib/maple_tree.c:560:(.text.mas_data_end+0x110): relocation truncated =
to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mas_extend_spanning_null':
> >> lib/maple_tree.c:3662:(.text.mas_extend_spanning_null+0x69c): relocati=
on truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mas_mab_cp':
> >> lib/maple_tree.c:1943:(.text.mas_mab_cp+0x248): relocation truncated t=
o fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mab_mas_cp':
> >> lib/maple_tree.c:2000:(.text.mab_mas_cp+0x15c): relocation truncated t=
o fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mas_reuse_node':
> >> lib/maple_tree.c:3416:(.text.mas_reuse_node+0x17c): relocation truncat=
ed to fit: R_RISCV_GPREL_I against `mt_slots'
>    lib/maple_tree.o: in function `mt_free_walk':
> >> lib/maple_tree.c:5238:(.text.mt_free_walk+0x15c): relocation truncated=
 to fit: R_RISCV_GPREL_I against `mt_slots'
>    lib/maple_tree.o: in function `mtree_lookup_walk':
>    lib/maple_tree.c:3700:(.text.mtree_lookup_walk+0x94): additional reloc=
ation overflows omitted from the output
>=20
I cross compiled this locally and I believe that the error is *NOT*
introduced by our sysctl-next changes because I get the same 3 errors
before and after:
1. .data overlaps .text
2. .data overlaps .rodata
3. .rodata overlaps .data

The errors are the same type but not exactly the same. I believe that
they change as code gets modified. So before the sysctl-next changes
went in, the error was expressed somewhere else. This is consistent with
the way that the bot shows the "new" errors; since they always change as
code is changed, they will always detect a "new" error.

Another commonality is that reason for reallocation: in my tests its
always due to R_RISCV_GPREL_I.

Here are my results (I modified them slightly for readability).

# Before sysctl change:

  ~/s/linux-next (29b0937 =E2=97=BC) =E2=9D=AF=E2=9D=AF=E2=9D=AF COMPILER_I=
NSTALL_PATH=3D/home/joel/toolchains/0day_riscv COMPILER=3Dgcc-13.2.0 /home/=
joel/src/lkp-tests/kbuild/make.cross W=3D1 O=3Dbriscv ARCH=3Driscv SHELL=3D=
/bin/bash
  ...
  /home/joel/toolchains/0day_riscv/gcc-13.2.0-nolibc/riscv64-linux/bin/risc=
v64-linux-ld: section .data LMA [000000000098c000,0000000001416fa7] overlap=
s section .text LMA [0000000000104040,000000000213c503]
  /home/joel/toolchains/0day_riscv/gcc-13.2.0-nolibc/riscv64-linux/bin/risc=
v64-linux-ld: section .data..percpu LMA [00000000024d5000,00000000026a76e7]=
 overlaps section .rodata LMA [000000000213c540,000000000291e3dd]
  /home/joel/toolchains/0day_riscv/gcc-13.2.0-nolibc/riscv64-linux/bin/risc=
v64-linux-ld: section .rodata VMA [ffffffff8213c540,ffffffff8291e3dd] overl=
aps section .data VMA [ffffffff82000000,ffffffff82a8afa7]
  mm/vmscan.o: in function `folio_nr_pages':
  /home/joel/src/linux-next/briscv/../include/linux/mm.h:2078:(.text.pageou=
t+0x184): relocation truncated to fit: R_RISCV_GPREL_I against `__func__.9'
  kernel/profile.o: in function `profile_setup':
  /home/joel/src/linux-next/briscv/../kernel/profile.c:58:(.text.profile_se=
tup+0x90): relocation truncated to fit: R_RISCV_GPREL_I against `sleepstr.2'
  mm/show_mem.o: in function `show_free_areas':
  /home/joel/src/linux-next/briscv/../mm/show_mem.c:381:(.text.show_free_ar=
eas+0x1f54): relocation truncated to fit: R_RISCV_GPREL_I against `types.0'
  fs/fs_types.o: in function `fs_ftype_to_dtype':
  /home/joel/src/linux-next/briscv/../fs/fs_types.c:38:(.text.fs_ftype_to_d=
type+0x44): relocation truncated to fit: R_RISCV_GPREL_I against `fs_dtype_=
by_ftype'
  fs/fs_types.o: in function `fs_umode_to_dtype':
  /home/joel/src/linux-next/briscv/../fs/fs_types.c:103:(.text.fs_umode_to_=
dtype+0x94): relocation truncated to fit: R_RISCV_GPREL_I against `fs_dtype=
_by_ftype'
  security/keys/keyctl.o: in function `keyctl_capabilities':
  /home/joel/src/linux-next/briscv/../security/keys/keyctl.c:1855:(.text.ke=
yctl_capabilities+0x40): relocation truncated to fit: R_RISCV_GPREL_I again=
st `keyrings_capabilities'
  make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1
  make[3]: Target '__default' not remade because of errors.
  make[2]: *** [/home/joel/src/linux-next/Makefile:1165: vmlinux] Error 2
  make[2]: Target '__all' not remade because of errors.
  make[1]: *** [/home/joel/src/linux-next/Makefile:240: __sub-make] Error 2
  make[1]: Target '__all' not remade because of errors.
  make[1]: Leaving directory '/home/joel/src/linux-next/briscv'
  make: *** [Makefile:240: __sub-make] Error 2
  make: Target '__all' not remade because of errors.

# After sysctl change:

  ~/s/linux-next (603cac6 =E2=97=BC) =E2=9D=AF=E2=9D=AF=E2=9D=AF COMPILER_I=
NSTALL_PATH=3D/home/joel/toolchains/0day_riscv COMPILER=3Dgcc-13.2.0 /home/=
joel/src/lkp-tests/kbuild/make.cross W=3D1 O=3Dbriscv ARCH=3Driscv SHELL=3D=
/bin/bash
  ...
  /home/joel/toolchains/0day_riscv/gcc-13.2.0-nolibc/riscv64-linux/bin/risc=
v64-linux-ld: section .data LMA [000000000098c000,0000000001415de7] overlap=
s section .text LMA [0000000000104000,000000000213c603]
  /home/joel/toolchains/0day_riscv/gcc-13.2.0-nolibc/riscv64-linux/bin/risc=
v64-linux-ld: section .data..percpu LMA [00000000024d3000,00000000026a56e7]=
 overlaps section .rodata LMA [000000000213c640,000000000291e2fd]
  /home/joel/toolchains/0day_riscv/gcc-13.2.0-nolibc/riscv64-linux/bin/risc=
v64-linux-ld: section .rodata VMA [ffffffff8213c640,ffffffff8291e2fd] overl=
aps section .data VMA [ffffffff82000000,ffffffff82a89de7]
  init/main.o: in function `.L0 ':
  /home/joel/src/linux-next/briscv/../init/main.c:769:(.init.text+0x2388): =
relocation truncated to fit: R_RISCV_GPREL_I against symbol `__stop___param=
' defined in __param section in .tmp_vmlinux.kallsyms1
  kernel/extable.o:(.init.text+0x2c): relocation truncated to fit: R_RISCV_=
GPREL_I against symbol `__start___ex_table' defined in __ex_table section i=
n .tmp_vmlinux.kallsyms1
  kernel/extable.o:(.text.search_exception_tables+0x14): relocation truncat=
ed to fit: R_RISCV_GPREL_I against symbol `__start___ex_table' defined in _=
_ex_table section in .tmp_vmlinux.kallsyms1
  kernel/params.o: in function `param_sysfs_builtin':
  /home/joel/src/linux-next/briscv/../kernel/params.c:836:(.init.text+0x354=
): relocation truncated to fit: R_RISCV_GPREL_I against symbol `__stop___pa=
ram' defined in __param section in .tmp_vmlinux.kallsyms1
  make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1
  make[3]: Target '__default' not remade because of errors.
  make[2]: *** [/home/joel/src/linux-next/Makefile:1165: vmlinux] Error 2
  make[2]: Target '__all' not remade because of errors.
  make[1]: *** [/home/joel/src/linux-next/Makefile:240: __sub-make] Error 2
  make[1]: Target '__all' not remade because of errors.
  make[1]: Leaving directory '/home/joel/src/linux-next/briscv'
  make: *** [Makefile:240: __sub-make] Error 2
  make: Target '__all' not remade because of errors.

If you see any flaw in this analysis, please let me know.

Best

--=20

Joel Granados

--6ywvw5tieyftaf3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmYxCCUACgkQupfNUreW
QU8XlAv+NWs+1sYTFuw9GvOVFydfuWWvJbWoUq0saC9SHz9FVq8slxgXR/teqBye
gevTdWGThYSynLBhYYOoYl4mvKvegMuT+PRdwQg2KIZhBayrgVXe0P8k58ZKKkJC
vQicjfCn+HHGnm7WjJ5X+GghW1uuaJMGWTVJIyDYt+clXEjF4sNzs6gRbkdsGDzH
dmaQS1MZbnrDFKp7CAwOnFGGHyHD4srMDCJoJhp9fO2oF849/siAgmx4Ey4zc/tx
bZKPubRjOrbePhDMQhbCqyN+3iB88jUnMr52OHauvx6VBDjOjjBIDby6EW/hui9L
zj7Kdajo4al/aNd15WvLtCEHqPq0uJaoWUGO/HBx/QESHIOzMgzycYoJN4qm8lH2
PazZ27yzFJJVZSu6f8+k0L02Y0bM0wWFI8QXKkJ8riInO003jMN+ovZvdbb8bEV8
0X89ZaR2P01ZLHerFJb2uOZDGLxjeA7OxnESG2WiPCYBMyGkFwUsP2Uto37kBS2O
I8L902Fk
=d1R2
-----END PGP SIGNATURE-----

--6ywvw5tieyftaf3h--
