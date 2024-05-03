Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B041367
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714727438; cv=none; b=eWA2arDC4w25Z5dhiTp38FmaQdFls3geoTU/+SY/3yckuqAtpXmBSYwuEavriRW4fo4LmIC2k4IpPgjZxesDcebwHKqXthehRqt2TX3A0oIpOC80NiadSnRisVGjCNUYwo/mT9Ifms/gGQwzHqsrmOeUI+YKjXtOiYZsA+iBn5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714727438; c=relaxed/simple;
	bh=2z0Hr9Ud1q3x53oSWoT9zoz9X/G8tS/RR23CLlfjW6U=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=TP+N0txx5yTeRj4Lc3YrTF7HNRjSa7vfr8n3XSeWcs/KMjnB/Fad7Bq4IPwGeyvTpuNxE9Uy2ABQJe36BMsQxKXb8olrj6RKOl1/jVC1oYhFE8uF9sqL3G/ytah2YU3KVqlp0bw6hkbqW/sQ7eA4QxgPUYOm2ORJI1I2gaVc/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EGFWrMgA; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EGFWrMgA"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240503091032euoutp015897a7ec24212a08d682a5682062c955~L74Pggx471207612076euoutp01l;
	Fri,  3 May 2024 09:10:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240503091032euoutp015897a7ec24212a08d682a5682062c955~L74Pggx471207612076euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714727432;
	bh=l8dMmjrzeBkpZQOd257OeBZ7FLkQcjvr08Gpz8Pdl58=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EGFWrMgAiRHBIkWS9bQQ8nJafPAczACbANTKXDgKTwp0IOJvSdMwORqngVdimsjO5
	 7tV78OUcSv4vn0uExCS4CTtslDyWYtUwM3kXXqOSofssbR3PXOCcDUh44Y5O2lGJge
	 HJ02rx+j0xIYbTo1EXuv9rw6k8lhT6SNx/J50N0g=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240503091032eucas1p211c6053cd44e3a9e6066fe5642dfe7fa~L74PV_UxS1994819948eucas1p2L;
	Fri,  3 May 2024 09:10:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id ED.48.09624.80AA4366; Fri,  3
	May 2024 10:10:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240503091032eucas1p28c541fd2f5b29ae6779f33c241fb40e7~L74PDVu2d0599605996eucas1p2C;
	Fri,  3 May 2024 09:10:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240503091032eusmtrp19883f59f15f28e028329ca3975f34619~L74PC0ibm2843228432eusmtrp18;
	Fri,  3 May 2024 09:10:32 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-d7-6634aa0828f5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 74.36.09010.80AA4366; Fri,  3
	May 2024 10:10:32 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240503091032eusmtip26eb171dc53be701a21468c5e13b655ae~L74O4HPpE0224702247eusmtip2c;
	Fri,  3 May 2024 09:10:32 +0000 (GMT)
Received: from localhost (106.210.248.112) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 3 May 2024 10:10:31 +0100
Date: Fri, 3 May 2024 11:10:26 +0200
From: Joel Granados <j.granados@samsung.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 10455/10463]
 include/linux/blkdev.h:733:(.text+0x260): relocation truncated to fit:
 R_RISCV_GPREL_I against `.LANCHOR1'
Message-ID: <20240503091026.v4kcpqgv7xrsb462@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="aib2zrst4pbobeje"
Content-Disposition: inline
In-Reply-To: <202405031559.2nHyrpwv-lkp@intel.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7ocq0zSDNbcUrS4t+Y/q8Wr5kds
	FodWXmFyYPZYvOclk8emT5PYPV5snskYwBzFZZOSmpNZllqkb5fAlXH+5R+mgjaNisa+J4wN
	jIuUuxg5OSQETCQWLfvP0sXIxSEksIJR4ue9fijnC6PEvHdnmCGcz4wS3Y/eMcO0NF/vZ4NI
	LGeUuN3XyA5X9eFUKxOEs4VRonV7LytIC4uAisSHb1vAbDYBHYnzb+6AjRIRUJXY8XAZE4jN
	LBAh0fn3NtgkYYHZjBJTlu0Ba+AVcJCY3vKYBcIWlDg58wmQzQHUUCHR8DoQwpSWWP6PA6SC
	U8BI4tm3ZlaIS5Uljmyfyw5h10qc2nIL7DYJgSccEvu+b4V6x0XizoT1bBC2sMSr41ugGmQk
	Tk/uYYFomMwosf/fB3YIZzWjxLLGr0wQVdYSLVeeQHU4Srw4NI0N5CIJAT6JG28FIR7jk5i0
	bTozRJhXoqNNCKJaTWL1vTcsExiVZyH5bBbCZ7MQPpsFNkdHYsHuT2wYwtoSyxa+ZoawbSXW
	rXvPsoCRfRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZgSjr97/inHYxzX33UO8TIxMF4
	iFEFqPnRhtUXGKVY8vLzUpVEeLUnG6cJ8aYkVlalFuXHF5XmpBYfYpTmYFES51VNkU8VEkhP
	LEnNTk0tSC2CyTJxcEo1MBX98e+e+FZvludh481vDWU4DVTCP+myNrLcV5l+KfbebykpAV+H
	ZW+OPOEMD99ovXLlrumnA077//UWSDAz/r/p0Jf/L+KTcuvNtbdOko7uzZ5xULvbvL5oRki2
	YuTrY/Z5VbE6b9p6M7z/Xhatn++xuF/Gbt0Gcxs5R1WLGt57t71u1hrMm9kefdFhwYd1Rs11
	3bN8l00qOn61+Ne/cNcbh7muPGjtP+N9b9nilEKZeKmoObGCU0+tWzjVaWVW2BL2vHdPLUrz
	j6w+btK6KFbldD5Xc4Ok+rpFLrHZdbo79ebfO6CrtX+yhPhxa5aob1zRqT0/67d+EG2PcJoU
	/KPnm/65tUv3bkmVYpvQr8RSnJFoqMVcVJwIAIg7cw7EAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7ocq0zSDOZ0CVjcW/Of1eJV8yM2
	i0MrrzA5MHss3vOSyWPTp0nsHi82z2QMYI7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
	NDaPtTIyVdK3s0lJzcksSy3St0vQyzi6aBFbQYtGRXvrAcYGxgXKXYycHBICJhLN1/vZuhi5
	OIQEljJKdC48zgaRkJHY+OUqK4QtLPHnWhdU0UdGieVvTrJAOFsYJf5cPsUOUsUioCLx4dsW
	sA42AR2J82/uMIPYIgKqEjseLmMCsZkFIiQ6/95mB2kWFpjNKDFl2R6wBl4BB4npLY+hprYC
	Tf2/hAUiIShxcuYTIJsDqLtM4t12EwhTWmL5Pw6QCk4BI4ln35qhLlWWOLJ9LjuEXSvx+e8z
	xgmMwrOQDJqFMGgWwqBZYMdpSdz495IJQ1hbYtnC18wQtq3EunXvWRYwsq9iFEktLc5Nzy02
	0itOzC0uzUvXS87P3cQIjMttx35u2cG48tVHvUOMTByMhxhVgDofbVh9gVGKJS8/L1VJhFd7
	snGaEG9KYmVValF+fFFpTmrxIUZTYCBOZJYSTc4HJoy8knhDMwNTQxMzSwNTSzNjJXFez4KO
	RCGB9MSS1OzU1ILUIpg+Jg5OqQamqX98ImLmFTgyzPF6pZP2Vi9aUt3/sEiWl17KC4+mvlnT
	VZap2zU35RSouwt/FNs90SP0xJWCGc0XvSxynha813RU6rlWUjw1Ik/TWHL5DtO9wvM2VzaJ
	OObWsc+xK9Xu+1ma9ErtRcf6Ozpfwq+8TZJYPsM6U31V1Pt0rY3n7S6Yy9++Yrq/5k5Xsrvd
	93LWxU+b1jw+rBb9Ybo1g5FUdSe/XK/zm7DMCnbbe7ysRdqvjBkDz/IKCx6bONMlmvng6obW
	hvsxqyVeyEV1iaoqJOvvzHdi3cFfpu+n9vhax0HHXR/2bmx96pi+78eZnUfXTvt+f1GJ//6j
	WhIiQlUqh5fsvnwp4FSv8Uz1FUosxRmJhlrMRcWJAAc8Bt9gAwAA
X-CMS-MailID: 20240503091032eucas1p28c541fd2f5b29ae6779f33c241fb40e7
X-Msg-Generator: CA
X-RootMTR: 20240503073224eucas1p1b05462c0509f4a1f45717986fd324d14
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240503073224eucas1p1b05462c0509f4a1f45717986fd324d14
References: <CGME20240503073224eucas1p1b05462c0509f4a1f45717986fd324d14@eucas1p1.samsung.com>
	<202405031559.2nHyrpwv-lkp@intel.com>

--aib2zrst4pbobeje
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 03:31:26PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
> commit: 5070493a645c67e42b3e86b5cad9796e831281dc [10455/10463] Merge bran=
ch 'sysctl-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sy=
sctl.git
> config: riscv-randconfig-c023-20221031 (https://download.01.org/0day-ci/a=
rchive/20240503/202405031559.2nHyrpwv-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240503/202405031559.2nHyrpwv-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405031559.2nHyrpwv-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    riscv64-linux-ld: section .data LMA [00000000012ee000,000000000215c197=
] overlaps section .text LMA [00000000000b7734,0000000002b4b903]
>    riscv64-linux-ld: section .data..percpu LMA [00000000031e8000,00000000=
03206a5f] overlaps section .rodata LMA [0000000002b4db00,000000000326a2ad]
>    riscv64-linux-ld: section .init.pi.text VMA [ffffffff82b4b904,ffffffff=
82b4da37] overlaps section .data VMA [ffffffff82000000,ffffffff82e6e197]
>    riscv64-linux-ld: section .got VMA [ffffffff82e6e198,ffffffff82e6e1a7]=
 overlaps section .rodata VMA [ffffffff82b4db00,ffffffff8326a2ad]
>    riscv64-linux-ld: section .init.pi.rodata.str1.8 VMA [ffffffff8326a2b0=
,ffffffff8326a332] overlaps section .bss VMA [ffffffff82f61000,ffffffff83ef=
965f]
>    block/genhd.o: in function `bdev_nr_sectors':
> >> include/linux/blkdev.h:733:(.text+0x260): relocation truncated to fit:=
 R_RISCV_GPREL_I against `.LANCHOR1'
>    block/genhd.o: in function `genhd_device_init':
> >> block/genhd.c:890:(.init.text+0xa): relocation truncated to fit: R_RIS=
CV_GPREL_I against `.LANCHOR1'
>    block/early-lookup.o: in function `devt_from_partuuid':
>    block/early-lookup.c:71:(.init.text+0x188): relocation truncated to fi=
t: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section =
in block/genhd.o
>    drivers/clk/clk.o: in function `of_clk_src_onecell_get':
>    drivers/clk/clk.c:4975:(.text+0x5bac): relocation truncated to fit: R_=
RISCV_GPREL_I against `.LANCHOR3'
>    drivers/clk/clk.o: in function `trace_clk_unprepare':
>    include/trace/events/clk.h:74:(.init.text+0x5b4): relocation truncated=
 to fit: R_RISCV_GPREL_I against `.LANCHOR3'
>    drivers/base/core.o: in function `memalloc_flags_restore':
>    include/linux/sched/mm.h:355:(.text+0x46d6): relocation truncated to f=
it: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section=
 in block/genhd.o
>    drivers/base/devtmpfs.o: in function `devtmpfs_create_node':
>    drivers/base/devtmpfs.c:131:(.text+0x98a): relocation truncated to fit=
: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section i=
n block/genhd.o
>    drivers/base/devtmpfs.o: in function `dev_mynode':
>    drivers/base/devtmpfs.c:295:(.text.unlikely+0x1a0): relocation truncat=
ed to fit: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata =
section in block/genhd.o
>    block/blk-mq-tag.o: in function `kmalloc_node_noprof':
>    include/linux/slab.h:677:(.text+0x4ace): relocation truncated to fit: =
R_RISCV_GPREL_I against `.LANCHOR1'
>    block/blk-stat.o: in function `rcu_read_unlock':
>    include/linux/rcupdate.h:868:(.text+0x127e): relocation truncated to f=
it: R_RISCV_GPREL_I against `.LANCHOR2'
>    block/blk-mq-sysfs.o: in function `blk_mq_hw_sysfs_nr_reserved_tags_sh=
ow':
>    block/blk-mq-sysfs.c:79:(.text+0x52): additional relocation overflows =
omitted from the output

These errors are the same as I mentioned here
https://lore.kernel.org/all/202404211031.J6l2AfJk-lkp@intel.com/. These
all seem to be false positives. Is this just spam from the bot?

Best

--=20

Joel Granados

--aib2zrst4pbobeje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGyBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmY0qgIACgkQupfNUreW
QU8AfQv4jIiB8BqgudCQAwsGbhgIj22jjRF9xzExMyOmH7+NXsQlC1WzumjPeLwL
EzYK/uRf9iNye9vGj7LtGg/pAZC9yLBp3IvWVolMe82/KdEj+b0JSXlGQ4FpYM4t
IrXhRF5tJp5RaWzJX6SabnIj3mtD2zgKHGmY11iFSHDuM/Cw3B2wAhowQvcSPw8J
bP6jWwuiFCaHKGX0ZW3+jz7OoaBBjbYPUeuI1emAHkJV9TopYGx1u3beg4B42CQo
I20TyIXwzWLzULcvEPKJndew0JQox5h5VgMN8KtipSaQ2qVWsm8OFn6Vg9oHHX2T
Y/k2FkuFIIIOC0Qzn29UkJrmuH+WMIIXQagJmk85o581IwG8t6PcjScZ7hwZ47ij
YcOqgcelGj8EdOWStDLilYk9IDBDoTr434k6UzmRU2//L7ReaIAz8FhSgF49wa/8
JzD1KtppMKdeotwnh1RSJMwlq8ZvPEeMVaiSv/Hd83IEnOmlAVc64gfi+9LLnR3Y
PUOVn/Q=
=rur4
-----END PGP SIGNATURE-----

--aib2zrst4pbobeje--
