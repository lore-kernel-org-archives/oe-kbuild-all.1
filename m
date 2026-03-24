Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D83C0608
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334245; cv=none; b=OLZJIfnEFJoJZrLoNtaRT/8eJGEEM1hw1flIZ1UuTIpax7Pwmjr5hOuvjBf5Wja7RxQSYUpkgVDgotJgs0sFUvOZbBm95rOMM87JMFCrBbAGkvdBKlrcO98BJekwuSk7kH2IJeC7hBgGTUz8LGnbcCB2qf7CQG9fBKChoQdFyNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334245; c=relaxed/simple;
	bh=criHWQM/KO4FhFdWnj2o/WBOuLpqXbXkpX3PRYgVlQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NLIwiIZZl7aUpUKhAxpKynFO0zpqCrTXA8zQfmTfJE9diVlyEnAU3N6f7KxOQswH94Z6pL71yp4Z/GnE3JAhsPEs6bOWjkxgpgOcs0AVauyYTFm6u/5+kmQE5knEXpcmuzUgjowsdE1ldtdacShE4zIICLOc6+uAN8dWoenkT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAZcBdMP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAZcBdMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774334241; x=1805870241;
  h=date:from:to:cc:subject:message-id;
  bh=criHWQM/KO4FhFdWnj2o/WBOuLpqXbXkpX3PRYgVlQc=;
  b=TAZcBdMP0XgnAsr3yIjlkCZwYLEatYP6N6YXX1u9xfCLIBOG8B5pbzuB
   cu/Q0c0/ko6d6epHYvlY2ma5wqIlzGahRjndLai9jzCmFoa3x4XKNZ25h
   34ZsvvzwGEyEldfB5c7vZ8cMZQZi/m3LuTt/+UfEjmPg2iVrgy49lRp0X
   RB+AQWCxjTer4sjmm3saF6KwD1/yPk3xbYAqcu8hBByT/9x/S7qiyGjaw
   dE2WirsTJHK+VVvi/pSFJzawZddQbmHKZ1tNd5haH3eMV098Cp7ozpxoM
   Ry2TT4+25evLTugtS/+MhYLGW0zGT/lDYiN2NLrFfgDd19hnlJ19ba76D
   A==;
X-CSE-ConnectionGUID: i64mRlLVQ8ym3tGODgMuow==
X-CSE-MsgGUID: AMLq9wxRSE60xkPsMyU/Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75459986"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75459986"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 23:37:19 -0700
X-CSE-ConnectionGUID: +YOVDbH/SNO1dWjPnEMPFg==
X-CSE-MsgGUID: Dmzs2/YGTnqMUXR608Tr3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247906587"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 23:37:18 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4vO8-0000000040T-089w;
	Tue, 24 Mar 2026 06:37:16 +0000
Date: Tue, 24 Mar 2026 14:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 7/7]
 drivers/usb/host/xhci-mem.c:391:16: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202603241400.14Ls3dsd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c0665c721df9b82c4652604d24aa91456058230b
commit: 90ab8e7f988d4bb2ceae033e4ea423e009459405 [7/7] ANDROID: usb: host: add xhci hooks for USB offload
config: arm64-randconfig-r122-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241400.14Ls3dsd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241400.14Ls3dsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241400.14Ls3dsd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/host/xhci-mem.c:391:16: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/host/xhci-mem.c:1921:16: sparse: sparse: Using plain integer as NULL pointer

vim +391 drivers/usb/host/xhci-mem.c

   381	
   382	static struct xhci_ring *xhci_vendor_alloc_transfer_ring(struct xhci_hcd *xhci,
   383			u32 endpoint_type, enum xhci_ring_type ring_type,
   384			unsigned int max_packet, gfp_t mem_flags)
   385	{
   386		struct xhci_vendor_ops *ops = xhci_vendor_get_ops(xhci);
   387	
   388		if (ops && ops->alloc_transfer_ring)
   389			return ops->alloc_transfer_ring(xhci, endpoint_type, ring_type,
   390					max_packet, mem_flags);
 > 391		return 0;
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
