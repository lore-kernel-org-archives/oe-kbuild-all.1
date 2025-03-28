Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1343C0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174044; cv=none; b=neOMCmbOqfwl1JJ2CmASsxjLzVEv7qcA4W3O2E9l7RJ8TU4MPI5eSmFJLowjqFUxtGwJ56WMuEIXeDOb6A9ZXAr7f9aoWc1qMUpFMMnNVYXiPe/TKuP0m+Q/RJyhV5Awf00Cu2A4vDys9ddcgAVGDaq9OPMLHBKk1PK2ZDGCJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174044; c=relaxed/simple;
	bh=myVqDEXSnnwWJys2/shupeSKQBZhVmXXDEAnKSmggXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eGh7yBab5tpS3N8kSUpNJ1Te6+DMAE5ahddkmqHoaS069JX4VqrmSylXIcZISH4NxjF8VNNWbTzdey9mwQDavrdPOfDyyhzKO4C6WapdWBdfMh5RR4oo6csfulVbQJ48+ZUZ+nzUAMBp2BTKyWZPJCwWf+nFevTj+Ts+sNn65kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjNHBNht; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjNHBNht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743174041; x=1774710041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myVqDEXSnnwWJys2/shupeSKQBZhVmXXDEAnKSmggXs=;
  b=WjNHBNhttOr1usRofHpgwM4UK/Ao9hyfRP1AHSKfa7RpKTtl8eZFpFE2
   D/sKpn3ZofpLy+EaxaHMA2SsY2zrSQ2HmSdEeo/3tHMwo84KsEz47jOWW
   JneTP3yAf68yC80sXbelbuMsPFu3PEAXNxdc1aD3xhD3Xepx0FOIVjBoT
   XZGxSLaSgndP/+D1KelNsM/BOz4zLc/vZESsAtKA8x0xvVwNTJQ3ii5w6
   xQ71IWYpoqPR2JohPeQm4MBTuXi35BRSvkfwL48kZ1dPRrd0Acd2gd5Ej
   G9XLNzz5OszW07tT14SXJIHKH+2f0btVrP5R9tM6Dr62rUrkqC3cZKg7f
   Q==;
X-CSE-ConnectionGUID: mNPzcRMtSwiXqRXSoSrotg==
X-CSE-MsgGUID: CPhZ0SutQzm2wqAH9SbB2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55197903"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55197903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 08:00:39 -0700
X-CSE-ConnectionGUID: TG/jBMKKTJu0HHxzHx3cvQ==
X-CSE-MsgGUID: Xn3rxUHyQJ6PEv30CMqMSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="162698887"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2025 08:00:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyBCE-0007Vr-2P;
	Fri, 28 Mar 2025 15:00:34 +0000
Date: Fri, 28 Mar 2025 22:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 499/499]
 drivers/dma-buf/heaps/restricted_heap.c:201:21: error: initialization of
 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  u32,  u64)'
 {aka 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  unsigned
 int,  long long unsigned int)'} fr...
Message-ID: <202503282249.SKSXbxvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   05387f6649b8b2e90387b0f30e788b96413e54d0
commit: 05387f6649b8b2e90387b0f30e788b96413e54d0 [499/499] Revert "FROMLIST: dma-buf: system_heap: Add a system-uncached heap re-using the system heap"
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250328/202503282249.SKSXbxvI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282249.SKSXbxvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282249.SKSXbxvI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/restricted_heap.c:201:21: error: initialization of 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  u32,  u64)' {aka 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  unsigned int,  long long unsigned int)'} from incompatible pointer type 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  long unsigned int,  long unsigned int)' [-Wincompatible-pointer-types]
     201 |         .allocate = restricted_heap_allocate,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/restricted_heap.c:201:21: note: (near initialization for 'rheap_ops.allocate')


vim +201 drivers/dma-buf/heaps/restricted_heap.c

7250c068a51cbf Yong Wu 2024-05-15  199  
7250c068a51cbf Yong Wu 2024-05-15  200  static const struct dma_heap_ops rheap_ops = {
7250c068a51cbf Yong Wu 2024-05-15 @201  	.allocate = restricted_heap_allocate,
7250c068a51cbf Yong Wu 2024-05-15  202  };
7250c068a51cbf Yong Wu 2024-05-15  203  

:::::: The code at line 201 was first introduced by commit
:::::: 7250c068a51cbf472372ddd41d02087ccab05175 FROMLIST: dma-buf: heaps: Initialize a restricted heap

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Hubert Mazur <hmazur@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
