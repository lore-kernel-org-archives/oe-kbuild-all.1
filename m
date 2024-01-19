Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B354BC7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 19:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705692917; cv=none; b=L7BInqdeJ0YIWmjd5J3vQp1H7eylCK/HIUzkbqExMpKOmDIJbnPHeunC5ifsx0Y5HClr7zW6HAZU9KMjvjEeTH5hJfqeAwkRG294Q1GdAv7Hmeyipoo2p3z08sEA0JFKgM4Vj2azpJDkEuZT5h6+fSr1/j+hVdEXb2of29WwgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705692917; c=relaxed/simple;
	bh=KexRNc/OLKra7dHuENak1FMBf8RTMjxX/JK32V2OsvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggSVqMffG3trH0418LRXBIzcOz4+D4H/K8lG8jJ/x0X6xtbo3srq5D9xUMxDWRI9U3UEdJ2QDU6MDW5TMh8K4z2Gzz4GySMQ4yjv62MXW/H3HTGbhZLRhX/YzpEbpF1GzQ3l4En0Nl0tuIkCFhATw8kQHYLGF62wjrpdjF6xoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJlrpUlm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJlrpUlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705692914; x=1737228914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KexRNc/OLKra7dHuENak1FMBf8RTMjxX/JK32V2OsvI=;
  b=XJlrpUlm7s9Ik/9yTpXH0oS4SsdYClkK8c15oOmm4OI4jnrN3Rt3xekQ
   zFst1LKZUFdiVv7POsAK7iAim9ffsl6eqE2voiI7ftFVPoQHrzG6FttfF
   Tb5smv/KJ/gmb87ohbvySzNiAKQkp4DYS+/ULqrb0fxNFdckPkV9wM9xa
   y6vziFB9aka90Y23OaXLick3jkVuaBBoNftjNEn1/vcP88LTJEXCmdisd
   8jkNrCQzN6Asxceq2tPX+9rik74J++Izm5Z9FVhKZgkte8WVmLZuSEEON
   86iADjH2DL93o7O73j9xyfnVDqQKrlLezr5RBWOgMucUKtpgcbCmEcWxS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14181004"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="14181004"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 11:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908404722"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="908404722"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2024 11:35:13 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQudz-0004NQ-0j;
	Fri, 19 Jan 2024 19:35:11 +0000
Date: Sat, 20 Jan 2024 03:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21328/21561]
 drivers/scsi/sssraid/sssraid_fw.c:158:49: warning: '%d' directive writing
 between 1 and 11 bytes into a region of size 7
Message-ID: <202401200350.Hn25oAYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [21328/21561] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401200350.Hn25oAYc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200350.Hn25oAYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200350.Hn25oAYc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/sssraid/sssraid_fw.c: In function 'sssraid_alloc_resources':
>> drivers/scsi/sssraid/sssraid_fw.c:158:49: warning: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Wformat-overflow=]
     158 |                 sprintf(poolname, "prp_list_256_%d", i);
         |                                                 ^~
   In function 'sssraid_create_dma_pools',
       inlined from 'sssraid_alloc_resources' at drivers/scsi/sssraid/sssraid_fw.c:198:11:
   drivers/scsi/sssraid/sssraid_fw.c:158:35: note: directive argument in the range [-2147483641, 254]
     158 |                 sprintf(poolname, "prp_list_256_%d", i);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/scsi/sssraid/sssraid_fw.c:158:17: note: 'sprintf' output between 15 and 25 bytes into a destination of size 20
     158 |                 sprintf(poolname, "prp_list_256_%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +158 drivers/scsi/sssraid/sssraid_fw.c

   143	
   144	static int sssraid_create_dma_pools(struct sssraid_ioc *sdioc)
   145	{
   146		int i;
   147		char poolname[20] = { 0 };
   148	
   149		sdioc->prp_page_pool = dma_pool_create(
   150			"prp list page", &sdioc->pdev->dev, PAGE_SIZE, PAGE_SIZE, 0);
   151	
   152		if (!sdioc->prp_page_pool) {
   153			ioc_err(sdioc, "err: create prp page pool failed\n");
   154			return -ENOMEM;
   155		}
   156	
   157		for (i = 0; i < small_pool_num; i++) {
 > 158			sprintf(poolname, "prp_list_256_%d", i);
   159			sdioc->prp_small_pool[i] =
   160				dma_pool_create(poolname, &sdioc->pdev->dev,
   161						SMALL_POOL_SIZE, SMALL_POOL_SIZE, 0);
   162	
   163			if (!sdioc->prp_small_pool[i]) {
   164				ioc_err(sdioc, "err: create prp small pool %d failed\n",
   165					i);
   166				goto destroy_prp_small_pool;
   167			}
   168		}
   169	
   170		return 0;
   171	
   172	destroy_prp_small_pool:
   173		while (i > 0)
   174			dma_pool_destroy(sdioc->prp_small_pool[--i]);
   175		dma_pool_destroy(sdioc->prp_page_pool);
   176	
   177		return -ENOMEM;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
