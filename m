Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFCB40BE3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zq0Au4Xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701956448; x=1733492448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gC+5aft9ozWQVDCDl/u6T3mecmIgG+ZwP5eqt1lPTSY=;
  b=Zq0Au4Xzmb/wtamxuZCyeRLPnOwWGmrlPzMhEDqEhK3Hfaz9O86BsYz9
   wS6x56KkoS7qpwJ3/KuwFe1cazoa20f1UWwyvIlXTr1d9fhK3C8qvrJZx
   ZllWaD/rRp4Uyv7xyys5c5o3BahUCU8ZnmD7xBVnAXdO5thfN7FjgEvwb
   FvRvlDQ/7/xcfBjjoDVPasrtvAkIbVO/ToYeGHBZjpgU8C3YzZGJSzGP3
   QxpBwZDjpyflvbZDN/Ffe0l3d0PMbHOuXTG3b9WcJuGs8hj1aIN7RzFxC
   bmvQKaYi0g4zxe8zalB7cdGvzIQsVZBanaQ+eqEjxF3nrX0F2AblM/BdI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379247556"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="379247556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19704759"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2023 05:40:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBEcO-000CJ8-00;
	Thu, 07 Dec 2023 13:40:44 +0000
Date: Thu, 7 Dec 2023 21:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@iot.bzh>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: drivers/remoteproc/rcar_rproc.c:45:20: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202312072159.2k3mbRlb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 285892a74f1370a12249f765c6a4e3b16194852e remoteproc: Add Renesas rcar driver
date:   2 years ago
config: mips-randconfig-r122-20231108 (https://download.01.org/0day-ci/archive/20231207/202312072159.2k3mbRlb-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312072159.2k3mbRlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072159.2k3mbRlb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/rcar_rproc.c:28:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/rcar_rproc.c:28:12: sparse:     expected void *va
   drivers/remoteproc/rcar_rproc.c:28:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/rcar_rproc.c:45:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/rcar_rproc.c:45:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/remoteproc/rcar_rproc.c:45:20: sparse:     got void *va

vim +45 drivers/remoteproc/rcar_rproc.c

    20	
    21	static int rcar_rproc_mem_alloc(struct rproc *rproc,
    22					 struct rproc_mem_entry *mem)
    23	{
    24		struct device *dev = &rproc->dev;
    25		void *va;
    26	
    27		dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
  > 28		va = ioremap_wc(mem->dma, mem->len);
    29		if (!va) {
    30			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
    31				&mem->dma, mem->len);
    32			return -ENOMEM;
    33		}
    34	
    35		/* Update memory entry va */
    36		mem->va = va;
    37	
    38		return 0;
    39	}
    40	
    41	static int rcar_rproc_mem_release(struct rproc *rproc,
    42					   struct rproc_mem_entry *mem)
    43	{
    44		dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
  > 45		iounmap(mem->va);
    46	
    47		return 0;
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
