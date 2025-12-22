Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C92E7185
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408883; cv=none; b=p9tkhn0GOxtfkez50Q36hpLsdvIEjMCHew7xGYO7CFhRoQ9vS40UkJBZSEyJCS8LzZqDTI3zlJfJOlHMeCSJQ8Nc2KMESdxUo3+Cbv/2H4PXNVXP9EFz3rqB5yv0uDmuY6Hd1C4EzwDOy6qNB3rpsp5oqdxfeaEQOGwk1OX7ZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408883; c=relaxed/simple;
	bh=nW580xmKkBBwfdHVCyeFHnaYMiulchCq86JgVCw1wAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oxNocuRRgiyVBVD1eFp2nZybnmQfNLTpI2F5haJiUHhAQVWp1/68NGImFAu65WdwMBulg3VXeFJcQlvaRWJ+wocyeeeMbUbY45JcuEVNLtpiNhfAYPn3dUr4raJRw1vdhTWJDf6I1p0iyqeEU8yLk46IpQ/YD4eLmJoRt9iQE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MT6C9hzC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MT6C9hzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766408882; x=1797944882;
  h=date:from:to:cc:subject:message-id;
  bh=nW580xmKkBBwfdHVCyeFHnaYMiulchCq86JgVCw1wAk=;
  b=MT6C9hzC+qxmksMEitsCmL8CV0Urcvt/1ZgetIBzluq3bsNbT6Dr7DKD
   GkcnPzOIY8QFKWRVzdatDXkOomC73bdfXAXS8IiSDTi9dhEbObWJWa7Jl
   qy2m3Hk79A21skLMw32YVw4soSb2vBKv45oNRUOeu1rhhslCSaHpuIna4
   dKjC7IWL1c5+UaNXVYdkDwQ5ReD1nGl3kHNtpuG3PoNf1sN5y4wMhMYGH
   EEzlBlfT4BZohNgxsYD6O/3RmLYLjjDZ8F0IG5a4flLAUuiouqfCbXNxe
   VGvyUYXZLtkr6Rtw/e141gzUcEC+KfnKwtxnOlty9+fK7unKqjbGRCOiG
   g==;
X-CSE-ConnectionGUID: 6zKxRIgaSPu7vaYPesbYYA==
X-CSE-MsgGUID: Prc9y2KvT6GVRGcFAoGXaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67254794"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67254794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:07:57 -0800
X-CSE-ConnectionGUID: or99sFapSYON540SdhwLIQ==
X-CSE-MsgGUID: gIpp6DvHSherNGcbu1BO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="236943967"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 05:07:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfdg-000000000bW-2JmL;
	Mon, 22 Dec 2025 13:07:52 +0000
Date: Mon, 22 Dec 2025 21:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 drivers/usb/cdns3/drd.c:44:38: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202512222111.1LJ3T3qn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: fe4466c05ba70c2e354965de9548eb4ab5db783b [3418/3418] usb: cdns3: Add support for DRD CDNSP
config: x86_64-randconfig-122-20251217 (https://download.01.org/0day-ci/archive/20251222/202512222111.1LJ3T3qn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222111.1LJ3T3qn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222111.1LJ3T3qn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/drd.c:44:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:44:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:44:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:46:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:46:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:46:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:48:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:48:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:48:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:67:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:67:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:67:50: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:69:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:69:50: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:69:50: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:92:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:92:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:92:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:102:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:102:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:102:30: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:135:24: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:135:24: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:135:24: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:145:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:145:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:145:48: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:161:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:161:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:161:21: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:169:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:169:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:169:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:169:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:169:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:169:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:189:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:189:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:189:21: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:192:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:192:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:192:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:192:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:192:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:192:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:211:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:211:47: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:211:47: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:220:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:220:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:220:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:220:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:220:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:220:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:246:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:246:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:246:21: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:248:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:248:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:248:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:248:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:248:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:248:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:266:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:266:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:266:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:335:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:335:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:335:26: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:354:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:354:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:354:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:377:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_legacy_regs *otg_v0_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:377:27: sparse:     expected struct cdns3_otg_legacy_regs *otg_v0_regs
   drivers/usb/cdns3/drd.c:377:27: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:378:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:378:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:378:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:382:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_common_regs *otg_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:382:32: sparse:     expected struct cdns3_otg_common_regs *otg_regs
   drivers/usb/cdns3/drd.c:382:32: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:385:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:385:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:385:32: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:386:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:386:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:386:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:390:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_regs *otg_v1_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:390:35: sparse:     expected struct cdns3_otg_regs *otg_v1_regs
   drivers/usb/cdns3/drd.c:390:35: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:391:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdnsp_otg_regs *otg_cdnsp_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:391:38: sparse:     expected struct cdnsp_otg_regs *otg_cdnsp_regs
   drivers/usb/cdns3/drd.c:391:38: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:395:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/drd.c:402:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:402:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:402:40: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@

vim +44 drivers/usb/cdns3/drd.c

    22	
    23	/**
    24	 * cdns3_set_mode - change mode of OTG Core
    25	 * @cdns: pointer to context structure
    26	 * @mode: selected mode from cdns_role
    27	 *
    28	 * Returns 0 on success otherwise negative errno
    29	 */
    30	static int cdns3_set_mode(struct cdns3 *cdns, enum usb_dr_mode mode)
    31	{
    32		u32 __iomem *override_reg;
    33		u32 reg;
    34	
    35		switch (mode) {
    36		case USB_DR_MODE_PERIPHERAL:
    37			break;
    38		case USB_DR_MODE_HOST:
    39			break;
    40		case USB_DR_MODE_OTG:
    41			dev_dbg(cdns->dev, "Set controller to OTG mode\n");
    42	
    43			if (cdns->version == CDNSP_CONTROLLER_V2)
  > 44				override_reg = &cdns->otg_cdnsp_regs->override;
    45			else if (cdns->version == CDNS3_CONTROLLER_V1)
    46				override_reg = &cdns->otg_v1_regs->override;
    47			else
    48				override_reg = &cdns->otg_v0_regs->ctrl1;
    49	
    50			reg = readl(override_reg);
    51	
    52			if (cdns->version != CDNS3_CONTROLLER_V0)
    53				reg |= OVERRIDE_IDPULLUP;
    54			else
    55				reg |= OVERRIDE_IDPULLUP_V0;
    56	
    57			writel(reg, override_reg);
    58	
    59			if (cdns->version == CDNS3_CONTROLLER_V1) {
    60				/*
    61				 * Enable work around feature built into the
    62				 * controller to address issue with RX Sensitivity
    63				 * est (EL_17) for USB2 PHY. The issue only occures
    64				 * for 0x0002450D controller version.
    65				 */
    66				if (cdns->phyrst_a_enable) {
    67					reg = readl(&cdns->otg_v1_regs->phyrst_cfg);
    68					reg |= PHYRST_CFG_PHYRST_A_ENABLE;
    69					writel(reg, &cdns->otg_v1_regs->phyrst_cfg);
    70				}
    71			}
    72	
    73			/*
    74			 * Hardware specification says: "ID_VALUE must be valid within
    75			 * 50ms after idpullup is set to '1" so driver must wait
    76			 * 50ms before reading this pin.
    77			 */
    78			usleep_range(50000, 60000);
    79			break;
    80		default:
    81			dev_err(cdns->dev, "Unsupported mode of operation %d\n", mode);
    82			return -EINVAL;
    83		}
    84	
    85		return 0;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
