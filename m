Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700164;
	b=YcRdvq6vnT3z/5waF0v+Jdue67BqIgloJeUn6YCMNRS2z2rxPfn/lr1EJLDII3NvbPLq
	 2MVct6BYqytVpbiBwRzAOIjn/SqpiFjDYV4WvKQ81pZpJi2FocDRKTFCjsn+3hfmTjmaE
	 VDDsSH5CxIGnr1YSoddD5tibTm2rqqMi5pnbpWWlNWgDj8si68ldyNPaMQTdLYWxIcW4N
	 ANJDrfy9C09L9hGyo+38RyeV+ghJevlrd37U4d+BTkQcirbGtBXilgpyTbI/o6BJvANxg
	 m6AgpX1EoC0kwa1VTL4gOrVdXisVsbTS6r7IoU/AVhnMVIjfdIO3X734E994FgxZSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700164;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QRzf2G9XV0lDWcvaj4W5kt2DKPoOacJqec0bi5Xoj9s=;
	b=NTbTRZqfZ41/Rz0FGHSRHZ1a7TqwCzAxUng9JBADZeDxItJziVDnI4GJeUvfGEUor/2L
	 3vm0nLex5BlDGAyzALKGOIwZBqX/6C73eHBe5cmmuBB1315348Mm+BYPosww1hHBMceo9
	 xovNVxxR961mVBN9hmAu1c5jYkqXzyS+LFYKaThImscnqTLBVRbAAnfApM00N89S6JcCU
	 /xuqQ3BC3QIdVnPFVHuTBtc6wUV6YHAG4xpO2Ua54rsoKm6ouNuLEAvtB8HQUWlpaPP40
	 B4yJlAn88rEYhKbr8N0rS0X3KkXfwRccVQgrlCjOHPOyJSjfvGOljXDRN5EzplmSBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8Li0kHW;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B65C606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 23:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B65C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8Li0kHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794700163; x=1826236163;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7C3//5CJfHW1qny651Wxbr+Dpz8nowTfUrCSdhwdbkk=;
  b=i8Li0kHWPZQOYQI++wxU1JJf9vJZEbjYcxt1Yg7hr8qmvclIfIRhU0V1
   05VvgGmxAOlNc1E7YgMQzXRA0K1wnerGSSPo3KCorNPAi1KSbAHKCKZuu
   9/j4GqFHm8nBl8d68WHlMee51KSbDRCn4ZgNaHcFahokdOolvKzxyRLIo
   28GQedgvdXh8xKTVKIDdJTZ9Xaef4lzd8g+ZT48itlqU4MV3wy3CZKWth
   p1Jr3ffdRBKeBw+PrSw/qaOdNNBbxQnHV1vICqweQKlIcfsy8Y52nTPo7
   panD93bO8oOV4fo4UpDRQ9d/XJKbqyx+FOgzK5FRa820JOc3VlC1Rna2Q
   w==;
X-CSE-ConnectionGUID: StXI2ujwQPyYwdBe9G+gIA==
X-CSE-MsgGUID: 5a/PJbjsTQqkF079IEhKhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3467460"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3467460"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 15:49:23 -0800
X-CSE-ConnectionGUID: VjyXOq0XQ4i5GTrmSuyTEg==
X-CSE-MsgGUID: Cq6xk8CrQde8x+jNQwhaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="10998730"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 14 Nov 2026 15:49:21 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSNUk-000000016A2-1SgG;
	Sat, 14 Nov 2026 23:49:18 +0000
Date: Sun, 15 Nov 2026 07:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-lts 6/6]
 drivers/remoteproc/remoteproc_core.c:193: warning: Function parameter or
 member 'is_iomem' not described in 'rproc_da_to_va'
Message-ID: <202611150758.siI0RiyW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   c73351b2e985e893999227194b401cb06613cd81
commit: 0cf9435352d4caac1aa224ddfac371ba40a62ea4 [6/6] BACKPORT: FROMGIT: r=
emoteproc: add is_iomem to da_to_va
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261115/=
202611150758.siI0RiyW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261115/202611150758.siI0RiyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150758.siI0RiyW-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/remoteproc_core.c:193: warning: Function parameter or=
 member 'is_iomem' not described in 'rproc_da_to_va'


vim +193 drivers/remoteproc/remoteproc_core.c

eb30596eae947c Loic Pallardy   2018-07-27  162 =20
a01f7cd657c959 Suman Anna      2015-05-22  163  /**
a01f7cd657c959 Suman Anna      2015-05-22  164   * rproc_da_to_va() - looku=
p the kernel virtual address for a remoteproc address
a01f7cd657c959 Suman Anna      2015-05-22  165   * @rproc: handle of a remo=
te processor
a01f7cd657c959 Suman Anna      2015-05-22  166   * @da: remoteproc device a=
ddress to translate
a01f7cd657c959 Suman Anna      2015-05-22  167   * @len: length of the memo=
ry region @da is pointing to
a01f7cd657c959 Suman Anna      2015-05-22  168   *
400e64df6b237e Ohad Ben-Cohen  2011-10-20  169   * Some remote processors w=
ill ask us to allocate them physically contiguous
400e64df6b237e Ohad Ben-Cohen  2011-10-20  170   * memory regions (which we=
 call "carveouts"), and map them to specific
a01f7cd657c959 Suman Anna      2015-05-22  171   * device addresses (which =
are hardcoded in the firmware). They may also have
a01f7cd657c959 Suman Anna      2015-05-22  172   * dedicated memory regions=
 internal to the processors, and use them either
a01f7cd657c959 Suman Anna      2015-05-22  173   * exclusively or alongside=
 carveouts.
400e64df6b237e Ohad Ben-Cohen  2011-10-20  174   *
400e64df6b237e Ohad Ben-Cohen  2011-10-20  175   * They may then ask us to =
copy objects into specific device addresses (e.g.
400e64df6b237e Ohad Ben-Cohen  2011-10-20  176   * code/data sections) or e=
xpose us certain symbols in other device address
400e64df6b237e Ohad Ben-Cohen  2011-10-20  177   * (e.g. their trace buffer=
).
400e64df6b237e Ohad Ben-Cohen  2011-10-20  178   *
a01f7cd657c959 Suman Anna      2015-05-22  179   * This function is a helpe=
r function with which we can go over the allocated
a01f7cd657c959 Suman Anna      2015-05-22  180   * carveouts and translate =
specific device addresses to kernel virtual addresses
a01f7cd657c959 Suman Anna      2015-05-22  181   * so we can access the ref=
erenced memory. This function also allows to perform
a01f7cd657c959 Suman Anna      2015-05-22  182   * translations on the inte=
rnal remoteproc memory regions through a platform
a01f7cd657c959 Suman Anna      2015-05-22  183   * implementation specific =
da_to_va ops, if present.
a01f7cd657c959 Suman Anna      2015-05-22  184   *
a01f7cd657c959 Suman Anna      2015-05-22  185   * The function returns a v=
alid kernel address on success or NULL on failure.
400e64df6b237e Ohad Ben-Cohen  2011-10-20  186   *
400e64df6b237e Ohad Ben-Cohen  2011-10-20  187   * Note: phys_to_virt(iommu=
_iova_to_phys(rproc->domain, da)) will work too,
400e64df6b237e Ohad Ben-Cohen  2011-10-20  188   * but only on kernel direc=
t mapped RAM memory. Instead, we're just using
a01f7cd657c959 Suman Anna      2015-05-22  189   * here the output of the D=
MA API for the carveouts, which should be more
a01f7cd657c959 Suman Anna      2015-05-22  190   * correct.
400e64df6b237e Ohad Ben-Cohen  2011-10-20  191   */
0cf9435352d4ca Peng Fan        2021-03-06  192  void *rproc_da_to_va(struct=
 rproc *rproc, u64 da, size_t len, bool *is_iomem)
400e64df6b237e Ohad Ben-Cohen  2011-10-20 @193  {
400e64df6b237e Ohad Ben-Cohen  2011-10-20  194  	struct rproc_mem_entry *ca=
rveout;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  195  	void *ptr =3D NULL;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  196 =20
a01f7cd657c959 Suman Anna      2015-05-22  197  	if (rproc->ops->da_to_va) {
0cf9435352d4ca Peng Fan        2021-03-06  198  		ptr =3D rproc->ops->da_to=
_va(rproc, da, len, is_iomem);
a01f7cd657c959 Suman Anna      2015-05-22  199  		if (ptr)
a01f7cd657c959 Suman Anna      2015-05-22  200  			goto out;
a01f7cd657c959 Suman Anna      2015-05-22  201  	}
a01f7cd657c959 Suman Anna      2015-05-22  202 =20
400e64df6b237e Ohad Ben-Cohen  2011-10-20  203  	list_for_each_entry(carveo=
ut, &rproc->carveouts, node) {
400e64df6b237e Ohad Ben-Cohen  2011-10-20  204  		int offset =3D da - carve=
out->da;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  205 =20
74457c40f97a98 Loic Pallardy   2019-01-10  206  		/*  Verify that carveout =
is allocated */
74457c40f97a98 Loic Pallardy   2019-01-10  207  		if (!carveout->va)
74457c40f97a98 Loic Pallardy   2019-01-10  208  			continue;
74457c40f97a98 Loic Pallardy   2019-01-10  209 =20
400e64df6b237e Ohad Ben-Cohen  2011-10-20  210  		/* try next carveout if d=
a is too small */
400e64df6b237e Ohad Ben-Cohen  2011-10-20  211  		if (offset < 0)
400e64df6b237e Ohad Ben-Cohen  2011-10-20  212  			continue;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  213 =20
400e64df6b237e Ohad Ben-Cohen  2011-10-20  214  		/* try next carveout if d=
a is too large */
400e64df6b237e Ohad Ben-Cohen  2011-10-20  215  		if (offset + len > carveo=
ut->len)
400e64df6b237e Ohad Ben-Cohen  2011-10-20  216  			continue;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  217 =20
400e64df6b237e Ohad Ben-Cohen  2011-10-20  218  		ptr =3D carveout->va + of=
fset;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  219 =20
0cf9435352d4ca Peng Fan        2021-03-06  220  		if (is_iomem)
0cf9435352d4ca Peng Fan        2021-03-06  221  			*is_iomem =3D carveout->=
is_iomem;
0cf9435352d4ca Peng Fan        2021-03-06  222 =20
400e64df6b237e Ohad Ben-Cohen  2011-10-20  223  		break;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  224  	}
400e64df6b237e Ohad Ben-Cohen  2011-10-20  225 =20
a01f7cd657c959 Suman Anna      2015-05-22  226  out:
400e64df6b237e Ohad Ben-Cohen  2011-10-20  227  	return ptr;
400e64df6b237e Ohad Ben-Cohen  2011-10-20  228  }
4afc89d66c60a3 Sjur Br=C3=A6ndeland 2012-06-19  229  EXPORT_SYMBOL(rproc_da=
_to_va);
400e64df6b237e Ohad Ben-Cohen  2011-10-20  230 =20

:::::: The code at line 193 was first introduced by commit
:::::: 400e64df6b237eb36b127efd72000a2794f9eec1 remoteproc: add framework f=
or controlling remote processors

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Ohad Ben-Cohen <ohad@wizery.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
