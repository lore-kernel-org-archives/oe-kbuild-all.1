Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F203142E83
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Apr 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776605210; cv=none; b=kl3SrEiwQxSeFlg/p2VRh/nfqso6Sil2/sPzmMn71CL9yWNe9IIfiwpLAjFlEVomt5LphIMxdti6PzFjE/LhcTUnueodpu1np+z117NJYtHv458q9+O1mkwSmUEXXN8MDebSjVkDIg58CL73Ey8z757ZwmQMpNN7rTw/ekObzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776605210; c=relaxed/simple;
	bh=GRPrDPW14szoKarOaMPDj6SO/+273jVJi6UwedK7pWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pD0EyO0zrihV2BmRYrLPa8iItOmCKTiOwccPCrdCoSJhpqilm4mWqHpNZrFrDAp1Nb+esRyaH6xs0ZcwWjSOEXo0uu5MXHGenAjZI3qOMhIxcukzES1B4tDICwiMh2ScRJZpHVZzJcxQgz0km4KyONnW+gxfl/NRgPeIwTeu7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJpSwvEU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJpSwvEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776605208; x=1808141208;
  h=date:from:to:cc:subject:message-id;
  bh=GRPrDPW14szoKarOaMPDj6SO/+273jVJi6UwedK7pWg=;
  b=dJpSwvEU/g+0oJeOQuu2z4+TH5ZbsLXz+ROedwuJY397plm4UuIRPGzO
   pE2kTQ7+hRGreSXZr2i7nHEIpIUMFzzHXWUYaifZPiQIQoX+VwwNWWVLn
   teE9dDF81at/+uycRP/qI/J9XWSriwwGxzZiysSvFRzvar8qVd83PcG8O
   s60MBX3taPK/p7+UivSvM3v2eOJtXS5xLvQ1dSFQMjoPLGlDgyMz8RNP9
   4zX/Ztu1zvgFdbjaOp8sHYduMdifJLGko6+eFqaF9bpyc9SjNtc/KCCEu
   pknx6CRANHLk4JbE3dA2l4MNmHanSLuVUbM4OpPPv/Exb4F+VOYzteW3E
   Q==;
X-CSE-ConnectionGUID: ioOjwIxMQPCkgxCrdHipCw==
X-CSE-MsgGUID: e8m8kAEYT2Cr12wy/r5HUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81146676"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="81146676"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 06:26:48 -0700
X-CSE-ConnectionGUID: qthSQANtTWK9DLbUsadZgw==
X-CSE-MsgGUID: mvEh3tEEQomZTQ1t10Zv/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="226839866"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Apr 2026 06:26:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wESAe-000000001zL-2mCC;
	Sun, 19 Apr 2026 13:26:44 +0000
Date: Sun, 19 Apr 2026 15:26:14 +0200
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/dma/pool.c:320:55: error: 'DMA_ATTR_CC_DECRYPTED'
 undeclared
Message-ID: <202604191534.fFaxmUap-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-direct-swiotlb-handle-swiotlb-alloc-free-outside-__dma_direct_alloc_pages/20260419-084811
head:   1ec4723e78165ffe91782f086757128a19077206
commit: 6fed03ee2580c5b86fe14a7c0da9788281f2547a dma-pool: track decrypted atomic pools and select them via attrs
date:   13 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260419/202604191534.fFaxmUap-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604191534.fFaxmUap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604191534.fFaxmUap-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/pool.c: In function 'dma_alloc_from_pool':
>> kernel/dma/pool.c:320:55: error: 'DMA_ATTR_CC_DECRYPTED' undeclared (first use in this function)
     320 |                 if (dma_pool->decrypted != !!(attrs & DMA_ATTR_CC_DECRYPTED))
         |                                                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/dma/pool.c:320:55: note: each undeclared identifier is reported only once for each function it appears in


vim +/DMA_ATTR_CC_DECRYPTED +320 kernel/dma/pool.c

   309	
   310	struct page *dma_alloc_from_pool(struct device *dev, size_t size,
   311			void **cpu_addr, gfp_t gfp, unsigned long attrs,
   312			bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
   313	{
   314		struct dma_gen_pool *dma_pool = NULL;
   315		struct page *page;
   316		bool pool_found = false;
   317	
   318		while ((dma_pool = dma_guess_pool(dma_pool, gfp))) {
   319	
 > 320			if (dma_pool->decrypted != !!(attrs & DMA_ATTR_CC_DECRYPTED))
   321				continue;
   322	
   323			pool_found = true;
   324			page = __dma_alloc_from_pool(dev, size, dma_pool->pool, cpu_addr,
   325						     phys_addr_ok);
   326			if (page)
   327				return page;
   328		}
   329	
   330		if (pool_found)
   331			WARN(!(gfp & __GFP_NOWARN), "DMA pool exhausted for %s\n", dev_name(dev));
   332		else
   333			WARN(1, "Failed to get suitable pool for %s\n", dev_name(dev));
   334		return NULL;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
