Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11387256C88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748503788; cv=none; b=oYiNRC+ftvE5Lpi/MKlqAW4j9njmZq+dr/sMJqCvav+0aSFAj8I0ktzK4Ylw5panqLb+cvkItuwHmkaAQbJL4pA+Nb47nEdwHRgRAh4bcHItCG/jeW5n1avz1r0x2LkZRIt5v2HzqZhTOrDmKpOIUte3QrazWx9rOoBTa3VeQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748503788; c=relaxed/simple;
	bh=qG3ppQfUvQjIKs+p/o5tKDuWVqs+g3HuGh25yHHMcvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUhROQCrRljrLc0Y9hAeKNkPqplzLeOe3bewWBOVWtDn28dxATlfy3Y1kINKS/RfBvZgtH7nKjqXnzrJRonwi21wc4sCwnHQbwzHGi77gKVCW8qYy3mAuCpz3/vhco6eQx2/5D7g6Tq68x82Mc3DR3YnzIkxIWTOQL4E8FUTypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwyV7/7o; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwyV7/7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748503786; x=1780039786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qG3ppQfUvQjIKs+p/o5tKDuWVqs+g3HuGh25yHHMcvs=;
  b=SwyV7/7oK/8+znyzqwEG4TlSPjanHCij7HIFJaaoLZceer60tvPX1f+m
   tDs0cJgfmJMFRFUuiP85GOusj/jhRkoKvvnXF9zHx14DPjV+kJV6OjZb5
   aBGJlAiwPybPvwkhokLtoDGhwEO6TwuhcMtWzX8H5EtBNLbeFnZAR0ZzJ
   QjLmv6Z1Slp+e4GlXGzfUzEaxs9JYpLQ4q+FXa033mqKEQ1nevmo61qeo
   29AUwB8Tda4jLztGx+giHvskQJ7wiH6iBpX48fOROb7oQk2NrDp42rDKz
   ZSRWeITvcfNfr+9csuM3bCIJ/Mv5sEgeZCYsJ+GdF6EFQMir7YDT0MIBP
   g==;
X-CSE-ConnectionGUID: gDkmBPukQ6+qdOQPMfQYKg==
X-CSE-MsgGUID: V7bQls+uRrujRmMWEcgvjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60813744"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="60813744"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 00:29:44 -0700
X-CSE-ConnectionGUID: 5kAVq0NfRUy5++YizEVkMA==
X-CSE-MsgGUID: huUhLzFDRHS5PDIADZE0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143504664"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2025 00:29:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKXhs-000WQs-0D;
	Thu, 29 May 2025 07:29:40 +0000
Date: Thu, 29 May 2025 15:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331]
 drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202505291520.bhlKqYqw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [2331/2331] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-randconfig-121-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291520.bhlKqYqw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291520.bhlKqYqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291520.bhlKqYqw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     expected unsigned int val
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse:     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse:     got void *cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base @@     got void *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse:     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse:     got void *intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got void *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse:     got void *db_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32

vim +46 drivers/net/ethernet/huawei/hinic/hinic_hwif.c

    36	
    37	/* For UEFI driver, this function can only read BAR0 */
    38	u32 hinic_hwif_read_reg(struct hinic_hwif *hwif, u32 reg)
    39	{
  > 40		return be32_to_cpu(readl(hwif->cfg_regs_base + reg));
    41	}
    42	
    43	/* For UEFI driver, this function can only write BAR0 */
    44	void hinic_hwif_write_reg(struct hinic_hwif *hwif, u32 reg, u32 val)
    45	{
  > 46		writel(cpu_to_be32(val), hwif->cfg_regs_base + reg);
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
