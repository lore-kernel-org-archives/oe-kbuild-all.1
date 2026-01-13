Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506983563E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331084; cv=none; b=pA0fsEwNGwzeo9kXG3NuSbvqtOB8exx9D/oJqmWWf95ZZ+6ehgqI9tA5AwZ+yHCbdzSctaeaqnMkQbRvqHu5d3ZD6xOdCMm9zK8IyoA9olHjqFyXJc3G/2crxRibxtxJTQ6x5SpSvtI2lvtjLleiofwcyDJxEwsEp+N0AjmzcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331084; c=relaxed/simple;
	bh=Aqf8s21nGYWx8wgfGAwdS9lPFF25iQGnE6SqmjuT560=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z84s0J6oT5Gu65gRnuVKefl07cNcsmcnqtiamBlWIC3Zj4l3Id//m2cEErSWH5vxLXEpc/9+09s/OBCAPOlWKVQ6qsY23qhclx5fqD15V8YJhX6ZQvkcbJZXSgiO5keJ03zgNFRfOVjdUIcgUv6fvLoX5eDx6lMYc3ojeN7a5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SongKb7a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SongKb7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768331083; x=1799867083;
  h=date:from:to:cc:subject:message-id;
  bh=Aqf8s21nGYWx8wgfGAwdS9lPFF25iQGnE6SqmjuT560=;
  b=SongKb7annNnB9YrBuNIs70aBmZUb8nWLa+Eoz92EIDYfOjxgsmGSNA/
   QcC5uzHqRbkmK3zbK0MJ6OmfnRZd0UiXqw3/PXsbQEGC9rCiCclBnsGPA
   U7b8Z+yrw1G2qORQXsRfdi9t9Wtl/1eA3OUWZnDfIjI3Rn2RAZ/gCybiG
   pQaeZaW6L81YORAgkrBYb/Hh43/BKoLRCLE8z52l1gyZ/0NO8pe+kZ9qf
   ozibZg4e1+5hp41/b/mjMWwgKZX/F1W4I5HW7y1nFekStrQnkOPvhbsOj
   ImCHdg/IMEPxYrFAFc9bcemOUDXRMij07SzsljMCM4/VCqIwK6MAMBjoa
   w==;
X-CSE-ConnectionGUID: /ET//BWvTLu9oDuPtarFgg==
X-CSE-MsgGUID: BvknaIFgQWWrbKyZu9nVyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69359200"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69359200"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:04:41 -0800
X-CSE-ConnectionGUID: tOdpRkmXS0quP3aIJtXzbw==
X-CSE-MsgGUID: HY/OtecKQkuOZ/ZHs6azPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203676538"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 11:04:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfjgx-00000000FFs-3jMZ;
	Tue, 13 Jan 2026 19:04:35 +0000
Date: Wed, 14 Jan 2026 03:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202601140212.9GTXIjNd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: b1ca384772b657df433acf0c36f0771d5ebe1138 drm/nouveau/gv100-: switch to volta semaphore methods
date:   8 months ago
config: x86_64-randconfig-121-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140212.9GTXIjNd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140212.9GTXIjNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140212.9GTXIjNd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/gv100_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:29:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:29:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:35:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:35:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:51:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/gv100_fence.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +25 drivers/gpu/drm/nouveau/gv100_fence.c

    14	
    15	static int
    16	gv100_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
    17	{
    18		struct nvif_push *push = &chan->chan.push;
    19		int ret;
    20	
    21		ret = PUSH_WAIT(push, 8);
    22		if (ret)
    23			return ret;
    24	
  > 25		PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(virtual),
    26					SEM_ADDR_HI, upper_32_bits(virtual),
    27					SEM_PAYLOAD_LO, sequence);
    28	
    29		PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
    30			  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, RELEASE) |
    31			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_WFI, EN) |
    32			  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
    33			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
    34	
    35		PUSH_MTHD(push, NVC36F, NON_STALL_INTERRUPT, 0);
    36	
    37		PUSH_KICK(push);
    38		return 0;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
