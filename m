Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE011B6D11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741439722; cv=none; b=UCpKC+TsMDVBNx0csoyGhlEkNGn4CBnz1aDMMbPe6SQuuox995NAhXiT3CjSjxaklAdJ2r4XptATbWvs8wF/Af9TUIUKmWOt/JDw2r1NlzEg9bl7TdejoMtaitCj6stNLRZkwxraqAQT/LsRx/YWPR8L50F55mbghLViYTdyOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741439722; c=relaxed/simple;
	bh=HOt2Aq8dQnSAquowOXhx6FRxnfNXaVxMThy8dBunE6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKzEgc0538I9HYTtbRh/LlWPBvnh1iPdxQ6rlnAYavdlZ2wrg2iiKcNAOwxTtXjX5u2YUXashe8hTxjm65yqUzUdOhkaYhOS6sJczo9SRwgBCR1H7yYzeAr+qEMffXg3kOXkayV3AtjdKQKJxnTq9sOuHGw4yYG0Lte3alYC4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhyK3wY+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhyK3wY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741439721; x=1772975721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HOt2Aq8dQnSAquowOXhx6FRxnfNXaVxMThy8dBunE6c=;
  b=NhyK3wY+W8aRP/3paSwIbkufJNN39XKR7Gen9eXgCTdLfs33fogztJuW
   +dcNTT8B9vgIlzM/WewfzZoXi+nsUcC4CvIAnaZzU7LpvHU5Cg4crqL15
   sj84l7GkFs0M61xiV3G0LVXTTESrKBzznHmrxf/0sjasjFbUtbgmJ5YE2
   xgvT4IuaOa3u/s9UudWRKnZFeXD95gejEmAngi7W54v1sf6zrIGctwtB6
   5iubN1OePs6nApzhg+gABpHsT6fkUJsa9KGDgosyt1kT5d278jdtluHYY
   mqYcsZQZ6g1psXvtFKbAAM6avWGqUkXEIHmlsLyuuPS3zF+rPMNt2TZAR
   Q==;
X-CSE-ConnectionGUID: UaG3Ix6aRQWAPukH884ilg==
X-CSE-MsgGUID: QiHqM89mQuayYEs8xVGnmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41733024"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="41733024"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 05:15:17 -0800
X-CSE-ConnectionGUID: iZNVkOLDQl2v+KdZfLwarA==
X-CSE-MsgGUID: xkghLg4MQVuhHsB/SyD2RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119497498"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2025 05:15:16 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqu1J-0001ue-39;
	Sat, 08 Mar 2025 13:15:13 +0000
Date: Sat, 8 Mar 2025 21:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 154/411]
 drivers/gpu/drm/nouveau/nvif/dispchan.c:36:34: sparse: sparse: subtraction
 of different types can't work (different address spaces)
Message-ID: <202503082142.u0blbJfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: b31c153a3d075fcae5f7fd482a74b060f5365081 [154/411] drm/nouveau/nvif: rework disp "new chan" apis
config: arc-randconfig-r131-20250308 (https://download.01.org/0day-ci/archive/20250308/202503082142.u0blbJfl-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503082142.u0blbJfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082142.u0blbJfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvif/dispchan.c:36:34: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/nvif/dispchan.c:107:34: sparse: sparse: subtraction of different types can't work (different address spaces)
>> drivers/gpu/drm/nouveau/nvif/dispchan.c:189:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@

vim +36 drivers/gpu/drm/nouveau/nvif/dispchan.c

    30	
    31	static int
    32	nvif_dispchan_kick(struct nvif_push *push)
    33	{
    34		struct nvif_dispchan *chan = container_of(push, typeof(*chan), push);
    35	
  > 36		push->hw.cur = push->cur - (u32 __iomem *)chan->push.map.ptr;
    37		if (push->hw.put != push->hw.cur) {
    38			/* Push buffer fetches are not coherent with BAR1, we need to ensure
    39			 * writes have been flushed right through to VRAM before writing PUT.
    40			 */
    41			if (chan->push.mem.type & NVIF_MEM_VRAM) {
    42				struct nvif_device *device = chan->disp->device;
    43	
    44				nvif_wr32(&device->object, 0x070000, 0x00000001);
    45				nvif_msec(device, 2000,
    46					if (!(nvif_rd32(&device->object, 0x070000) & 0x00000002))
    47						break;
    48				);
    49			}
    50	
    51			NVIF_WV32(chan, NV507C, PUT, PTR, push->hw.cur);
    52			push->hw.put = push->hw.cur;
    53		}
    54	
    55		push->bgn = push->cur;
    56		return 0;
    57	}
    58	
    59	static int
    60	nvif_dispchan_free(struct nvif_dispchan *chan)
    61	{
    62		struct nvif_push *push = &chan->push;
    63		u32 get;
    64	
    65		get = NVIF_RV32(chan, NV507C, GET, PTR);
    66		if (get > push->hw.cur) /* NVIDIA stay 5 away from GET, do the same. */
    67			return get - push->hw.cur - 5;
    68	
    69		return push->hw.max - push->hw.cur;
    70	}
    71	
    72	static int
    73	nvif_dispchan_wind(struct nvif_dispchan *chan)
    74	{
    75		struct nvif_push *push = &chan->push;
    76	
    77		/* Wait for GET to depart from the beginning of the push buffer to
    78		 * prevent writing PUT == GET, which would be ignored by HW.
    79		 */
    80		u32 get = NVIF_RV32(chan, NV507C, GET, PTR);
    81		if (get == 0) {
    82			/* Corner-case, HW idle, but non-committed work pending. */
    83			if (push->hw.put == 0)
    84				nvif_dispchan_kick(&chan->push);
    85	
    86			if (nvif_msec(chan->disp->device, 2000,
    87				if (NVIF_TV32(chan, NV507C, GET, PTR, >, 0))
    88					break;
    89			) < 0)
    90				return -ETIMEDOUT;
    91		}
    92	
    93		PUSH_RSVD(&chan->push, PUSH_JUMP(&chan->push, 0));
    94		push->hw.cur = 0;
    95		return 0;
    96	}
    97	
    98	static int
    99	nvif_dispchan_wait(struct nvif_push *push, u32 size)
   100	{
   101		struct nvif_dispchan *chan = container_of(push, typeof(*chan), push);
   102		int free;
   103	
   104		if (WARN_ON(size > push->hw.max))
   105			return -EINVAL;
   106	
   107		push->hw.cur = push->cur - (u32 __iomem *)chan->push.map.ptr;
   108		if (push->hw.cur + size >= push->hw.max) {
   109			int ret = nvif_dispchan_wind(chan);
   110			if (ret)
   111				return ret;
   112	
   113			push->cur = chan->push.map.ptr;
   114			push->cur = push->cur + push->hw.cur;
   115			nvif_dispchan_kick(push);
   116		}
   117	
   118		if (nvif_msec(chan->disp->device, 2000,
   119			if ((free = nvif_dispchan_free(chan)) >= size)
   120				break;
   121		) < 0) {
   122			WARN_ON(1);
   123			return -ETIMEDOUT;
   124		}
   125	
   126		push->bgn = chan->push.map.ptr;
   127		push->bgn = push->bgn + push->hw.cur;
   128		push->cur = push->bgn;
   129		push->end = push->cur + free;
   130		return 0;
   131	}
   132	
   133	void
   134	nvif_dispchan_dtor(struct nvif_dispchan *chan)
   135	{
   136		if (chan->impl) {
   137			chan->impl->del(chan->priv);
   138			chan->impl = NULL;
   139		}
   140	
   141		nvif_mem_unmap_dtor(&chan->push.mem, &chan->push.map);
   142	}
   143	
   144	int
   145	nvif_dispchan_oneinit(struct nvif_dispchan *chan)
   146	{
   147		int ret;
   148	
   149		ret = nvif_object_map_cpu(&chan->object, &chan->impl->map, &chan->map);
   150		if (ret)
   151			return ret;
   152	
   153		return 0;
   154	}
   155	
   156	int
   157	nvif_dispchan_ctor(struct nvif_disp *disp, const char *name, u32 handle, s32 oclass,
   158			   struct nvif_mmu *mmu, struct nvif_dispchan *chan)
   159	{
   160		u8 type = NVIF_MEM_COHERENT;
   161		int ret;
   162	
   163		/* PIO channels don't need a push buffer. */
   164		chan->push.mem.impl = NULL;
   165		chan->impl = NULL;
   166		if (!mmu)
   167			goto done;
   168	
   169		/* Pascal added support for 47-bit physical addresses, but some
   170		 * parts of EVO still only accept 40-bit PAs.
   171		 *
   172		 * To avoid issues on systems with large amounts of RAM, and on
   173		 * systems where an IOMMU maps pages at a high address, we need
   174		 * to allocate push buffers in VRAM instead.
   175		 *
   176		 * This appears to match NVIDIA's behaviour on Pascal.
   177		 */
   178		if (disp->device->impl->family == NVIF_DEVICE_PASCAL)
   179			type |= NVIF_MEM_VRAM;
   180	
   181		ret = nvif_mem_ctor_map(mmu, "nvifDispChanPush", type, 0x1000,
   182					&chan->push.mem, &chan->push.map);
   183		if (ret)
   184			return ret;
   185	
   186		chan->push.hw.cur = 0;
   187		chan->push.hw.put = 0;
   188		chan->push.hw.max = 0x1000/4 - 1;
 > 189		chan->push.bgn = chan->push.map.ptr;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
