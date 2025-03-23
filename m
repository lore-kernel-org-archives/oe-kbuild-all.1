Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149CE2E337D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742696438; cv=none; b=WAsH/dl7rEvAUx843qZxNrP79zEdj69WWOxKUsiFdEp+e2Vb8f0PNnSfy9luRur2nyyU1I+uN23KDQmsLBEMCPKUpodBtj/nc98ytqe6wr8+rz9NK5rp7IqbR+sg2puTOTsizMmt/njSrHVc/ce3sIWSlNYF4+KyvMdXIKhzX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742696438; c=relaxed/simple;
	bh=lLGeKt+B07zKzj9HrgSQ1u0d9IDIgucG5oNd4k7oRrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CaaxiKxFj/dW1YLqbP6V9yfFzQsOgjK8/KDqVfRXzR5+wyPnEURguN7GGQ5VqDW82rLO/H6bU+BRmh3rPfYh+madBkO1dyVmc/qbymEZoKBVNE4CZqU+uIthoAPY5nXWBnVRu0TdgVvXQOdkuHPhrzkTSq+8C8J6cE02O59AMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7jBo/c4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7jBo/c4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742696436; x=1774232436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lLGeKt+B07zKzj9HrgSQ1u0d9IDIgucG5oNd4k7oRrw=;
  b=L7jBo/c4xQ0ntHT2gCfKnI+6sQyXzC9xlo22NawXXig1xJnWdHA3faSN
   M0KUlDRknPuEu+J5KVzuyACzuaPOQ6GEN5EFtQK9M0QSbECqRIDALj5zS
   1jBPcrRHvIZcYwS6tEWPl0HoWoxiPFzBDx85sWi2ChTMeoX3jDMsjHwA9
   VXyMwW6qDSRIy+/LRSj4yLlvnF2cpQc2KKoLztFJFKErXBXDDrQjT41qu
   b1BgPuAbOt10hMjUcv7DlaP9XYsg9wnmtNFBZs48duYU7MptWmxFSi12w
   1m5Xo8yzw+JHH01mpOVfdW7Sueq108hlQRFuDq2UpbdKgsB5TNnE97a/Q
   w==;
X-CSE-ConnectionGUID: Oh+lCrIJRxyldrKiA8Yllw==
X-CSE-MsgGUID: 6z+a7FLdTF2JpZTWRSPwZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="61447169"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="61447169"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 19:20:36 -0700
X-CSE-ConnectionGUID: mlolEntsS7mQwIZ1ScBSpQ==
X-CSE-MsgGUID: YVNW5p4ATp6sYHkBY8/X8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="128547062"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2025 19:20:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twAwx-0002Wz-2z;
	Sun, 23 Mar 2025 02:20:31 +0000
Date: Sun, 23 Mar 2025 10:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051]
 drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202503231008.CBNqLNFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [2051/2051] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-randconfig-r111-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231008.CBNqLNFq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250323/202503231008.CBNqLNFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231008.CBNqLNFq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     expected unsigned int [usertype] value
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
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:597:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dwqe_mapping @@     got void *dwqe_mapping @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:597:28: sparse:     expected void [noderef] __iomem *dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:597:28: sparse:     got void *dwqe_mapping
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
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
