Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28BC1E25E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736533277; cv=none; b=ecrbXcVWHRzUnkl91NHoI1loG987W4mqiwE/YzyZ5RZC+QpKItmTpXOkUolpQYtJSY7tVMdB37PPPj8B1+rlSHDKcQlLo5+ThiMfcOI9tIu3Dc1AQ8FEa0dVHN5sG6mEIhIPL2GYjPq5BnubZjQG/hkYlsLRU7s+VfkpRE5vhQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736533277; c=relaxed/simple;
	bh=1kY0FUsM3UoO5siladM8BDVtBaZCHTWsvV1B/3/PGwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZADYbQc/IKbTbUVHlhK/FPkYPMqkJPyDZu+peOT+NUD3UXHgnw4MUxY/+2bkZfTVfROoOBopeT/uD7ZuVw2K/vSf1IoGTI3eU0ZZ1cAm8/dpNtOaNapYm6JwVnPagrspPfBlaZDaXCbVcYd3Mv028dPp070y9hxsLDYKxvx0Als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh4Fq8Gh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh4Fq8Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736533276; x=1768069276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1kY0FUsM3UoO5siladM8BDVtBaZCHTWsvV1B/3/PGwQ=;
  b=eh4Fq8GhARBgMObFiYat/6Ba3GH6Tj8aTkTNaRqzmI4qGkDcwFD/7dpM
   J0DTdWoCwg5oxdxaRig7Z/8+USVdYUHzS9PpDENFsNCM/2wtKVyfwiE0q
   htrBPJ5Elyc9fkbCMCg51XmT604MnjtNFmDacdF/H+XT/lez3ZCYZQHAs
   y3J+lk53G7T0WqzEMLUXa22ZZCjqPpWN0ZhEzZS46vM9nklIPioYyhhbq
   OBT3OgnKX1JjLGKqvf6DTWNbtD/c42O0TOertq8mSQAUxdSoKySbFNTpl
   6hMg+PEURPg0AEV6ledtfpM38Cmkx8L+hsBUuQhXDOESRC0cIf4D2C292
   g==;
X-CSE-ConnectionGUID: kTT6ffuzRL2JI3xwRguA9g==
X-CSE-MsgGUID: jxMRBZGUTEaFwMacQjqnpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36053394"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36053394"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 10:21:15 -0800
X-CSE-ConnectionGUID: 00rpC4zdRbqgcO/trMtJiQ==
X-CSE-MsgGUID: pGGcNtzJQ56ZHvGkoKG2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104318574"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jan 2025 10:21:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWJd8-000Jaj-07;
	Fri, 10 Jan 2025 18:21:10 +0000
Date: Sat, 11 Jan 2025 02:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 111/504]
 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:286:47: warning: 'sprintf' may
 write a terminating nul past the end of the destination
Message-ID: <202501110213.1Jk9pYQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 79569a88d904a3efdb6a5f054e40344b688ed82e [111/504] staging: net: xilinx: add Xilinx TSN driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501110213.1Jk9pYQs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110213.1Jk9pYQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110213.1Jk9pYQs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'axienet_tadma_open':
>> drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:286:47: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     286 |                 sprintf(irq_name, "%s_tadma_tx", ndev->name);
         |                                               ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:286:17: note: 'sprintf' output between 10 and 25 bytes into a destination of size 24
     286 |                 sprintf(irq_name, "%s_tadma_tx", ndev->name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +286 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c

   276	
   277	int axienet_tadma_open(struct net_device *ndev)
   278	{
   279		struct axienet_local *lp = netdev_priv(ndev);
   280		u32 cr;
   281		u8 i = 0;
   282		int ret;
   283		static char irq_name[24];
   284	
   285		if (lp->tadma_irq) {
 > 286			sprintf(irq_name, "%s_tadma_tx", ndev->name);
   287			ret = request_irq(lp->tadma_irq, tadma_irq, IRQF_SHARED,
   288					  irq_name, ndev);
   289			if (ret)
   290				return ret;
   291		}
   292		pr_debug("%s TADMA irq %d\n", __func__, lp->tadma_irq);
   293	
   294		/* enable all interrupts */
   295		tadma_iow(lp, XTADMA_INT_EN_OFFSET, XTADMA_FFI_INT_EN |
   296			  XTADMA_IE_INT_EN);
   297	
   298		tadma_sfm_init(ndev);
   299		tadma_sfm_hash_init(ndev);
   300		cr = XTADMA_CFG_DONE;
   301		tadma_iow(lp, XTADMA_CR_OFFSET, cr);
   302	
   303		lp->tx_bd = kmalloc_array(lp->num_streams, sizeof(struct axitadma_bd *),
   304					  GFP_KERNEL);
   305		if (!lp->tx_bd)
   306			ret = -ENOMEM;
   307	
   308		for (i = 0; i < lp->num_streams ; i++) {
   309			lp->tx_bd_head[i] = 0;
   310			lp->tx_bd_tail[i] = 0;
   311			lp->tx_bd_rd[i] = 0;
   312			lp->tx_bd[i] = kmalloc_array(lp->num_tadma_buffers,
   313						     sizeof(*lp->tx_bd[i]), GFP_KERNEL);
   314			if (!lp->tx_bd[i])
   315				return -ENOMEM;
   316		}
   317	
   318		return ret;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
