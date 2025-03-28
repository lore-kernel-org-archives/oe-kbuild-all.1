Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE53C0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172778; cv=none; b=ft5+LPlbSfxkWmvLZ9pTjdYF6My2v7cdbKhgPMITxkow+g6gnV1LZ6b6//I2/m0Ch4d+4R6HA2Wl6PnF3Yg40nRtBMacO6ifDo0zUtIq4RFBQ93S55dfdYtDz2oSDNyMGF+r0lS7YvUM6WBc7AJ7cq+womArQ51yLlJYXro3dUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172778; c=relaxed/simple;
	bh=1995pIUrdLEeKwZ0mt6T1b7RttJqc3/C3/8/xHfsdV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5OO7ORUl8eZpAylmwRY7R0aepnbIJiDBA5hvQrDcGdmAxGEG9nuyomcj8P8cBL5B3M7uCFj43bugaZ8eHzTnX/CwpEOZ0j6TjPXJsIxwhw2UI4dRe9GpE9G8OfM+Bz6F44rJ+lEWhW7rgj9Tk+WBcfMhmEAWgThEyZlrxMQ37Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIihhrVp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIihhrVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743172776; x=1774708776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1995pIUrdLEeKwZ0mt6T1b7RttJqc3/C3/8/xHfsdV8=;
  b=FIihhrVpbftkvLUwt/AVUXreowyptyh/GuIxhlxU6FKbge10ZFeRPCPc
   5lAvQ4LSs0tQz7Hm8SxWSNEAtPcT8QwoSdV4wqTI/00/+iwDtqgVtGp6d
   en5mTNoZ37PJ0UQK1fJnYisuGDpiyG0D9E1b/Vwd1e3mAebRCP1YKCxnS
   5cARtGb7A3KOawbU5OXV/bU7pWZqugUBiOVdzbBb9JzgyYCTqCLVx1n8R
   gMy4b+mwAIHieUKxk9nrhegDSiOswN2Dg9D6QIvp+aKaC8iLhQTKTehL6
   dtZ9aNrsmlptxf6c6lvxNLvr/EGpA90gG9Wam9cQrFlQyixA7Yy99kjQt
   Q==;
X-CSE-ConnectionGUID: hBqTF7auSVeWRf0gUA4j8g==
X-CSE-MsgGUID: LgbVh2+zTpGn/SLOAQTSUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44665559"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44665559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:39:35 -0700
X-CSE-ConnectionGUID: 1ghAOxknQXqDte616ZusWg==
X-CSE-MsgGUID: txIzjoQGQ8WWwhz+rejt1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125279020"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2025 07:39:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyArs-0007V0-2Z;
	Fri, 28 Mar 2025 14:39:32 +0000
Date: Fri, 28 Mar 2025 22:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 499/499]
 drivers/dma-buf/heaps/restricted_heap.c:201:14: error: incompatible function
 pointer types initializing 'struct dma_buf *(*)(struct dma_heap *, unsigned
 long, u32, u64)' (aka 'struct dma_buf *(*)(struct dma_heap *, unsigned long,
 unsigned int, unsigned lo...
Message-ID: <202503282220.7gglddWC-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503282220.7gglddWC-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282220.7gglddWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282220.7gglddWC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/restricted_heap.c:201:14: error: incompatible function pointer types initializing 'struct dma_buf *(*)(struct dma_heap *, unsigned long, u32, u64)' (aka 'struct dma_buf *(*)(struct dma_heap *, unsigned long, unsigned int, unsigned long long)') with an expression of type 'struct dma_buf *(struct dma_heap *, unsigned long, unsigned long, unsigned long)' [-Wincompatible-function-pointer-types]
     201 |         .allocate = restricted_heap_allocate,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +201 drivers/dma-buf/heaps/restricted_heap.c

7250c068a51cbf4 Yong Wu 2024-05-15  199  
7250c068a51cbf4 Yong Wu 2024-05-15  200  static const struct dma_heap_ops rheap_ops = {
7250c068a51cbf4 Yong Wu 2024-05-15 @201  	.allocate = restricted_heap_allocate,
7250c068a51cbf4 Yong Wu 2024-05-15  202  };
7250c068a51cbf4 Yong Wu 2024-05-15  203  

:::::: The code at line 201 was first introduced by commit
:::::: 7250c068a51cbf472372ddd41d02087ccab05175 FROMLIST: dma-buf: heaps: Initialize a restricted heap

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Hubert Mazur <hmazur@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
