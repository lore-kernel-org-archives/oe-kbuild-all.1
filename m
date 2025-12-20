Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8019B5A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766251654; cv=none; b=R2DhMi+1sg0+L6ASs4M0IKjjKylLDpef6bO6+3MFk+2p29lIYuec1Bg01uotSD6TTC9Zy8MF1Pz4CwMIsAKuY0U4DKUASAv1gtfwx6+x0bWq1AQfmsO9ZZApau+uNgaJ9uwfBYuwxTiRR9iJHgEDj1Q9IK/rEEiPec9/dTAg080=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766251654; c=relaxed/simple;
	bh=RkE0TLGs5j9BErOysmR3zVw0jP9Fz8/LVnjuuX+P6nI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VsUinf1ki1M2df/2Pv5vuTg70MtbWUfSeAxHhqSqeZqrWiEjGthRmeC4AfvO9PSTnb7YNhWnQcwqVqwo6zZ64iOaPYCuiOcf57lPuw37hb6UlOahI8iYTkZkRxzY20NKXW3LI+pmC/ulGrOUNyFNSO1hotbdrFv40xpkshmVlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CofJ4TP5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CofJ4TP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766251652; x=1797787652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RkE0TLGs5j9BErOysmR3zVw0jP9Fz8/LVnjuuX+P6nI=;
  b=CofJ4TP5a7POWEOdagq1F632/EKXDunguwjNuPGBSkzeI4IKdy6QOpD1
   cbvMUM2/4RCLM5M4YcX0M0yZaxo2eupM7yu/ALgba5eHVV++EFBV+Kgd5
   1WJqMvfKvJPpFVYyoay6TRlPFRoCzjKit/FeSJc4sKLR+49TtFfCYxHl2
   /iJcibHugjFU0nk3OqKNRQJFRK/n3wDtWugPdh1ykgGLOjROEDudXiL7t
   QZJ7fHgx8eDziOY7gtQQ4UNDdp29BQP1cB9BYDTRx+QPXKQ5aQEJ3eSza
   yQFuxc84JJ6jAbbfVRwMVmuEDTvuEDCdZ6vAQyJQOgl+S1syGqhJ/kbXh
   Q==;
X-CSE-ConnectionGUID: FOFtye+0RV2CmvYIhnpT/g==
X-CSE-MsgGUID: whcMQEHNS8WLyV2Y3J3HxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78897666"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78897666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:27:32 -0800
X-CSE-ConnectionGUID: cHBnqzhoSzOSxw3LZxkzsQ==
X-CSE-MsgGUID: Vw4u5yjTRM6CvJbVrEo49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222613970"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 09:27:31 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0jo-000000004wR-2DZR;
	Sat, 20 Dec 2025 17:27:28 +0000
Date: Sun, 21 Dec 2025 01:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544] drivers/irqchip/irq-gic-v3.c:1526:6:
 warning: no previous prototype for 'gic_dist_enable_ipiv'
Message-ID: <202512210133.hQCBSnrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 5634a3dfafb71ede4922b523f77389ef2c006b61 [3544/3544] kvm: hisi_virt: Probe and configure IPIV capacity on HIP12
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251221/202512210133.hQCBSnrQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210133.hQCBSnrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210133.hQCBSnrQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c:1517:6: warning: no previous prototype for 'is_gicv4p1' [-Wmissing-prototypes]
    1517 | bool is_gicv4p1(void)
         |      ^~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1526:6: warning: no previous prototype for 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
    1526 | void gic_dist_enable_ipiv(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/gic_dist_enable_ipiv +1526 drivers/irqchip/irq-gic-v3.c

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
