Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3E10E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJJrIszb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699405860; x=1730941860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKS17sYaDCEyWkiDk5EsTfJpaqXNTvXg8O5cE3E3W40=;
  b=UJJrIszbDfjCt9WlqQ5kIjEIApEjwKUbtI7qU+rScIcchSTNbuJcdJds
   7EkBzAVA8VOTuCuOTe3+nnQCTkOe2yzi8o3nBXc+CGGvdA5WAjvFnZR+e
   j5QMOSApQJ72voirceudxR52tvip+41qP16JvX2ReVCfKw4rVgSi9kvvE
   fqgoEYyNG2oX1Vq+pNPrO8ZcLv8rJXtXwf0cH8ZWshqGJHz6uzDCA3on7
   4GFLszwxGASZzltjjOiw7uMTntCC+4Rw3n87UJQ2aLZi551DzhXAYnfit
   qxxki3WiYHIvcf/uIpUOvX6jvmeMyAKAr8ia7JLxzf3WMCXx5vjvhpHpb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475891257"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="475891257"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 17:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="10623719"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2023 17:10:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0X5a-0007XX-0j;
	Wed, 08 Nov 2023 01:10:38 +0000
Date: Wed, 8 Nov 2023 09:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202311080824.j8FQFyrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: 03bd158e1535e68bcd2b1e095b0ebcad7c84bd20 remoteproc: stm32: use correct format strings on 64-bit
date:   5 months ago
config: mips-randconfig-r122-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080824.j8FQFyrT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080824.j8FQFyrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080824.j8FQFyrT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/stm32_rproc.c:122:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     expected void *va
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     got void *va
   drivers/remoteproc/stm32_rproc.c:644:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +139 drivers/remoteproc/stm32_rproc.c

13140de09cc2dd5 Fabien Dessenne 2019-05-14  114  
13140de09cc2dd5 Fabien Dessenne 2019-05-14  115  static int stm32_rproc_mem_alloc(struct rproc *rproc,
13140de09cc2dd5 Fabien Dessenne 2019-05-14  116  				 struct rproc_mem_entry *mem)
13140de09cc2dd5 Fabien Dessenne 2019-05-14  117  {
13140de09cc2dd5 Fabien Dessenne 2019-05-14  118  	struct device *dev = rproc->dev.parent;
13140de09cc2dd5 Fabien Dessenne 2019-05-14  119  	void *va;
13140de09cc2dd5 Fabien Dessenne 2019-05-14  120  
03bd158e1535e68 Arnd Bergmann   2023-06-09  121  	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
13140de09cc2dd5 Fabien Dessenne 2019-05-14 @122  	va = ioremap_wc(mem->dma, mem->len);
13140de09cc2dd5 Fabien Dessenne 2019-05-14  123  	if (IS_ERR_OR_NULL(va)) {
03bd158e1535e68 Arnd Bergmann   2023-06-09  124  		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
13140de09cc2dd5 Fabien Dessenne 2019-05-14  125  			&mem->dma, mem->len);
13140de09cc2dd5 Fabien Dessenne 2019-05-14  126  		return -ENOMEM;
13140de09cc2dd5 Fabien Dessenne 2019-05-14  127  	}
13140de09cc2dd5 Fabien Dessenne 2019-05-14  128  
13140de09cc2dd5 Fabien Dessenne 2019-05-14  129  	/* Update memory entry va */
13140de09cc2dd5 Fabien Dessenne 2019-05-14  130  	mem->va = va;
13140de09cc2dd5 Fabien Dessenne 2019-05-14  131  
13140de09cc2dd5 Fabien Dessenne 2019-05-14  132  	return 0;
13140de09cc2dd5 Fabien Dessenne 2019-05-14  133  }
13140de09cc2dd5 Fabien Dessenne 2019-05-14  134  
13140de09cc2dd5 Fabien Dessenne 2019-05-14  135  static int stm32_rproc_mem_release(struct rproc *rproc,
13140de09cc2dd5 Fabien Dessenne 2019-05-14  136  				   struct rproc_mem_entry *mem)
13140de09cc2dd5 Fabien Dessenne 2019-05-14  137  {
13140de09cc2dd5 Fabien Dessenne 2019-05-14  138  	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
13140de09cc2dd5 Fabien Dessenne 2019-05-14 @139  	iounmap(mem->va);
13140de09cc2dd5 Fabien Dessenne 2019-05-14  140  
13140de09cc2dd5 Fabien Dessenne 2019-05-14  141  	return 0;
13140de09cc2dd5 Fabien Dessenne 2019-05-14  142  }
13140de09cc2dd5 Fabien Dessenne 2019-05-14  143  

:::::: The code at line 139 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
