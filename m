Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717C3191D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318680; cv=none; b=o5l4Y2I8ZgKwvErfwwn8qS/qoW/VYAfJ8HL9oomLLm3q5rG5bsihVwYLtfCk+rWPF4vyD1v47UYNn4mZqpi28BPAFxsnrFWyVOOxRokvtAqkuWAxaxcBoyDaMsAzoKUZpIUXkI5RCASaMLkPV94liBuv7zk3MwiOLIHYi+ziTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318680; c=relaxed/simple;
	bh=+ejNYfoxlRJooZBtx+JBMMAuC+6y0vbX5eGwzIlijzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SUc3JPO+hnjiUgwnSePDm6LJtvUK3ceM7813dyne9IjzfLVNI27/BX9819GpUW6pi8nwBgOBnLxUGcKnaW6R8Fec3mGYMVBVGtgVTy+yntciDFKy03LE16FtdrizwoNOVS+BdgPzwlhzg1iOGIjg41K9TnSbONVxvTLxUsVcSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+nL+bex; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+nL+bex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784318678; x=1815854678;
  h=date:from:to:cc:subject:message-id;
  bh=+ejNYfoxlRJooZBtx+JBMMAuC+6y0vbX5eGwzIlijzk=;
  b=K+nL+bexIxGEYM138gB7P1lUlZSU2oWAxLNlo84r1INpfg5LNi+1u4p3
   t8MkF5sRfkAYV0N//VWBdn7Z7bG2ZlWdgcp9RvR+VsTohOPh6JkdU144i
   jwVDEzbdTssZ6LxmWtR34lmOrr+xVPovqvIwRCCKgXjC6KoobSKpKeZUC
   3cw8a6mKeZQhLcV+SLBISwqJIENWEZB3qoKi65iYuT0x2SNergwwFpuq9
   LG/n77GHtkrQUszskaBq1ed/WbZN1OCAXq242zZ7z+spvsw9n2VADqY07
   V9LrnWBawE1nqf3ICfmW5UUgIWcTUbBSMZJWesYOXRaYdxHsWRcv9vanX
   g==;
X-CSE-ConnectionGUID: EnBAwp9eTleYj+UtewvQqg==
X-CSE-MsgGUID: 2WyABEvtSBi8nJ1XX36boA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95593006"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="95593006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:04:38 -0700
X-CSE-ConnectionGUID: 9/9LlH0pTZa/uvK7UyrfRQ==
X-CSE-MsgGUID: ewu6ja61TcW9FsdPu2u9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="280158556"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2026 13:04:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkonR-00000000T7I-25fM;
	Fri, 17 Jul 2026 20:04:33 +0000
Date: Sat, 18 Jul 2026 04:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: drivers/mfd/ls2k-bmc-core.c:108:14: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202607180345.NlFCW3XO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af5e34a41cd607c00ef752e00331736570992354
commit: 0d64f6d1ffe96f59145481f7413344b1fa3ad1ce mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
date:   10 months ago
config: loongarch-randconfig-r112-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180345.NlFCW3XO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180345.NlFCW3XO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180345.NlFCW3XO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/ls2k-bmc-core.c:108:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *mode @@     got void [noderef] __iomem * @@
   drivers/mfd/ls2k-bmc-core.c:108:14: sparse:     expected char *mode
   drivers/mfd/ls2k-bmc-core.c:108:14: sparse:     got void [noderef] __iomem *

vim +108 drivers/mfd/ls2k-bmc-core.c

    97	
    98	/*
    99	 * Currently the Loongson-2K BMC hardware does not have an I2C interface to adapt to the
   100	 * resolution. We set the resolution by presetting "video=1280x1024-16@2M" to the BMC memory.
   101	 */
   102	static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
   103	{
   104		char *mode;
   105		int depth, ret;
   106	
   107		/* The last 16M of PCI BAR0 is used to store the resolution string. */
 > 108		mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
   109		if (!mode)
   110			return -ENOMEM;
   111	
   112		/* The resolution field starts with the flag "video=". */
   113		if (!strncmp(mode, "video=", 6))
   114			mode = mode + 6;
   115	
   116		ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
   117		if (ret)
   118			return ret;
   119	
   120		ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
   121		if (ret)
   122			return ret;
   123	
   124		ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
   125		if (ret)
   126			return ret;
   127	
   128		pd->stride = pd->width * depth / 8;
   129		pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
   130	
   131		return 0;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
