Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A381DC9B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765589329; cv=none; b=CIj+CjQ7EqR/6MIru+aReV5FPY4sBfMVN/isWSLZF7Gern7Rv8cR3+2vrnayNEd6zrtxkQBNWBqNmjvoUSudujB1GnjdvnILxCw57mnIM9gXjPYq6LkcMFyZEtpqBHSayl/SRM+8VCWeuzaAxdwM45JjI3AKnEhpP+7CjqCq1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765589329; c=relaxed/simple;
	bh=CFGH12VgQJbsZukD9XI0VIfpixUIUkQm12+mVDiP9QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCsq6809jPfowzilKSbFZH5uJESSXNo0QUiyaZCt+ZszGUdoFa7tZF52dTENpbuXMUbKpqOnbUtpGHYN6YP3VgGBsFefOkEkciqpL0s+XxNh4C5dkalTif5/cqX8PcCJ0e2bfj3bv86NjUOUBK5cVh9Lf9HXSof6RZu7NjuNNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXXp8J1X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXXp8J1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765589328; x=1797125328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFGH12VgQJbsZukD9XI0VIfpixUIUkQm12+mVDiP9QY=;
  b=SXXp8J1XOvubEPY8E2qEF91HhqUA7LF34910RCQBwLeVWi1FMXT05qGf
   MCfWTfAp+OKZQZdk2QHKWgMQ5CdkqAtTosWxFY27SNx3XK6MnSTpSO2kA
   GkKTZUwejwtoiMV23Y8ZpePRewQSkwb0K420jX2Gv7MLHMQdQdDUISsQH
   apVHjcf9LaBgvL4+EElBzmaMF9Cw9zdXaqTJPsJ00dOmeEM7osYIHv9yU
   RZIFHAf6nCgyjxixjbcG7dbYs/thYwiLtly1S+hhp01VsL9+4v57cRJNh
   0uwK3AmILqlHJ+HjCNz45awhNfX6+GSH3V01SKMQ2Ubst/xOp6B1rNn8U
   g==;
X-CSE-ConnectionGUID: wFdZ63nXQ0SXHhFNRaa6Vg==
X-CSE-MsgGUID: 0khrLoszQjmU/6MNQ4nzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71441629"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71441629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:28:47 -0800
X-CSE-ConnectionGUID: WM9YQB7fRSWw8DlOJd4y0w==
X-CSE-MsgGUID: IhByn1w1RQaPqtMLXN1/xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202153704"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 17:28:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUERA-000000006t7-0Cac;
	Sat, 13 Dec 2025 01:28:44 +0000
Date: Sat, 13 Dec 2025 09:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/irqchip/irq-gic-v3.c:1541:6:
 warning: no previous prototype for 'gic_get_ipiv_status'
Message-ID: <202512130954.LPEUb9Ak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinqian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 4c1b2c9b61b21a0183f345eb7076db7ac054ae6c [3541/3541] KVM: arm64: check if IPIV is enabled in BIOS
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512130954.LPEUb9Ak-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130954.LPEUb9Ak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130954.LPEUb9Ak-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3.c:1524:6: warning: no previous prototype for 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
    1524 | void gic_dist_enable_ipiv(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1541:6: warning: no previous prototype for 'gic_get_ipiv_status' [-Wmissing-prototypes]
    1541 | bool gic_get_ipiv_status(void)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/gic_get_ipiv_status +1541 drivers/irqchip/irq-gic-v3.c

  1540	
> 1541	bool gic_get_ipiv_status(void)
  1542	{
  1543		u32 val;
  1544	
  1545		val = readl_relaxed(gic_data.dist_base + GICD_MISC_CTRL);
  1546		if (val & GICD_MISC_CTRL_CFG_IPIV_EN)
  1547			return true;
  1548	
  1549		return false;
  1550	}
  1551	EXPORT_SYMBOL(gic_get_ipiv_status);
  1552	#endif /* CONFIG_ARM64_HISI_IPIV */
  1553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
