Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DAD1ADFF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731951849; cv=none; b=ad6sPDQ1dUTzFjUoQM8trgVJoO8k2n0PTKEQN9Qv8EKndh0NHzvXt0eB3dKf1ZoANDug/thtzd4OzHWlmr18PtrvUeEOxE92XRs4CcgQZb7MgHkt4J3qHi5vrOkHJYXTEosKTgyA33m3DOfI3UKdAANMrHS2lrichTwqom37Pm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731951849; c=relaxed/simple;
	bh=J/XrGVCFrGNOqRgT9ANTIFoRJi5hKwAIaoQmpPLAIBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSMcYGIc0Xfurxm/f5emEwq6B1FWSH0O6crqxkfxsCuvDs6D4CI21h1uBaMsKTseVx4+HuSWCQJ4tZB4Poy8qXp/0wm5r+Kwc+YbjlJAiX+wBSc58LlncS3p8P3bD5bcmeZuMivqPnfX4pDOxNZxzQMxHx+BIx90P/WsqlrSUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7gNdQyU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7gNdQyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731951848; x=1763487848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/XrGVCFrGNOqRgT9ANTIFoRJi5hKwAIaoQmpPLAIBk=;
  b=F7gNdQyUXXkn7SjEmGnV8vXxqbHAvt9S232LhOEB2puh6iam93PpZYZz
   IdkfvU9ckZrwpIS7UrUW1f4F5NMjrLUXo8Stp6Xgj5gapV/9OEAq+X2cq
   UyJ+vqgkhYrd57Xytg1My/J1ArTA76D88AkIXZKPZNpoAd+JT3ilD025X
   Qa93WCqZvZ9neT1xudTgbkx+NQuQBQUTRxjmh3HFM6yte6oSUi54p0Hs2
   IpZdvn9RPsB3efFDj+UNFPTUgek8SHkm+9MkECYOM+qqdEbRKHlekqm89
   p9owHo7+Ie4mLvezL1gDp8xese2NjI9VCMLeKOfUZlHXT+OyRedE6CMzs
   w==;
X-CSE-ConnectionGUID: u4NnjsgVTwyy5WtlMlL94w==
X-CSE-MsgGUID: nZ5HU+27Sr6CtQTlpwu5Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54418016"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="54418016"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 09:44:08 -0800
X-CSE-ConnectionGUID: nxkyGfveSRW4c6S3tR5KbA==
X-CSE-MsgGUID: QSBVT47+TO+MCktgvfB7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94102677"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2024 09:44:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD5nA-0002a1-0o;
	Mon, 18 Nov 2024 17:44:04 +0000
Date: Tue, 19 Nov 2024 01:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/140-pci 9/18]
 drivers/pci/controller/pcie-apple.c:150:23: sparse: sparse: symbol
 't8103_hw' was not declared. Should it be static?
Message-ID: <202411190126.UgIAVoPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   73bb6449a37320b5aceab5c4617e39c1530da64e
commit: 0b35e060bbac4d17e2f6cf63ed39675f350de4fb [9/18] PCIE: apple: Add T602x PCIe support
config: arm-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190126.UgIAVoPR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190126.UgIAVoPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190126.UgIAVoPR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-apple.c:150:23: sparse: sparse: symbol 't8103_hw' was not declared. Should it be static?
>> drivers/pci/controller/pcie-apple.c:171:23: sparse: sparse: symbol 't602x_hw' was not declared. Should it be static?
   drivers/pci/controller/pcie-apple.c: note: in included file (through arch/arm/include/asm/traps.h, arch/arm/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/t8103_hw +150 drivers/pci/controller/pcie-apple.c

   149	
 > 150	const struct reg_info t8103_hw = {
   151		.phy_lane_ctl = PHY_LANE_CTL,
   152		.port_msiaddr = PORT_MSIADDR,
   153		.port_msiaddr_hi = 0,
   154		.port_refclk = PORT_REFCLK,
   155		.port_perst = PORT_PERST,
   156		.port_rid2sid = PORT_RID2SID,
   157		.port_msimap = 0,
   158		.max_rid2sid = 64,
   159		.max_msimap = 0,
   160	};
   161	
   162	#define PORT_T602X_MSIADDR		0x016c
   163	#define PORT_T602X_MSIADDR_HI		0x0170
   164	#define PORT_T602X_PERST		0x082c
   165	#define PORT_T602X_RID2SID		0x3000
   166	#define PORT_T602X_MSIMAP		0x3800
   167	
   168	#define PORT_MSIMAP_ENABLE		BIT(31)
   169	#define PORT_MSIMAP_TARGET		GENMASK(7, 0)
   170	
 > 171	const struct reg_info t602x_hw = {
   172		.phy_lane_ctl = 0,
   173		.port_msiaddr = PORT_T602X_MSIADDR,
   174		.port_msiaddr_hi = PORT_T602X_MSIADDR_HI,
   175		.port_refclk = 0,
   176		.port_perst = PORT_T602X_PERST,
   177		.port_rid2sid = PORT_T602X_RID2SID,
   178		.port_msimap = PORT_T602X_MSIMAP,
   179		.max_rid2sid = 512, /* 16 on t602x, guess for autodetect on future HW */
   180		.max_msimap = 512, /* 96 on t602x, guess for autodetect on future HW */
   181	};
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
