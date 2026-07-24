Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8534E761
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879662; cv=none; b=LFoljWSxYXabCFeqVd5j4y3lXb4DR5R/fjBAXzA5AIPs1uRya0r5c3IC+35RMiLYP3EbDD7Aru6x1zgfoIA2y1qk46oCVlK4xvZt5kAOiCGykf9AIsHX1e3a4RHw+lr50fG+JXtFlabkQtxSWBzBmHYUVsXRkk8bRufQtrXa0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879662; c=relaxed/simple;
	bh=Yc4wPV+8NG9uCiz7vE7W/NEU82+Hix3PIIbRpyoBeFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KM0ZvtIsZDAeprrecwiniN2W8YxrioHlKmFo+Cp1T7p0nXWEju9yg5qyUq3hTl6RhFoEF9kxEXAhcZlI5NPhFCSobkQ74Lc/QRxjptS15D/1WLnF+9Ud9D3m9nwkqQow2GnKiGK63SMP/TjY4NMCbToHkfaiCKuye0jNzbER8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4Ds0pKf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4Ds0pKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784879660; x=1816415660;
  h=date:from:to:cc:subject:message-id;
  bh=Yc4wPV+8NG9uCiz7vE7W/NEU82+Hix3PIIbRpyoBeFY=;
  b=g4Ds0pKfmBYIHfJNtRd+9xN0Ua956kMFsxcR4HjBc/82pJOZthdpTP+7
   ZXGLdXC4pVGFSXaCu/6FsxxIsmiB3jYrXHC4QIAWTUNkaxNdcMazRLKS4
   xbMiHcX59Wnyb3W4qa7SEQfixMGFrX/dR2TqwhsGcnOhzTyDBapXL5IN8
   Yv0nUjJkUt9Kyow28uh7hmHBodcPhWNLUcs6FcF3Vp1xtXSl8m0oH9FLN
   i1JKCyUKZR6RXWo8GcmcBfwNhpBB7fDqcEQTnFSLIB8PowHHbYP0+uL01
   xNCwKR5fDE7WNmCzEZOI8/qhQhpzdWuPOylEN3yNajFnfEKLpTJVZ0jvo
   A==;
X-CSE-ConnectionGUID: CNysBzwOR8eZpJdKCM8Bbg==
X-CSE-MsgGUID: wvxa5+kOTFmFdHiAemNgSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89369191"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="89369191"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 00:54:02 -0700
X-CSE-ConnectionGUID: Tsg2IeoDS6KBkfx4Bck9hA==
X-CSE-MsgGUID: +evSySwrTOWpY8NpaJKiYA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2026 00:54:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnAjF-00000000abW-2Wqs;
	Fri, 24 Jul 2026 07:53:57 +0000
Date: Fri, 24 Jul 2026 15:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: drivers/usb/cdns3/cdnsp-gadget.c:168:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202607241509.EvrBgNYl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: e4d7362dc9cd50b0fc74c8649aa241376c48936c usb: cdns3: Add USBSSP platform driver support
date:   3 months ago
config: sparc-randconfig-r113-20260724 (https://download.01.org/0day-ci/archive/20260724/202607241509.EvrBgNYl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241509.EvrBgNYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e4d7362dc9cd ("usb: cdns3: Add USBSSP platform driver support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607241509.EvrBgNYl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:168:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:168:16: sparse:     expected unsigned int [usertype] l
   drivers/usb/cdns3/cdnsp-gadget.c:168:16: sparse:     got restricted __le32 [usertype]

vim +168 drivers/usb/cdns3/cdnsp-gadget.c

3d82904559f4f5a Pawel Laszczak 2020-12-07  150  
241e2ce88e5a494 Pawel Laszczak 2025-04-18  151  static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
241e2ce88e5a494 Pawel Laszczak 2025-04-18  152  {
241e2ce88e5a494 Pawel Laszczak 2025-04-18  153  	struct cdns *cdns = dev_get_drvdata(pdev->dev);
241e2ce88e5a494 Pawel Laszczak 2025-04-18  154  	__le32 __iomem *reg;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  155  	void __iomem *base;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  156  	u32 offset = 0;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  157  	u32 val;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  158  
241e2ce88e5a494 Pawel Laszczak 2025-04-18  159  	if (!cdns->override_apb_timeout)
241e2ce88e5a494 Pawel Laszczak 2025-04-18  160  		return;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  161  
241e2ce88e5a494 Pawel Laszczak 2025-04-18  162  	base = &pdev->cap_regs->hc_capbase;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  163  	offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
241e2ce88e5a494 Pawel Laszczak 2025-04-18  164  	reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
241e2ce88e5a494 Pawel Laszczak 2025-04-18  165  
241e2ce88e5a494 Pawel Laszczak 2025-04-18  166  	val  = le32_to_cpu(readl(reg));
241e2ce88e5a494 Pawel Laszczak 2025-04-18  167  	val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
241e2ce88e5a494 Pawel Laszczak 2025-04-18 @168  	writel(cpu_to_le32(val), reg);
241e2ce88e5a494 Pawel Laszczak 2025-04-18  169  }
241e2ce88e5a494 Pawel Laszczak 2025-04-18  170  

:::::: The code at line 168 was first introduced by commit
:::::: 241e2ce88e5a494be7a5d44c0697592f1632fbee usb: cdnsp: Fix issue with resuming from L1

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
