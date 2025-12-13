Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766122ACEF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765660285; cv=none; b=DUGS4Qinm5vyuYEoKLV9Dhm5gWIipri+G+dehHCjv8emvVjNsWVFAH3rbQMK/SdcphT0duDDAj+GrJ8CzTqOu0u4zbnu5OEG1kySKgq+MNVQyEu+g7ERYLtG+hI5VxF4N+Au+M3bDVl+Ni64MrGxNm1E5RmnR43AAc2ktg+7XOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765660285; c=relaxed/simple;
	bh=9hPDhrbxZuLf3NzFZ1gTE/odshF7rVcAgyF9FFI9HkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uWZGRInPM5A9d/D0zqz7LIOYPdvepQ10chysvET9WHiJT8KuxL7ACPHhnhh5TkiQw9mJIh6cm+mTSzo8nAiZEscgVbnD4o0hj9Sg8iBwaL3Ja4LuGkKS53J2cwRXHIfZjhLMcu1Flh8HXX3TSYMRuuzKpIwI519/WAyJ5J7T9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgKZa9XG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgKZa9XG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765660283; x=1797196283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9hPDhrbxZuLf3NzFZ1gTE/odshF7rVcAgyF9FFI9HkE=;
  b=GgKZa9XGTi+Fzxf6EIjjusXIm0xrslxqk3XCqYs+j5/yNlSXHuQo7+iK
   BSzQK5xcwhlVkodEBga6WSTz4IxaXaR/s+KwFHkpkuocTQQV6e5lTBNgX
   JpqBdBva6AafMNPj39f/6jyUaNPzvnJqJfDFo7N71oYV7J/zYg583ZVaj
   fjko+ZeH6LQMB9SWS7GP1PJocxxXbsIrv6vglI7K3EZsT3Ykl7NCjMb1y
   eYveWqvzOvIg0SrNpiAo6txFkr2degyzaWmyoF0bNFTos7FY2Z9kXV6zS
   8VB/cAF6H4EY8DQ/wue0E53ZAG7np5+LbqTNlxeZHOfc5enQgZonTBnf1
   w==;
X-CSE-ConnectionGUID: HRgQtzZJQmSEVW4Q3RIt7A==
X-CSE-MsgGUID: x9HHg+nbRCuhRdQ6HkjSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71251384"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71251384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:11:23 -0800
X-CSE-ConnectionGUID: 9oc5Zx2TRH2nYi+wTJpt4A==
X-CSE-MsgGUID: wJCsSzLSSSiMHcYNPovfmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196657211"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 13:11:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWtb-000000008DR-1YaS;
	Sat, 13 Dec 2025 21:11:19 +0000
Date: Sun, 14 Dec 2025 05:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202512140520.YnlRkcFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: d1fb887a08d8a21284e9a4be476f103353a32e7a drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from CHANNEL_DMA
date:   7 months ago
config: sparc64-randconfig-r133-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140520.YnlRkcFb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140520.YnlRkcFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140520.YnlRkcFb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvif/chan.c:11:32: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *userd @@
   drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:71:29: sparse:     got void *userd
   drivers/gpu/drm/nouveau/nvif/chan.c:73:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *gpfifo @@
   drivers/gpu/drm/nouveau/nvif/chan.c:73:30: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:73:30: sparse:     got void *gpfifo
   drivers/gpu/drm/nouveau/nvif/chan.c:77:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *push @@
   drivers/gpu/drm/nouveau/nvif/chan.c:77:39: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:77:39: sparse:     got void *push
   drivers/gpu/drm/nouveau/nvif/chan.c:89:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan.c:123:22: sparse: sparse: cast removes address space '__iomem' of expression

vim +71 drivers/gpu/drm/nouveau/nvif/chan.c

    64	
    65	void
    66	nvif_chan_gpfifo_ctor(const struct nvif_chan_func *func, void *userd, void *gpfifo, u32 gpfifo_size,
    67			      void *push, u64 push_addr, u32 push_size, struct nvif_chan *chan)
    68	{
    69		chan->func = func;
    70	
  > 71		chan->userd.map.ptr = userd;
    72	
    73		chan->gpfifo.map.ptr = gpfifo;
    74		chan->gpfifo.max = (gpfifo_size >> 3) - 1;
    75		chan->gpfifo.free = chan->gpfifo.max;
    76	
    77		chan->push.mem.object.map.ptr = push;
    78		chan->push.wait = nvif_chan_gpfifo_push_wait;
    79		chan->push.kick = nvif_chan_gpfifo_push_kick;
    80		chan->push.addr = push_addr;
    81		chan->push.hw.max = push_size >> 2;
    82		chan->push.bgn = chan->push.cur = chan->push.end = push;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
