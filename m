Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78733D4E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361019; cv=none; b=a1TJly/1y3E4klZMrzh9k9ynEZ9miX/HbgwW2XP2rlhsDNSB/AvNci+cJK0YFiTKV8QG8Euur6tm9SGd563hv/WDVeQl9FQSUtG7puOj20RTjcUUy3dDJiaZWB52IED8ySOihEvyP7ETyJ4jkt7CumQISWBfDONOY3PDYBjPT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361019; c=relaxed/simple;
	bh=gT8GXfUF9E6AiMvOrGnO1dIYUXUcF2eSy/IX3ToDCX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NxKr24cYKtbGMQz1KxOoMam4pCDUsJVLxHVfGldwMgGvA8QD2rF1bIQq91rrFKX4UbXEZbL6qJs4y1gNEYcpatzUERwkbBfnngmG6HnL17Fwwr6UMkefXQoRSiGITkTn7tWyqhLki2DPdciALrjIcJy4PKYyY6YH/z0rXHr9Vks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAPzHzIY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAPzHzIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784361017; x=1815897017;
  h=date:from:to:cc:subject:message-id;
  bh=gT8GXfUF9E6AiMvOrGnO1dIYUXUcF2eSy/IX3ToDCX8=;
  b=NAPzHzIYijpJfeTz3PGT2SJBQJMCAntJZnxSa31VN9/EqLCObegeAqpo
   BljYO0twitCNgypLIgn9udWi+SQ0oQDHYznsvVoLyVunQ6ayY+Md+J6YH
   QK3oNDqHn5Z2aREf2ZTjiST/cvoqsRELEJqJmZYivJddEZAPp+a9BI99T
   rmul9ZfYZmYauSej9grx/GjPjnrWPjZMDn8zSEXpUgQp83tX8J3/AcM4x
   8XJ014gD71uoPwnYa83vc6CDPDdxLLTDBr21xu6lnxh/dYtlRfFj27Yb3
   3KboiyhUiRihL6RxrNRWoM8WCqbV5Phb/4hS+c9aIHgiumk8zqs2RERvg
   A==;
X-CSE-ConnectionGUID: QJ/zf4sKTCGGcSFxVUjA+Q==
X-CSE-MsgGUID: YosgpetyQzCrGzYC9BW0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84003495"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84003495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:50:16 -0700
X-CSE-ConnectionGUID: yW1qMh1tSmCpd/kY9myk/g==
X-CSE-MsgGUID: wb9RtT76T2CqefLUQ8/WMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255210882"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2026 00:50:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzoJ-00000000TYm-30du;
	Sat, 18 Jul 2026 07:50:11 +0000
Date: Sat, 18 Jul 2026 15:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: cast
 from restricted __le32
Message-ID: <202607181505.CVpdSKHV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: e4d7362dc9cd50b0fc74c8649aa241376c48936c usb: cdns3: Add USBSSP platform driver support
date:   3 months ago
config: arc-randconfig-r123-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181505.CVpdSKHV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181505.CVpdSKHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e4d7362dc9cd ("usb: cdns3: Add USBSSP platform driver support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181505.CVpdSKHV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse:     expected unsigned int [usertype] val
   drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse:     got restricted __le32 [usertype]
>> drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: cast from restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: cast from restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: cast from restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: cast from restricted __le32

vim +168 drivers/usb/cdns3/cdnsp-gadget.c

3d82904559f4f5 Pawel Laszczak 2020-12-07  150  
241e2ce88e5a49 Pawel Laszczak 2025-04-18  151  static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
241e2ce88e5a49 Pawel Laszczak 2025-04-18  152  {
241e2ce88e5a49 Pawel Laszczak 2025-04-18  153  	struct cdns *cdns = dev_get_drvdata(pdev->dev);
241e2ce88e5a49 Pawel Laszczak 2025-04-18  154  	__le32 __iomem *reg;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  155  	void __iomem *base;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  156  	u32 offset = 0;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  157  	u32 val;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  158  
241e2ce88e5a49 Pawel Laszczak 2025-04-18  159  	if (!cdns->override_apb_timeout)
241e2ce88e5a49 Pawel Laszczak 2025-04-18  160  		return;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  161  
241e2ce88e5a49 Pawel Laszczak 2025-04-18  162  	base = &pdev->cap_regs->hc_capbase;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  163  	offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
241e2ce88e5a49 Pawel Laszczak 2025-04-18  164  	reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
241e2ce88e5a49 Pawel Laszczak 2025-04-18  165  
241e2ce88e5a49 Pawel Laszczak 2025-04-18 @166  	val  = le32_to_cpu(readl(reg));
241e2ce88e5a49 Pawel Laszczak 2025-04-18  167  	val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
241e2ce88e5a49 Pawel Laszczak 2025-04-18 @168  	writel(cpu_to_le32(val), reg);
241e2ce88e5a49 Pawel Laszczak 2025-04-18  169  }
241e2ce88e5a49 Pawel Laszczak 2025-04-18  170  

:::::: The code at line 168 was first introduced by commit
:::::: 241e2ce88e5a494be7a5d44c0697592f1632fbee usb: cdnsp: Fix issue with resuming from L1

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
