Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E45928DEF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431716; cv=none; b=U+aHdX9m+IggVKsbAVf3VtKhNLEv+y7BwvRySIAZO3AN/9PhRevML/6Y0iy4dS9UV6Zmsr1+ZDETx8IEOAczEIWjn0iO3SocxOJi/H8sAG1dpyC5wi2+oZZwKcqLsEmxRth7mcDScZyYnwIEU56T6/N2Zs9qiReUg1acC+EgsW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431716; c=relaxed/simple;
	bh=8yJCqp3mFEPHq93p+NQBHcTVvopdOymYIoaUMu2FeT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxADA8VEbzhY79hc9FAuyo0BScdmP0dO5bP7zLyxXKm01YzZkNhP9ttssA//DcFtPMxZi0fMulZiycric93oWbU1UWCiPQl43SRCNf2n9Ibqrf0aW6mfJBU4yzlJEkJjCdtkkMzteAGG3VjX9rf7pY3/pgs+oVBw8QnR5/dGBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncpUlFbi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncpUlFbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745431715; x=1776967715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yJCqp3mFEPHq93p+NQBHcTVvopdOymYIoaUMu2FeT0=;
  b=ncpUlFbiHXc6pUoWO81LE1byUVI6tnfExdLKBv0Z6sVIlK0ieZJNyYn2
   rQtb6kXMxwXiwixHnpEPmq89g70kpWRRCSyoTFIZCgB+i+grkKeAJomxc
   IBgKSGvWdCSHnHHX4WNyZm0dlcrbVl/C6uNyi49DpmGICIugEJnRf3gri
   f/BzpNtwYDtLenxnz58gCSxqRotg1EAjrZYH5Q3EnFZPBggVoCvLA4hN5
   7/Lfk8uc5SJDM354CmYZ/mqErEmbCfLRzq9xShTpWkRfLu3YW/9Znslzr
   I+KXpPAdTdZrZzdcI/gu21/ZzB132l+wv64FW5tukVqoIS4nM8wdsj534
   g==;
X-CSE-ConnectionGUID: YKyAmQmLRNW7eCDmxgHf2Q==
X-CSE-MsgGUID: i/oCEYstSIaqdQztuesfrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58031539"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58031539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 11:08:34 -0700
X-CSE-ConnectionGUID: cN/enXZEQ1ie+UaE59T8+A==
X-CSE-MsgGUID: dmramQUgT4qERBthNwh8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132684020"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Apr 2025 11:08:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7eWN-0003Wx-0H;
	Wed, 23 Apr 2025 18:08:31 +0000
Date: Thu, 24 Apr 2025 02:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2163/2163] drivers/irqchip/irq-gic-v3.c:1517:6:
 warning: no previous prototype for function 'is_gicv4p1'
Message-ID: <202504240137.L2xvmv1X-lkp@intel.com>
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
config: arm64-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240137.L2xvmv1X-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240137.L2xvmv1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240137.L2xvmv1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1517:6: warning: no previous prototype for function 'is_gicv4p1' [-Wmissing-prototypes]
    1517 | bool is_gicv4p1(void)
         |      ^
   drivers/irqchip/irq-gic-v3.c:1517:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1517 | bool is_gicv4p1(void)
         | ^
         | static 
>> drivers/irqchip/irq-gic-v3.c:1526:6: warning: no previous prototype for function 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
    1526 | void gic_dist_enable_ipiv(void)
         |      ^
   drivers/irqchip/irq-gic-v3.c:1526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1526 | void gic_dist_enable_ipiv(void)
         | ^
         | static 
   2 warnings generated.


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
