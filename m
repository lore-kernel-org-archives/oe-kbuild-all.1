Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FF3E2754
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033559; cv=none; b=CotvXgVn3iCIaFx37h+9bvfduc2Hlrm13PTt61R4/+BTOHJk838luZKOvzk/oc3eK1e+lGjLzBM36xLwQv5unBWDrm/83trbCpqNi7iVph+DJNGCYizlX8lFMXoV83cH6yosdlhND/PTXTIy7x4ZX54MjJdsXTxZX6s6UhLynQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033559; c=relaxed/simple;
	bh=KZztWMc9YHGdr0qN1mxy1ZtR8KqmNN83xXCXtbstXks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WM2wV28l5osu7ODdv8P5Zi6HGbzteW1nIA25hjVn1Q9e9Bsl7Yr5+xMT9Jg8Z3jNMiBcC6Nml8PJ66mrTHTFfBiBNAgz6/7OZG4hHXPldq/EZxcxZ7OVKgYFkBIbpiECHc9UmYF3/JQogffkDLbhzx9dW6SUqy8FhJ5cATojpRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfAyR+lQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfAyR+lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792033554; x=1823569554;
  h=date:from:to:cc:subject:message-id;
  bh=KZztWMc9YHGdr0qN1mxy1ZtR8KqmNN83xXCXtbstXks=;
  b=VfAyR+lQy3i99umLTnbLVsWkkwDfXDf5chJ6gcmNJljrk4jT7MHI7iDq
   cHVWX99B/1THxavKm4XyfVbGMG45nSieexioHnimrpKDUaEFVlrof6chP
   syDlr8H6gp5y1nvg/251TaEcuNeqlVeFOoAHLlCivSnJNUCEfFqMQMDDQ
   61JQ9d5Hov6FssxnG2U9fOw0kr97PLSzSXU9GC03d6yDG+1k77HsrC46g
   YQKZG7laqIapRAssGSDFeTrtZF/4EfjEosvCMIASBY5lvJeVUmuqAbXiG
   EKoqLx+joLEgK6mXOMdP9wc9WpHZdUKQDleDCGBDibpcObfomQFsEwfF/
   Q==;
X-CSE-ConnectionGUID: 5uY+WNqSQB2BsEKjZYT4mg==
X-CSE-MsgGUID: n+Wp5R/mSUiu8Xei0jw4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="680149"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="680149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:05:53 -0700
X-CSE-ConnectionGUID: I6FwLAV5RW6ySrHMKc19Nw==
X-CSE-MsgGUID: njCMsE4PT7KAhrUIZZHfsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1536950"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2026 20:05:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHBmv-00000000BZb-2hb8;
	Thu, 15 Oct 2026 03:05:49 +0000
Date: Thu, 15 Oct 2026 05:05:45 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 drivers/usb/cdns3/cdnsp-gadget.c:156:16: sparse: sparse: cast to restricted
 __le32
Message-ID: <202610150510.juTCnooG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   06aabb3c55412104814644e8d1b37df04940d99a
commit: 0554dade57dd6d657eba7303b63a8ed93498063d [1/1] usb: cdnsp: Fix issue with resuming from L1
config: i386-randconfig-r2308-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150510.juTCnooG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150510.juTCnooG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150510.juTCnooG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/cdnsp-gadget.c:156:16: sparse: sparse: cast to restricted __le32
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse:     expected unsigned int val
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse:     got restricted __le32 [usertype]

vim +156 drivers/usb/cdns3/cdnsp-gadget.c

   140	
   141	static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
   142	{
   143		struct cdns *cdns = dev_get_drvdata(pdev->dev);
   144		__le32 __iomem *reg;
   145		void __iomem *base;
   146		u32 offset = 0;
   147		u32 val;
   148	
   149		if (!cdns->override_apb_timeout)
   150			return;
   151	
   152		base = &pdev->cap_regs->hc_capbase;
   153		offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
   154		reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
   155	
 > 156		val  = le32_to_cpu(readl(reg));
   157		val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
   158		writel(cpu_to_le32(val), reg);
   159	}
   160	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
