Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419A9377574
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534621; cv=none; b=bAVfJna9jbieMrMeB8mqYir1Glql6zBAiMclv2PQXYU73XieCat2kCJjCtfiDLWncxNVQJeNBKSLcFKD2jHWPeqMsi+ORCKyk0rQ8pSUUxmbcy3inqjhVgosfbrmZXPEbjo2SutfImw17BGz0ZTxUMl07q0ZViCkGmSQo89v9sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534621; c=relaxed/simple;
	bh=G2qEc1Z+0NhA8RGBqkoY9ELQonYbYgGocD+j+6oUb5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qq165yRC+K6lDR64FfsKTM41e82Z8k4u+VTWtUl2J4+nM4gm7eN6I4rFZS7XAk9z2NvDd3RanLHBh+coNL64uFvHsQQVPVWF9/IwKxnfO9NI3K5oN9nMUdix7lyhb0pkYXpIG8p7AreGlYzfSMz+cKu/tGAHRCUpCXPpQvDROVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKi8I/vL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKi8I/vL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534621; x=1807070621;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G2qEc1Z+0NhA8RGBqkoY9ELQonYbYgGocD+j+6oUb5U=;
  b=AKi8I/vL6usBcmkrCUskEurAxGujh0JAKhiJP1qE9GCmBl+0d9TMgrVl
   p0XYNOP4GYMVX1AfV1kKABkBvggVONcisaiUJ7up/E9LUQY6d1lFYrF6L
   kQsFJc9VCGMq4HxNISszuzJKVZJ1GzSUgB2bIHD/7SVGj/J1yuhFOtXqQ
   UkW8kSEXS9LLTr1iUlz9mXkptRFKUn4MXxtpnoDyDkJGUtrnx4G3mY8he
   3K9wJpDctq1qnMGpHjvd1kRGjb8NAnkycd4lAhW6WjPsegdd2+OpekXnp
   Adub42R9YD3tQzvxi8oyxQu3MxCWFukN0ZChJka6qJTGqxzYFF0cAQGoz
   g==;
X-CSE-ConnectionGUID: YeqUqRFaQxOgsFhw2PlMsQ==
X-CSE-MsgGUID: MciX/0O6TMSM9AkLacO5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87564372"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87564372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:39 -0700
X-CSE-ConnectionGUID: R/xawrFlTqOSnU/1CLPjSg==
X-CSE-MsgGUID: aM0UWJy1Ttum70rnRT3uSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232928789"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 21:03:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008z-0l43;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: xinhui pan <xinhui.pan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:444: warning: Excess
 function parameter 'bo' description in 'amdgpu_vce_get_create_msg'
Message-ID: <202604070212.lkSZgVt9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi xinhui,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   591cd656a1bf5ea94a222af5ef2ee76df029c1d2
commit: cb9038aa8a4e9f4535165602fd39f90c0892bc1b drm/amdgpu: VCE avoid memo=
ry allocation during IB test
date:   4 years, 7 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260407=
/202604070212.lkSZgVt9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260407/202604070212.lkSZgVt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: cb9038aa8a4e ("drm/amdgpu: VCE avoid memory allocation during IB t=
est")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604070212.lkSZgVt9-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:444: warning: Excess function pa=
rameter 'bo' description in 'amdgpu_vce_get_create_msg'


vim +444 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c

d38ceaf99ed015 Alex Deucher    2015-04-20  431 =20
d38ceaf99ed015 Alex Deucher    2015-04-20  432  /**
d38ceaf99ed015 Alex Deucher    2015-04-20  433   * amdgpu_vce_get_create_ms=
g - generate a VCE create msg
d38ceaf99ed015 Alex Deucher    2015-04-20  434   *
d38ceaf99ed015 Alex Deucher    2015-04-20  435   * @ring: ring we should su=
bmit the msg to
d38ceaf99ed015 Alex Deucher    2015-04-20  436   * @handle: VCE session han=
dle to use
184b762d5b75e3 Lee Jones       2020-11-24  437   * @bo: amdgpu object for w=
hich we query the offset
d38ceaf99ed015 Alex Deucher    2015-04-20  438   * @fence: optional fence t=
o return
d38ceaf99ed015 Alex Deucher    2015-04-20  439   *
d38ceaf99ed015 Alex Deucher    2015-04-20  440   * Open up a stream for HW =
test
d38ceaf99ed015 Alex Deucher    2015-04-20  441   */
17523bd00c4723 Alex Deucher    2019-10-17  442  static int amdgpu_vce_get_c=
reate_msg(struct amdgpu_ring *ring, uint32_t handle,
f54d1867005c33 Chris Wilson    2016-10-25  443  				     struct dma_fence *=
*fence)
d38ceaf99ed015 Alex Deucher    2015-04-20 @444  {
d38ceaf99ed015 Alex Deucher    2015-04-20  445  	const unsigned ib_size_dw =
=3D 1024;
d71518b5aa7c9c Christian K=C3=B6nig 2016-02-01  446  	struct amdgpu_job *jo=
b;
d71518b5aa7c9c Christian K=C3=B6nig 2016-02-01  447  	struct amdgpu_ib *ib;
cb9038aa8a4e9f xinhui pan      2021-09-10  448  	struct amdgpu_ib ib_msg;
f54d1867005c33 Chris Wilson    2016-10-25  449  	struct dma_fence *f =3D NU=
LL;
569557e524d8ca Alex Deucher    2019-10-17  450  	uint64_t addr;
d38ceaf99ed015 Alex Deucher    2015-04-20  451  	int i, r;
d38ceaf99ed015 Alex Deucher    2015-04-20  452 =20
c8e42d57859d50 xinhui pan      2020-03-26  453  	r =3D amdgpu_job_alloc_wit=
h_ib(ring->adev, ib_size_dw * 4,
c8e42d57859d50 xinhui pan      2020-03-26  454  				     AMDGPU_IB_POOL_DIR=
ECT, &job);
d71518b5aa7c9c Christian K=C3=B6nig 2016-02-01  455  	if (r)
d38ceaf99ed015 Alex Deucher    2015-04-20  456  		return r;
d71518b5aa7c9c Christian K=C3=B6nig 2016-02-01  457 =20
cb9038aa8a4e9f xinhui pan      2021-09-10  458  	memset(&ib_msg, 0, sizeof(=
ib_msg));
cb9038aa8a4e9f xinhui pan      2021-09-10  459  	/* only one gpu page is ne=
eded, alloc +1 page to make addr aligned. */
cb9038aa8a4e9f xinhui pan      2021-09-10  460  	r =3D amdgpu_ib_get(ring->=
adev, NULL, AMDGPU_GPU_PAGE_SIZE * 2,
cb9038aa8a4e9f xinhui pan      2021-09-10  461  			  AMDGPU_IB_POOL_DIRECT,
cb9038aa8a4e9f xinhui pan      2021-09-10  462  			  &ib_msg);
cb9038aa8a4e9f xinhui pan      2021-09-10  463  	if (r)
cb9038aa8a4e9f xinhui pan      2021-09-10  464  		goto err;
d38ceaf99ed015 Alex Deucher    2015-04-20  465 =20
cb9038aa8a4e9f xinhui pan      2021-09-10  466  	ib =3D &job->ibs[0];
cb9038aa8a4e9f xinhui pan      2021-09-10  467  	/* let addr point to page =
boundary */
cb9038aa8a4e9f xinhui pan      2021-09-10  468  	addr =3D AMDGPU_GPU_PAGE_A=
LIGN(ib_msg.gpu_addr);
d38ceaf99ed015 Alex Deucher    2015-04-20  469 =20
d38ceaf99ed015 Alex Deucher    2015-04-20  470  	/* stitch together an VCE =
create msg */
8128765ce5fb68 Chunming Zhou   2015-07-03  471  	ib->length_dw =3D 0;
8128765ce5fb68 Chunming Zhou   2015-07-03  472  	ib->ptr[ib->length_dw++] =
=3D 0x0000000c; /* len */
8128765ce5fb68 Chunming Zhou   2015-07-03  473  	ib->ptr[ib->length_dw++] =
=3D 0x00000001; /* session cmd */
8128765ce5fb68 Chunming Zhou   2015-07-03  474  	ib->ptr[ib->length_dw++] =
=3D handle;
8128765ce5fb68 Chunming Zhou   2015-07-03  475 =20
d66f8e48f12016 Leo Liu         2015-11-18  476  	if ((ring->adev->vce.fw_ve=
rsion >> 24) >=3D 52)
d66f8e48f12016 Leo Liu         2015-11-18  477  		ib->ptr[ib->length_dw++] =
=3D 0x00000040; /* len */
d66f8e48f12016 Leo Liu         2015-11-18  478  	else
8128765ce5fb68 Chunming Zhou   2015-07-03  479  		ib->ptr[ib->length_dw++] =
=3D 0x00000030; /* len */
8128765ce5fb68 Chunming Zhou   2015-07-03  480  	ib->ptr[ib->length_dw++] =
=3D 0x01000001; /* create cmd */
8128765ce5fb68 Chunming Zhou   2015-07-03  481  	ib->ptr[ib->length_dw++] =
=3D 0x00000000;
8128765ce5fb68 Chunming Zhou   2015-07-03  482  	ib->ptr[ib->length_dw++] =
=3D 0x00000042;
8128765ce5fb68 Chunming Zhou   2015-07-03  483  	ib->ptr[ib->length_dw++] =
=3D 0x0000000a;
8128765ce5fb68 Chunming Zhou   2015-07-03  484  	ib->ptr[ib->length_dw++] =
=3D 0x00000001;
8128765ce5fb68 Chunming Zhou   2015-07-03  485  	ib->ptr[ib->length_dw++] =
=3D 0x00000080;
8128765ce5fb68 Chunming Zhou   2015-07-03  486  	ib->ptr[ib->length_dw++] =
=3D 0x00000060;
8128765ce5fb68 Chunming Zhou   2015-07-03  487  	ib->ptr[ib->length_dw++] =
=3D 0x00000100;
8128765ce5fb68 Chunming Zhou   2015-07-03  488  	ib->ptr[ib->length_dw++] =
=3D 0x00000100;
8128765ce5fb68 Chunming Zhou   2015-07-03  489  	ib->ptr[ib->length_dw++] =
=3D 0x0000000c;
8128765ce5fb68 Chunming Zhou   2015-07-03  490  	ib->ptr[ib->length_dw++] =
=3D 0x00000000;
d66f8e48f12016 Leo Liu         2015-11-18  491  	if ((ring->adev->vce.fw_ve=
rsion >> 24) >=3D 52) {
d66f8e48f12016 Leo Liu         2015-11-18  492  		ib->ptr[ib->length_dw++] =
=3D 0x00000000;
d66f8e48f12016 Leo Liu         2015-11-18  493  		ib->ptr[ib->length_dw++] =
=3D 0x00000000;
d66f8e48f12016 Leo Liu         2015-11-18  494  		ib->ptr[ib->length_dw++] =
=3D 0x00000000;
d66f8e48f12016 Leo Liu         2015-11-18  495  		ib->ptr[ib->length_dw++] =
=3D 0x00000000;
d66f8e48f12016 Leo Liu         2015-11-18  496  	}
8128765ce5fb68 Chunming Zhou   2015-07-03  497 =20
8128765ce5fb68 Chunming Zhou   2015-07-03  498  	ib->ptr[ib->length_dw++] =
=3D 0x00000014; /* len */
8128765ce5fb68 Chunming Zhou   2015-07-03  499  	ib->ptr[ib->length_dw++] =
=3D 0x05000005; /* feedback buffer */
569557e524d8ca Alex Deucher    2019-10-17  500  	ib->ptr[ib->length_dw++] =
=3D upper_32_bits(addr);
569557e524d8ca Alex Deucher    2019-10-17  501  	ib->ptr[ib->length_dw++] =
=3D addr;
8128765ce5fb68 Chunming Zhou   2015-07-03  502  	ib->ptr[ib->length_dw++] =
=3D 0x00000001;
8128765ce5fb68 Chunming Zhou   2015-07-03  503 =20
8128765ce5fb68 Chunming Zhou   2015-07-03  504  	for (i =3D ib->length_dw; =
i < ib_size_dw; ++i)
8128765ce5fb68 Chunming Zhou   2015-07-03  505  		ib->ptr[i] =3D 0x0;
8128765ce5fb68 Chunming Zhou   2015-07-03  506 =20
ee913fd9e16638 Christian K=C3=B6nig 2018-07-13  507  	r =3D amdgpu_job_subm=
it_direct(job, ring, &f);
cb9038aa8a4e9f xinhui pan      2021-09-10  508  	amdgpu_ib_free(ring->adev,=
 &ib_msg, f);
8128765ce5fb68 Chunming Zhou   2015-07-03  509  	if (r)
8128765ce5fb68 Chunming Zhou   2015-07-03  510  		goto err;
9f2ade33e65925 Christian K=C3=B6nig 2016-02-03  511 =20
d38ceaf99ed015 Alex Deucher    2015-04-20  512  	if (fence)
f54d1867005c33 Chris Wilson    2016-10-25  513  		*fence =3D dma_fence_get(=
f);
f54d1867005c33 Chris Wilson    2016-10-25  514  	dma_fence_put(f);
8128765ce5fb68 Chunming Zhou   2015-07-03  515  	return 0;
d71518b5aa7c9c Christian K=C3=B6nig 2016-02-01  516 =20
8128765ce5fb68 Chunming Zhou   2015-07-03  517  err:
d71518b5aa7c9c Christian K=C3=B6nig 2016-02-01  518  	amdgpu_job_free(job);
d38ceaf99ed015 Alex Deucher    2015-04-20  519  	return r;
d38ceaf99ed015 Alex Deucher    2015-04-20  520  }
d38ceaf99ed015 Alex Deucher    2015-04-20  521 =20

:::::: The code at line 444 was first introduced by commit
:::::: d38ceaf99ed015f2a0b9af3499791bd3a3daae21 drm/amdgpu: add core driver=
 (v4)

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
