Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE078289
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003582; cv=none; b=qsZeWmR52O2x/INNSHXJFwN2U7EKaPiEn1Td4wIqfpBtcXPhjasnzfbe03JYl7DpFZ6c8TZdvftNNBSCfwMij+cRSPLKJnJiQddoVHbOXNswdeLeUlAXfs3+moPAUX/b3lR1qTMNonOwK6LMyv3XwIMgwAomE+yq7MAIt2pJR5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003582; c=relaxed/simple;
	bh=TyNxwJ65693HvCTbgkTDtAsFDOYEXIrcX2/PGsq3qwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ipck+G9RlSSJrjlqhS75mjft7YExFqZ3AhH3DbbS+mg4qyGeYZMzJQN+VEgg8r4uclTnh2SD0GV1l2W++A3Ub7bqXeK9AZtc84gHEh+NYougfTrIgV3UhvZ1j1Wc4sKXdOFdq0eothtfl6amuhLAUu4B+w9TTzpLxcB51uMaPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/O2cJQ4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/O2cJQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733003580; x=1764539580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TyNxwJ65693HvCTbgkTDtAsFDOYEXIrcX2/PGsq3qwg=;
  b=V/O2cJQ4pMQ4s6mexE7/2pxZyiH3SPbJoPEm5wrgKx1gi2c5w4vdBKeJ
   riRN46aFv7HqFx2fj9dh+Qyt1FWy+Qf3zir5NKUmdKmWSQcyz2eoy+6Q6
   P7uwBenoL6LrxgQtOytukx6mODsJ8kaq6cHBBfg+QuBXeVFcHU7UCtUGo
   rfQrHOpe01XBnC2UMSi65JHndclc1OmJEL8tv+H0bRdT7t5eLzCA/XYIt
   HGCzbSUTFbla9BSw5wFv/YtELam5FoHb5hhjTKt8Rd+Bjl1nGEVDdWD5O
   KRnbcIYF2nKLn3LrVH9NkWy5weZ7Nvkm6YEoWqVtifdMoDPR6fCXjrujT
   w==;
X-CSE-ConnectionGUID: FnlxwoTZRhudOVP33fQTzQ==
X-CSE-MsgGUID: JVk5h03HQLCzSQPKNylIrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43809823"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="43809823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 13:52:59 -0800
X-CSE-ConnectionGUID: JFZBw9MsT3amUbzMQ41rKA==
X-CSE-MsgGUID: CgOmmDIKQH6nTvat4p3f/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="130231424"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2024 13:52:58 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHVOO-0000zv-1S;
	Sat, 30 Nov 2024 21:52:47 +0000
Date: Sun, 1 Dec 2024 05:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2508/2508] drivers/usb/cdns3/drd.c:44:38:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202412010531.vH1SzpcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: fe4466c05ba70c2e354965de9548eb4ab5db783b [2508/2508] usb: cdns3: Add support for DRD CDNSP
config: x86_64-randconfig-123-20241130 (https://download.01.org/0day-ci/archive/20241201/202412010531.vH1SzpcJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010531.vH1SzpcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010531.vH1SzpcJ-lkp@intel.com/

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
>> drivers/usb/cdns3/drd.c:391:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdnsp_otg_regs *otg_cdnsp_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:391:38: sparse:     expected struct cdnsp_otg_regs *otg_cdnsp_regs
   drivers/usb/cdns3/drd.c:391:38: sparse:     got void [noderef] __iomem *[assigned] regs
>> drivers/usb/cdns3/drd.c:395:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/drd.c:402:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:402:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:402:40: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:411:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:411:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:411:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:440:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:440:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:440:28: sparse:     got restricted __le32 *

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
