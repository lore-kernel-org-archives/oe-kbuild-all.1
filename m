Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA1139D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 02:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482231; cv=none; b=Sd253VaSz7ypHlbV2vyFSu5k88DoC3TSHeovbmHXklrDNa8yyGKaAhn6cAwSJ73goSRTh+1NLpssK27oPvrVL1x3BFD3YA+Mq862r4/LTs3rzPzErVWAoOH0OLrq6Ib2bQpKNTxcuvlcbSwzp90cIQM9t1848IL5LE3z3hcnvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482231; c=relaxed/simple;
	bh=i2aC2ZGhc+hAMqL2Oif7mkwn4n5+2EPTsSOqhEEHU7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rrru7imvHWLx/JwWCOj+wzR576FGN6Y5uF4aWwGXrDmL/Rdk6G1IpOGQAsjNxiyx9VosxUDHjMbzcYcCfta2L223Qeu/HESnD4U14gHK8v11ub3DKMLOQVEn37qXeawsrBFj5VabIepyU78LFpwDJRS7t8MrwkWwwaUHuf/woOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWhYmxhM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWhYmxhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769482230; x=1801018230;
  h=date:from:to:cc:subject:message-id;
  bh=i2aC2ZGhc+hAMqL2Oif7mkwn4n5+2EPTsSOqhEEHU7w=;
  b=ZWhYmxhM4LAFI95jAhWlwtyRvn5EGf6kgMvb4oFvRuaWlqPYo9bZBd4z
   z/XppOwyYk45AR8v6yQja9ksCjohmEWc6s29xcWZ2B+eYcVFwX7LVUSPW
   r4AOmH99oLQ1iLTDqIpNzyTH0+SiiFcIsHPTUWX7JSYkqlTgjrmapgTto
   AkmGuvMvKINwk0BtP3nPjQh6NGNahIRTCBMFDWTV5mMlAK2S+qB9J0tWM
   qP9nDM4i2l3T3TD9zqcRpQb6mJP/YdcNN3um2WfVn8QIozlnWzwSCLwl9
   IDmTrTAS0OCdXr911wSFvKV7na/BSkP9Djy5YmaIVhVLdIP3t27tf8/ye
   Q==;
X-CSE-ConnectionGUID: 0p7urfHRQoe16Gpg+S8Rxw==
X-CSE-MsgGUID: cnnE2MM9QmGSZApLFNgwxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82097307"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82097307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 18:50:29 -0800
X-CSE-ConnectionGUID: wMBEHWXmSJGc5/NyREK57w==
X-CSE-MsgGUID: Wf2mTtuiTpKHa4vMJjQcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207658041"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jan 2026 18:50:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkZ9s-00000000XvK-0wb9;
	Tue, 27 Jan 2026 02:50:24 +0000
Date: Tue, 27 Jan 2026 10:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/net/ethernet/marvell/mvneta_bm.c:381:30: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202601271046.oaxZLj4q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   06ab0cafbab0b7f660ddbcbcbf3f7f9e3610260c
commit: 06ab0cafbab0b7f660ddbcbcbf3f7f9e3610260c [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: arm-randconfig-r133-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271046.oaxZLj4q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271046.oaxZLj4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271046.oaxZLj4q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/mvneta_bm.c:381:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *bppi_virt_addr @@     got void * @@
   drivers/net/ethernet/marvell/mvneta_bm.c:381:30: sparse:     expected void [noderef] __iomem *bppi_virt_addr
   drivers/net/ethernet/marvell/mvneta_bm.c:381:30: sparse:     got void *

vim +381 drivers/net/ethernet/marvell/mvneta_bm.c

dc35a10f68d378 Marcin Wojtas 2016-03-14  373  
dc35a10f68d378 Marcin Wojtas 2016-03-14  374  static int mvneta_bm_get_sram(struct device_node *dn,
dc35a10f68d378 Marcin Wojtas 2016-03-14  375  			      struct mvneta_bm *priv)
dc35a10f68d378 Marcin Wojtas 2016-03-14  376  {
dc35a10f68d378 Marcin Wojtas 2016-03-14  377  	priv->bppi_pool = of_gen_pool_get(dn, "internal-mem", 0);
dc35a10f68d378 Marcin Wojtas 2016-03-14  378  	if (!priv->bppi_pool)
dc35a10f68d378 Marcin Wojtas 2016-03-14  379  		return -ENOMEM;
dc35a10f68d378 Marcin Wojtas 2016-03-14  380  
dc35a10f68d378 Marcin Wojtas 2016-03-14 @381  	priv->bppi_virt_addr = gen_pool_dma_alloc(priv->bppi_pool,
dc35a10f68d378 Marcin Wojtas 2016-03-14  382  						  MVNETA_BM_BPPI_SIZE,
dc35a10f68d378 Marcin Wojtas 2016-03-14  383  						  &priv->bppi_phys_addr);
dc35a10f68d378 Marcin Wojtas 2016-03-14  384  	if (!priv->bppi_virt_addr)
dc35a10f68d378 Marcin Wojtas 2016-03-14  385  		return -ENOMEM;
dc35a10f68d378 Marcin Wojtas 2016-03-14  386  
dc35a10f68d378 Marcin Wojtas 2016-03-14  387  	return 0;
dc35a10f68d378 Marcin Wojtas 2016-03-14  388  }
dc35a10f68d378 Marcin Wojtas 2016-03-14  389  

:::::: The code at line 381 was first introduced by commit
:::::: dc35a10f68d3781c2345d60b22103785985ca849 net: mvneta: bm: add support for hardware buffer management

:::::: TO: Marcin Wojtas <mw@semihalf.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
