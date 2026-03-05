Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A52AD16
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772683609; cv=none; b=OVz+5tw/OPANDv5mp0j1mCut3OgRTJ6loeFR0KWoRd0mYMKR/pAc3VWW9sYtDN/2/SVliiiR/tIkSudCAMQHTF/ShIzsrj8HMMCZ5YZIVjbYj34B9NPojvyb+P6SAqz4LQM3NRRXVN1nfij9RfbM1yQtvY3I1Tp8xZjr+AlkC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772683609; c=relaxed/simple;
	bh=26/aiZXHR9be3AGcF2Tr/OPZm/6fP8KQXz9C9VZdu4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XH5RUjHCSgDp7xS8KGkOhPKTBsml7mkXlLwV3G1tNP7z5yarbW9rnRdx/eCkdu+gG/x0NkymsV5OWcXutar/n4DQih40lTSvyiedDmYH3RYu0rv8u6WeaL8Syai3cZZbeJGsHxubWHWOznysNkStdinbFJAOV9TwGBjw6mURq90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QB24xRnf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QB24xRnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772683607; x=1804219607;
  h=date:from:to:cc:subject:message-id;
  bh=26/aiZXHR9be3AGcF2Tr/OPZm/6fP8KQXz9C9VZdu4o=;
  b=QB24xRnfQ9Hiee6nMtExduWpcR/ObZ5y8+elqBZbZsCfBz76aHnDjTIw
   /Vbko2BVB4KQVWx9H0AGi4F24Nudh71mu/XZqXI6Suv8Gf7jScMF75IQP
   Lp2k7IbRiLcbxvSrqa9AQBVLxxSnhfoyEmy/uL27uislOmIWm0Rc3sCxW
   c2U0j6yTFXBRMdVDEy46y3dTbAD53Fpd4AyNKkat+gjzmKmmjR8DApjI7
   wolfYMcNnVrRZIVyJBSYwwTjClkgmgBNmyXDID2IGba9+OgRmYCopTJcN
   tCvu8KQKa06dzyjh545xufYVtibBP1RojY8SdoKWB67nr8ttti4W67NMO
   g==;
X-CSE-ConnectionGUID: t4ZftyRHSSWN2/3vIi1+JQ==
X-CSE-MsgGUID: 2tfDC4ciQ82/1S6wWn9gYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91332010"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91332010"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:06:47 -0800
X-CSE-ConnectionGUID: StKKqYpZTzOWO7A8Ds02ag==
X-CSE-MsgGUID: xP9o5f5gSmawMqD2lgjtiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221454984"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 20:06:45 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzz0-0000000003T-3LZA;
	Thu, 05 Mar 2026 04:06:42 +0000
Date: Thu, 05 Mar 2026 11:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:mailbox/improvements 2/3]
 drivers/mailbox/mailbox-test.c:367:14: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202603051154.wOOM3bne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git mailbox/improvements
head:   c3534a875b3862a64739bc852655406c8e82ee45
commit: 7464f83095f348420d3ee11e075120ed23ac807b [2/3] mailbox: test: really ignore optional memory resources
config: x86_64-randconfig-121-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051154.wOOM3bne-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051154.wOOM3bne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051154.wOOM3bne-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/mailbox-test.c:367:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mmio @@     got void [noderef] __iomem * @@
   drivers/mailbox/mailbox-test.c:367:14: sparse:     expected void *mmio
   drivers/mailbox/mailbox-test.c:367:14: sparse:     got void [noderef] __iomem *
>> drivers/mailbox/mailbox-test.c:370:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/mailbox/mailbox-test.c:370:36: sparse:     expected void *
   drivers/mailbox/mailbox-test.c:370:36: sparse:     got void [noderef] __iomem *
>> drivers/mailbox/mailbox-test.c:386:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *tx_mmio @@     got void * @@
   drivers/mailbox/mailbox-test.c:386:23: sparse:     expected void [noderef] __iomem *tx_mmio
   drivers/mailbox/mailbox-test.c:386:23: sparse:     got void *
>> drivers/mailbox/mailbox-test.c:389:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *rx_mmio @@     got void * @@
   drivers/mailbox/mailbox-test.c:389:23: sparse:     expected void [noderef] __iomem *rx_mmio
   drivers/mailbox/mailbox-test.c:389:23: sparse:     got void *

vim +367 drivers/mailbox/mailbox-test.c

   357	
   358	static void *mbox_test_ioremap(struct platform_device *pdev, unsigned int res_num)
   359	{
   360		struct resource *res;
   361		void *mmio;
   362	
   363		res = platform_get_resource(pdev, IORESOURCE_MEM, res_num);
   364		if (!res)
   365			return NULL;
   366	
 > 367		mmio = devm_ioremap_resource(&pdev->dev, res);
   368		if (PTR_ERR(mmio) == -EBUSY) {
   369			dev_info(&pdev->dev, "trying workaround with plain ioremap\n");
 > 370			return devm_ioremap(&pdev->dev, res->start, resource_size(res));
   371		}
   372	
   373		return IS_ERR(mmio) ? NULL : mmio;
   374	}
   375	
   376	static int mbox_test_probe(struct platform_device *pdev)
   377	{
   378		struct mbox_test_device *tdev;
   379		int ret;
   380	
   381		tdev = devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);
   382		if (!tdev)
   383			return -ENOMEM;
   384	
   385		/* It's okay for MMIO to be NULL */
 > 386		tdev->tx_mmio = mbox_test_ioremap(pdev, 0);
   387	
   388		/* If specified, second reg entry is Rx MMIO */
 > 389		tdev->rx_mmio = mbox_test_ioremap(pdev, 1);
   390		if (!tdev->rx_mmio)
   391			tdev->rx_mmio = tdev->tx_mmio;
   392	
   393		tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
   394		tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
   395	
   396		if (IS_ERR_OR_NULL(tdev->tx_channel) && IS_ERR_OR_NULL(tdev->rx_channel))
   397			return -EPROBE_DEFER;
   398	
   399		/* If Rx is not specified but has Rx MMIO, then Rx = Tx */
   400		if (!tdev->rx_channel && (tdev->rx_mmio != tdev->tx_mmio))
   401			tdev->rx_channel = tdev->tx_channel;
   402	
   403		tdev->dev = &pdev->dev;
   404		platform_set_drvdata(pdev, tdev);
   405	
   406		spin_lock_init(&tdev->lock);
   407		mutex_init(&tdev->mutex);
   408	
   409		if (tdev->rx_channel) {
   410			tdev->rx_buffer = devm_kzalloc(&pdev->dev,
   411						       MBOX_MAX_MSG_LEN, GFP_KERNEL);
   412			if (!tdev->rx_buffer)
   413				return -ENOMEM;
   414		}
   415	
   416		ret = mbox_test_add_debugfs(pdev, tdev);
   417		if (ret)
   418			return ret;
   419	
   420		init_waitqueue_head(&tdev->waitq);
   421		dev_info(&pdev->dev, "Successfully registered\n");
   422	
   423		return 0;
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
