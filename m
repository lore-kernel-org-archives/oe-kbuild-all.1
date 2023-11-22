Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193BD56B7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIqyYxRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667989; x=1732203989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHx72hZoBXNA1R21eSdysxe/i63n2gVkyEoCylSstB0=;
  b=gIqyYxRq519ksDsa5xGOsfRoqWj3iTLht+FBkHl71dinOzcwwTPys0Nw
   mrmcgp5nEQ5t0l4koeOLDeCJRJ2f1Q5Xrad/Z8dX8fCeVGX5gHZ4h0xUK
   zgMbVLNPkS5MFARshxQNBw7p3JKSFQmKRLuZ2hAnzj+TtxruPX8h1Epho
   qljdWwp5anKZ2t9tfgR5xMB8ybc/VnKU6Q1l4zjYehA8xnFXB/fLPPsaE
   3WLfZIAzIeWqSSPfjNkQXddECdF6LqSg0VzaihL0upjimteGxI/zxzV82
   HW+J0I3Zz66OvawIPQTeJJsDWwSfYO7lyCqxzDvUPpHzsG5ApPHRx5acA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5279490"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5279490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837464098"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="837464098"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2023 07:46:26 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQm-0000da-0r;
	Wed, 22 Nov 2023 15:46:24 +0000
Date: Wed, 22 Nov 2023 23:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/140-pci 10/15]
 drivers/pci/controller/pcie-apple.c:150:23: sparse: sparse: symbol
 't8103_hw' was not declared. Should it be static?
Message-ID: <202311222023.wSCGWpub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   58cab72f915e70990f9e2c9836b7cb6e79a9db35
commit: bc47733313473d25b60a7f875cf6f806d62a641d [10/15] PCIE: apple: Add T602x PCIe support
config: mips-randconfig-r131-20231122 (https://download.01.org/0day-ci/archive/20231122/202311222023.wSCGWpub-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311222023.wSCGWpub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222023.wSCGWpub-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-apple.c:150:23: sparse: sparse: symbol 't8103_hw' was not declared. Should it be static?
>> drivers/pci/controller/pcie-apple.c:171:23: sparse: sparse: symbol 't602x_hw' was not declared. Should it be static?

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
