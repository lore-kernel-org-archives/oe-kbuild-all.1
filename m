Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD6238CFEB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445328; cv=none; b=gbUoSDHqohEcmto99XY0KSB8VseEoqT4O4bgk0TiaKwCP5r45kvfQIla/WuVjfXLrHaxWDlPNnC0nvdsIxjjXejj3sZjkgLm3g7n/hNVdcZylaEyOK3csljKOYMzyfd3mpK4YTNpCGVo06ZmT50mB42duyqSJ1BD3HBGns+wgaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445328; c=relaxed/simple;
	bh=NErdrur2pfwtcmLsA1m33oWqy8BLYOWs5+2+qXUq6SU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQhQzOHInm8QIMzXmmpH6tCeW05rGp5CzsDrL1wxQvkKHA9GbQ8N7ihkBHxJYp4VkAYLjJH1RFBZnDfsxTt9/l+E+02KsaYKAb3dhhRI/6z2MZMWq0nG8PukPAH+5xrs/GTruS2a++jpwGGxR2SSI77BX8mAcajlvmWi2XDfi6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIKW9Qs6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIKW9Qs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445326; x=1803981326;
  h=date:from:to:cc:subject:message-id;
  bh=NErdrur2pfwtcmLsA1m33oWqy8BLYOWs5+2+qXUq6SU=;
  b=PIKW9Qs66xcYyYf90zQ6v3YNxyVURR14S+NSYSdMGqr0PmEHF/5oC2RM
   qarFfSocO68jJSGAnkCDaXDVzS4nW4jZXSSynGnj7c9EiJwsEUnWY7MRv
   LC3Bt0x/DkdssTU8C5F0qXy6hmMPVxSPAQpV+buski5+6EcM0EJygqjjf
   pCUrhAvNq1ZN/BO7ayFdnS72W9z33IE0H2l4LLdjSS4baq6kKMaRPU6QM
   xt6QncQ/cjDiItD3n8I1LJig7QS3Tyxhj67yKK2GXwEBUznMmIg+getDQ
   bXsPrO0fUr41F2kMvhP+2GwYFj9lUTxLa85WiR9m9rCLka+4QVMSbIIJv
   g==;
X-CSE-ConnectionGUID: EKTb1JkTRMe/WyDpErk4/A==
X-CSE-MsgGUID: HC3I9I64TICU9tZF+uGaRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84151025"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84151025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:55:26 -0800
X-CSE-ConnectionGUID: /6NN1SRAQPqY8W9OoFHhpA==
X-CSE-MsgGUID: C4aQmRL1SRm4eq9QcVzrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="216737059"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Mar 2026 01:55:25 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwzzl-000000000hg-2OJt;
	Mon, 02 Mar 2026 09:55:21 +0000
Date: Mon, 02 Mar 2026 17:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: drivers/mfd/ls2k-bmc-core.c:108:14: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202603021730.Yy3QXYTw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 0d64f6d1ffe96f59145481f7413344b1fa3ad1ce mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
date:   5 months ago
config: loongarch-randconfig-r112-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021730.Yy3QXYTw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021730.Yy3QXYTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021730.Yy3QXYTw-lkp@intel.com/

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
