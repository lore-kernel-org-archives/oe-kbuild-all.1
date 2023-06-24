Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35B3C10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 20:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687639339; x=1719175339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEkUNVlwnKZwQrmEbnY3cUvApUeB5dZ6HtNANN0iOcc=;
  b=NTQemiv3rf9qcYCnogTV3YAbGRjJ0cZABDgNVXCgyAJlYWZTr2Ej2hu+
   bEPnj8H3DS0q7ROSNqJwOtiJNybqEPVkbzt2yP1DdciVyfHcMbmM/CHbS
   3Vxc8v2Kjk9LRb1syn0Q4wMxZI2T5j6obSjZFuyNM8z3QDxPAPexpkCU7
   hKZXttQOuZYkhI5sf6xnt2ctUYhAFy5DQaVZT9xBqJbWQERw9h5Q7G7ZJ
   p+UxiFjY9fnUC1acJP403QEluWU+7u2beGay/CTU80TNop1ioNpQNTZHv
   hYX9ASM7b1eWlrtNW0mO3ESOzLtY2WirbQsKtYj9wwxAZ5ADLkX6HAX/L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="359852304"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="359852304"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 13:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="709795514"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="709795514"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jun 2023 13:42:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDA5I-0009Ov-14;
	Sat, 24 Jun 2023 20:42:16 +0000
Date: Sun, 25 Jun 2023 04:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6299/12162]
 drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202306250422.UozRcpxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 9e4e24414cc6b45bd887d746a59691e295431ddf [6299/12162] arm64: introduce STM32 family on Armv8 architecture
config: arm64-randconfig-s043-20230625 (https://download.01.org/0day-ci/archive/20230625/202306250422.UozRcpxb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250422.UozRcpxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306250422.UozRcpxb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/stm32_rproc.c:122:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     expected void *va
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     got void *va
   drivers/remoteproc/stm32_rproc.c:644:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +139 drivers/remoteproc/stm32_rproc.c

13140de09cc2dd Fabien Dessenne 2019-05-14  114  
13140de09cc2dd Fabien Dessenne 2019-05-14  115  static int stm32_rproc_mem_alloc(struct rproc *rproc,
13140de09cc2dd Fabien Dessenne 2019-05-14  116  				 struct rproc_mem_entry *mem)
13140de09cc2dd Fabien Dessenne 2019-05-14  117  {
13140de09cc2dd Fabien Dessenne 2019-05-14  118  	struct device *dev = rproc->dev.parent;
13140de09cc2dd Fabien Dessenne 2019-05-14  119  	void *va;
13140de09cc2dd Fabien Dessenne 2019-05-14  120  
13140de09cc2dd Fabien Dessenne 2019-05-14  121  	dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14 @122  	va = ioremap_wc(mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  123  	if (IS_ERR_OR_NULL(va)) {
13140de09cc2dd Fabien Dessenne 2019-05-14  124  		dev_err(dev, "Unable to map memory region: %pa+%x\n",
13140de09cc2dd Fabien Dessenne 2019-05-14  125  			&mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  126  		return -ENOMEM;
13140de09cc2dd Fabien Dessenne 2019-05-14  127  	}
13140de09cc2dd Fabien Dessenne 2019-05-14  128  
13140de09cc2dd Fabien Dessenne 2019-05-14  129  	/* Update memory entry va */
13140de09cc2dd Fabien Dessenne 2019-05-14  130  	mem->va = va;
13140de09cc2dd Fabien Dessenne 2019-05-14  131  
13140de09cc2dd Fabien Dessenne 2019-05-14  132  	return 0;
13140de09cc2dd Fabien Dessenne 2019-05-14  133  }
13140de09cc2dd Fabien Dessenne 2019-05-14  134  
13140de09cc2dd Fabien Dessenne 2019-05-14  135  static int stm32_rproc_mem_release(struct rproc *rproc,
13140de09cc2dd Fabien Dessenne 2019-05-14  136  				   struct rproc_mem_entry *mem)
13140de09cc2dd Fabien Dessenne 2019-05-14  137  {
13140de09cc2dd Fabien Dessenne 2019-05-14  138  	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
13140de09cc2dd Fabien Dessenne 2019-05-14 @139  	iounmap(mem->va);
13140de09cc2dd Fabien Dessenne 2019-05-14  140  
13140de09cc2dd Fabien Dessenne 2019-05-14  141  	return 0;
13140de09cc2dd Fabien Dessenne 2019-05-14  142  }
13140de09cc2dd Fabien Dessenne 2019-05-14  143  

:::::: The code at line 139 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
