Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D81D5178
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745447878; cv=none; b=ANWCoZoYuxIABXrUkmTGMZ9q2rEMyQm5lb9XocFxgypc8jaOXrJi4V1v1KRuam3sr+g4Hcx2MX1S+JwSIXvQUcg8mLPVS94EIIPlJ+f6+FTlpNYvnkfACyebsQcHqOHbhhH3w5ElzC7oF4QJ5gCPCjsLmARe0SUTHmOliKKRqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745447878; c=relaxed/simple;
	bh=PXUGDJ2IMSJI55j/32VMNUPIXp4aNup2s9DUYoapf9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uj84xMsKhWFlmId2Zh/QoIp26ZCaWLsVxBiz2h/QZiW4jU6t3C1JafO6WSrru/vm1ZgOEFSFlF50FrmSDj0CT4wyvIHPvWHKaieyoMLp8g1u0apxari/fuHTvTWoYW3Huo8ifti2Jwzp7WypoYX6a2rEATR8ONj4URtk4yii4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KphMQWEL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KphMQWEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745447876; x=1776983876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXUGDJ2IMSJI55j/32VMNUPIXp4aNup2s9DUYoapf9o=;
  b=KphMQWELTvn2fgwYMSaE5Cbc9Xx2K/DS0BBvd6xP2hgDwySoR2Jdpmll
   cETFZCu0Pqt0VCm5n668XaJZ+/KhHJjHg8RGaYDXrICnsvuyc6jyohSSp
   8V6lSsvcMPPTS1gU57Tu4212zuu3nLz794EUNOZqXBHFBQxrczDSW3ZN3
   m0gBXnBFNrQgmqHg1IcR5c4Lr9IB2Zk0FGJRB32M51k3m1pzcUIsVveN/
   tDs5Sd6+oCJ2MGmNkbYW7aJ2x1FWoar7veA37nBVgP8NytndJN0xIRuVE
   jnO64KEPY5w521VPZ7Iy5f2GX4dIzP/H3jX3Lujyo4poygdcKXBfxsANc
   Q==;
X-CSE-ConnectionGUID: 0tFemKyFS6utUctjqNzyww==
X-CSE-MsgGUID: gOO3sZYdSoKtyt1pg3+KDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46971349"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46971349"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 15:37:55 -0700
X-CSE-ConnectionGUID: PZGP7B+wQmOnRtTBf3XDcA==
X-CSE-MsgGUID: WQoRd02ETs2ArAUYzj4NCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136518419"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 15:37:54 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7ij2-0003fl-0n;
	Wed, 23 Apr 2025 22:37:52 +0000
Date: Thu, 24 Apr 2025 06:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2163/2163] drivers/irqchip/irq-gic-v3.c:1517:6:
 warning: no previous prototype for 'is_gicv4p1'
Message-ID: <202504240638.PM73jDId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb46ff9245f25c71ce2d456156bb2fc39c400aad
commit: 5634a3dfafb71ede4922b523f77389ef2c006b61 [2163/2163] kvm: hisi_virt: Probe and configure IPIV capacity on HIP12
config: arm64-randconfig-004-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240638.PM73jDId-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240638.PM73jDId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240638.PM73jDId-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1517:6: warning: no previous prototype for 'is_gicv4p1' [-Wmissing-prototypes]
    bool is_gicv4p1(void)
         ^~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1526:6: warning: no previous prototype for 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
    void gic_dist_enable_ipiv(void)
         ^~~~~~~~~~~~~~~~~~~~


vim +/is_gicv4p1 +1517 drivers/irqchip/irq-gic-v3.c

  1516	
> 1517	bool is_gicv4p1(void)
  1518	{
  1519		if (!gic_data.rdists.has_rvpeid)
  1520			return false;
  1521	
  1522		return true;
  1523	}
  1524	EXPORT_SYMBOL(is_gicv4p1);
  1525	
> 1526	void gic_dist_enable_ipiv(void)
  1527	{
  1528		u32 val;
  1529	
  1530		val = readl_relaxed(gic_data.dist_base + GICD_MISC_CTRL);
  1531		val |= GICD_MISC_CTRL_CFG_IPIV_EN;
  1532		writel_relaxed(val, gic_data.dist_base + GICD_MISC_CTRL);
  1533		static_branch_enable(&ipiv_enable);
  1534	
  1535		val = (0 << GICD_IPIV_CTRL_AFF_DIRECT_VPEID_SHIFT) |
  1536			(0 << GICD_IPIV_CTRL_AFF1_LEFT_SHIFT_SHIFT) |
  1537			(4 << GICD_IPIV_CTRL_AFF2_LEFT_SHIFT_SHIFT) |
  1538			(7 << GICD_IPIV_CTRL_VM_TABLE_INNERCACHE_SHIFT) |
  1539			(2 << GICD_IPIV_CTRL_VM_TABLE_SHAREABILITY_SHIFT);
  1540		writel_relaxed(val, gic_data.dist_base + GICD_IPIV_CTRL);
  1541	
  1542		/* Set target ITS address of IPIV feature */
  1543		writel_relaxed(0x4880, gic_data.dist_base + GICD_IPIV_ITS_TA_BASE);
  1544	}
  1545	EXPORT_SYMBOL(gic_dist_enable_ipiv);
  1546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
