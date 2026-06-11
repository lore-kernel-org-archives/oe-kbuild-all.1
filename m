Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F738F651
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216157; cv=none; b=bySerHZHPrlYOQJYIwcnBVExVnklXKez6yGhE34YymBeY00aYE/QlB2yAGJjl88vwNfjWcHAmxKcc1s5QdB5Hjnoubrm1JpGZOuOACN3UmQnmlsg9H9RZn1W9Ufz3z30iMZtSoVVa2Iu5fhNORRVfa+9jUEiWQ3KnwgFSVAGGko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216157; c=relaxed/simple;
	bh=fh5fkYNPXSIfBtCsdQ9W2y4pXTvadvSO/pvFgXbrdrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yp5SIgdksUv27x92+6BTYFfs6eDLnM4aSYrfScDQCVzTdx2bHNMjbuTRyn/qdbzl0JYIgP7cqJv9oBEF4WHDAjt2bktCo5ALBxTiOAqLJ6L/PSQRBBy+r4jIac1pfmVvD6mU+24JwNGPs8eBXkYT8r3FyCB2mgwwnLNJpnZftJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3/gXmOs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3/gXmOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781216154; x=1812752154;
  h=date:from:to:cc:subject:message-id;
  bh=fh5fkYNPXSIfBtCsdQ9W2y4pXTvadvSO/pvFgXbrdrc=;
  b=b3/gXmOs2sYyI6dB0qhDvFuSPmX59I855O8HH1wedRSu3zgCPQ8IgBXN
   4Lltwfl0OVp0H4r1yWqYYHVs2HdWl7Ig0LovKzN7/dt/7MUftL5rxuJ1s
   x33CwveyRPeAo9InfLunNEYB7d3hm7LhwHw0QI2f6/tBfpNAz8Seg7NAd
   0ncEk11rnApzkvzlTOFbcPEBJjRIi9RiJLPGPAus5LbRRE1XA4VXFqBDp
   QLfVc50kDCnBOAmz8WyPQ9PFVxq5m//k6csr4XGNkG+S8o1UDltkFom+3
   5xO16bxb84HPeK7hxm6vu46UAiigovhzpMmZ/bKMNXTR61mJ3yDZBFFcz
   w==;
X-CSE-ConnectionGUID: J7mEuNztSTmKpspDzxzEpA==
X-CSE-MsgGUID: tLthybNaTt+1FvQwlu3MeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82152295"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82152295"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:15:54 -0700
X-CSE-ConnectionGUID: JPbZnScjRYuxfnyEBHdfUg==
X-CSE-MsgGUID: QrVswOxdSLO1BJspGzzo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="245531816"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 15:15:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXngj-00000000Nvh-0UP2;
	Thu, 11 Jun 2026 22:15:49 +0000
Date: Fri, 12 Jun 2026 06:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: drivers/mfd/ls2k-bmc-core.c:108:14: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202606120639.WG6eb8VU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 0d64f6d1ffe96f59145481f7413344b1fa3ad1ce mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
date:   8 months ago
config: riscv-randconfig-r123-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120639.WG6eb8VU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120639.WG6eb8VU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120639.WG6eb8VU-lkp@intel.com/

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
