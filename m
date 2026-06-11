Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ACE423170
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192040; cv=none; b=teNy5nH/Brw4cJTkaZh8ZuhvscU1CEI/Iwit3Bnkb8JtlMSi5LQjUY/1VQAzKOt1p8pEMEFIvQk/PI1idxJ0rTA8Zu++z4RByPADcrWKTPdchMisjQhHwn6iCSw12wRd1/kx8nx38dlKB09PB+39sG5ADgbeP4hDYLjQyA3u3F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192040; c=relaxed/simple;
	bh=9xmo6yHsCV0Rg8MRin+YZhhgmNDjZyfRpciF0Pr4/w4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jV8Lr5DPoBGcRUMls4z8H6An2ea9D4sdVA2YAUPItX9Xq01O+HFff68uofXBYCUFfLbue94sIHbuRvCjna6L38tPS1cStodIttxgAMn6sasB4UD8UvWBaRHIRLtg1Wnyf2kz3PcNN6dIUGmR0RmXWIRByj7iqltLqEXP/19hbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqMawpei; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqMawpei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781192037; x=1812728037;
  h=date:from:to:cc:subject:message-id;
  bh=9xmo6yHsCV0Rg8MRin+YZhhgmNDjZyfRpciF0Pr4/w4=;
  b=CqMawpeitsjs7o9SaMjoPrM//nCpI89fXIac0lAtJdZ/hfw+ahZY8kMr
   WSitIgosoVQrm7rE5v1wODSP0+pTnUsInpTxxSFCsx3PkbFagHsplsSj9
   TcpigM4IO4GWSkzJh43iOZktMSIGSZyqogBL62peyIiEHHPsMlsGv3iI4
   3wg+0hfYePrVLDDYms0/tV5Hx49J3bCD+Vh1SdrgDzhbjPjtq5TQAcbDw
   F/RUsT1RrXFhJdq9MWQJdrH6r7T3T0Zy8d0L0PC2S8ucteh08dfvoDWXJ
   CP42kMai6U9fGGIhxZ7EHKigQlS96hBkyUNQWcpFetqQ8XSIaK4ykyChg
   g==;
X-CSE-ConnectionGUID: wpIWVSIOQZqurD2djmlnLQ==
X-CSE-MsgGUID: BUaVDTOpTLuL5f7dlqHG+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82115538"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82115538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:33:56 -0700
X-CSE-ConnectionGUID: n8vb8tOgRXCJkjZ2rbSM6A==
X-CSE-MsgGUID: Z1BzjFuHRQG3sJwy1lbEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270183860"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 08:33:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhPj-00000000NLi-2HnD;
	Thu, 11 Jun 2026 15:33:51 +0000
Date: Thu, 11 Jun 2026 23:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202606112339.qedgsPAM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 862450a85b85a3e88e9065c9d2421f3ef17d054c drm/nouveau/gf100-: track chan progress with non-WFI semaphore release
date:   1 year, 1 month ago
config: powerpc-randconfig-r112-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112339.qedgsPAM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112339.qedgsPAM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 862450a85b85 ("drm/nouveau/gf100-: track chan progress with non-WFI semaphore release")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112339.qedgsPAM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chanc36f.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chanc36f.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +36 drivers/gpu/drm/nouveau/nvif/chanc36f.c

    25	
    26	static int
    27	nvif_chanc36f_sem_release(struct nvif_chan *chan, u64 addr, u32 data)
    28	{
    29		struct nvif_push *push = &chan->push;
    30		int ret;
    31	
    32		ret = PUSH_WAIT(push, NVIF_CHANC36F_SEM_RELEASE_SIZE);
    33		if (ret)
    34			return ret;
    35	
  > 36		PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(addr),
    37	
    38					SEM_ADDR_HI, upper_32_bits(addr),
    39	
    40					SEM_PAYLOAD_LO, data);
    41	
    42		PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
    43			  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, RELEASE) |
    44			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_WFI, DIS) |
    45			  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
    46			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
    47	
    48		return 0;
    49	}
    50	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
