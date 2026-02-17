Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7714D29B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 02:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771296854; cv=none; b=D+BNHwT7z88MQ145U92HKHYRwnSRFZA/kZSsUs2QSf6Cr1rOXXa01jrYRz8safw0GEx1P59TSs2OZyInd8Jcnyk5//GvobUs6cSfrL0t9Otj3xOSFC9FLXlhYdE1kuxN/TIzZ8ff33IVsIMeZwQcqK95++8jgdvD0JpbzgXR8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771296854; c=relaxed/simple;
	bh=EP/MJl6uFl7O4p9b4Mp4t68tJjvpGiVanta+5lkXx9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=feK10MSKFsUh4QGKA6b00ELL8TDb9385Xa1dXoXPSRlpg9ETJA4756/jgw03Ot8KNW3bOzjgzOKMaGMGhNuwpvcFpp5mYtbg2sZRSRK2QlEET+I7zXWEwbCNNakSON1637VrWMOY0RcdloExABHX6L+PpnOPHPis8gsSUBoF1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp/uQg5L; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp/uQg5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771296853; x=1802832853;
  h=date:from:to:cc:subject:message-id;
  bh=EP/MJl6uFl7O4p9b4Mp4t68tJjvpGiVanta+5lkXx9o=;
  b=Fp/uQg5LpIs47mo0lWKP2KpI6PWziz7FP+si9IohipF8FSvErEAuQmv+
   w2cH4lQhTET/T58owipGvcF6OgiUMmV7dJ+59H+xOtqnfl5DxgjgdAIqt
   NTvk3YQFGl9Zp787Jn5UxlDyCrHTAbDxSV7yyQeTAZuRWgNEfyUQ6xFrm
   8SrSKQJF8cRLZ9kgTffFTnrMuWWzG5o3eaZYD04Bp5vspS9TPKIDIWHiT
   B8iK6X0kzQEoINmdnPpiDdEp6ASyhOmuQHQiXywuzmLeOwB8gw9w5vaor
   R1eVi3zaoSRC4LyX5Jg91LXKp5HXZjeUbC1q8x0SKSkKoO1YZA9ynFhIT
   g==;
X-CSE-ConnectionGUID: TjThefoiS1WiGWuQ4sOoQg==
X-CSE-MsgGUID: LI0LXs+eRgaXNQrLN52kBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72267964"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72267964"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:54:12 -0800
X-CSE-ConnectionGUID: sO0Sc/hYSXmqZHRGO7aAEw==
X-CSE-MsgGUID: VawDrTWCTMa2tyve73ZB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="244344676"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2026 18:54:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsBE0-000000010ZE-0Ok0;
	Tue, 17 Feb 2026 02:54:08 +0000
Date: Tue, 17 Feb 2026 10:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/gv100_fence.c:25:9: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202602171020.IoX6CRFs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: b1ca384772b657df433acf0c36f0771d5ebe1138 drm/nouveau/gv100-: switch to volta semaphore methods
date:   9 months ago
config: loongarch-randconfig-r131-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171020.IoX6CRFs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171020.IoX6CRFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171020.IoX6CRFs-lkp@intel.com/

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
