Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB2423504B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799774; cv=none; b=MvSQVYipuegkg5hlDLqbuDCUFRRRUYjjMZPSCeMLJ4oRfU8/bxmdkAjrXd7oYt5YxeevI5HS1kydx4H1Ahm3DZsOKdXvQNIQaBP/MCAZ92n/McD2+OK6h/T8Bhh8uiWwBc8wU7sXC3iS3dofCefTeh3/67XaRKxMcBvJDKab1Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799774; c=relaxed/simple;
	bh=VNz64Z9+Bfrr/hJ0OOuikGRsEYPlUxzR+yRX/OicRA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PMrOFmdGDgBa9X/Wi6yRBSBO/+WKx7AJyRxXrthCaAmUz4+JoqDa4ubuYdHY+bgH7bcyC1iA2hlZpVyh23UYWNwr9Ley533UQtexWPDKpVOAz5dXA9WXnCeky5ic4y/jPjHkdkrNXb29E1h4KKV+D9s9mrYRUVKgi9tmelWQvz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4/bRtau; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4/bRtau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779799774; x=1811335774;
  h=date:from:to:cc:subject:message-id;
  bh=VNz64Z9+Bfrr/hJ0OOuikGRsEYPlUxzR+yRX/OicRA4=;
  b=I4/bRtau+sgUhFmZNYU+cP7tmEPuSq3gHr2XiJY2js/0shZDh4go7MWW
   afIxlcop++MIEnHVg53aPCd2RsXnApbWExSLpheoj4gcLvHVYHGFfOGs/
   Yro9DSxlJYpQ6R6FKk6VHggxfu7hRVtpByQhskHt37VtHIGFSKfzsnjyl
   9tZ+4peARR8VfbmZsODYeP2oodf8qaGDjJNjp12Az+sSYCyWhvPG5yE5G
   T6IU5ccpSBkvmonKuW0T5Nk4vOMB76xn+8ZX0/dbPsrCTC8dfSOT8kQmS
   qVPlVzRqNlnvMLwOD1+KoL+txGsnSnUwpu3LouUC5SaRyHPUfh4My7N9l
   w==;
X-CSE-ConnectionGUID: gLdDatrhQkqu7o2JstztLA==
X-CSE-MsgGUID: JXd8PcfPQeqGv969UQoy/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84234704"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="84234704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 05:49:33 -0700
X-CSE-ConnectionGUID: ldWLM7uvRr6mC8OOHswkyQ==
X-CSE-MsgGUID: f7AiYT8DTu2yF7/eqETrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="280030915"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2026 05:49:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRrDt-00000000CPB-3XgO;
	Tue, 26 May 2026 12:49:29 +0000
Date: Tue, 26 May 2026 14:48:31 +0200
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: kernel/dma/swiotlb.c:1064 function parameter
 'tbl_dma_addr' not described in 'swiotlb_search_pool_area'
Message-ID: <202605261438.52EDpEWE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/arm64-coco-Add-pKVM-as-a-CC-platform/20260522-123257
head:   48b7a6a94c622afbb9b82956563ad16acafba74a
commit: 92338007dfd49f090be22621bc42b55135186797 dma: swiotlb: track pool encryption state and honor DMA_ATTR_CC_SHARED
date:   4 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260526/202605261438.52EDpEWE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261438.52EDpEWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261438.52EDpEWE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/dma/swiotlb.c:1064 function parameter 'tbl_dma_addr' not described in 'swiotlb_search_pool_area'
>> Warning: kernel/dma/swiotlb.c:1064 function parameter 'tbl_dma_addr' not described in 'swiotlb_search_pool_area'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
