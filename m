Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE861C8629
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889587; cv=none; b=O5J/LobWPPmQ/v+vWB4Ya4YGtCfbkU/CV8Kcs5crvat5mcJFZnvQTXhGP0QevpPpsZXdJ7cYHR5xdcViIXj5PZGix5dQyTklFvE4l5qlg+8JgqfB4pXwIKpUpubr/2l2H8XlerNN6d6gipR9zntuUTRQH4fgfgSewPAfYmW7NHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889587; c=relaxed/simple;
	bh=4SxqnXvHBBCShs6Urldph/64KON1s0uCqwZ3CNWVlY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVLhGQo4XhyGauDftgryUd9plPku8k0d5qK+kJoM+eAgzfJUEGDeLITIxuUAv4nUMmJf0c4oaP8d7jV7+x+xVajAvLj0eK+Ft5OFHRCOaqrVyKOtB1+7+PtOf+lmwHZIh/pPe33dT2mu0FQNSkVZ50EmOBsLwCtbUKULgxBQJl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPTNuAAt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPTNuAAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889585; x=1777425585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4SxqnXvHBBCShs6Urldph/64KON1s0uCqwZ3CNWVlY8=;
  b=YPTNuAAt5f+3b/J58n6cJiK3S4uTSbQEStOkdiyDffpvzqqUjLQY5ibr
   R0azvijCBUsSwRXex25dL43edmyViCjf+TKrq4E2b8rDlJuuEB9MWeETU
   A1LgSBePMSebKRpS/xHVh8Bsvz+5cuKwCD5ww5Te+TRPy8qbSg3hxH3rc
   ukrjDfU1BhS6DJY/z38k7QwxHihYrnYXcOSNuswcFJnNBVMNVfNmarM0Y
   i80MJiJH8kuqExPYMAGadI+PKNKIFz6wSiSG+T2njAWjLP+KwT1eIuJRO
   WiMEgB75e1pnXMp+GcfmvLnbk97/WJbM+eF2XBZJGNigpkf/ko+rvCAay
   Q==;
X-CSE-ConnectionGUID: YSMGN3jgRzq/ld4v5d4X4A==
X-CSE-MsgGUID: WobmH6NcR+G/Hgg/PExUMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165278"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: uJ2wx0WyQd2xWrv7+FUY/w==
X-CSE-MsgGUID: Ik6IaJ3dQ0OG//t3Wfb/ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775823"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd9-00004S-0m;
	Tue, 29 Apr 2025 01:19:27 +0000
Date: Tue, 29 Apr 2025 08:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] arch/arm/mm/fault.c:28:6:
 warning: no previous prototype for 'copy_from_kernel_nofault_allowed'
Message-ID: <202504290853.AGSRi61r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 11bb05969b19050a0f9baa6bcd1cb23439b267e3 [1/1] ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()
config: arm-randconfig-003-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290853.AGSRi61r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290853.AGSRi61r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290853.AGSRi61r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mm/fault.c:28:6: warning: no previous prototype for 'copy_from_kernel_nofault_allowed' [-Wmissing-prototypes]
      28 | bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mm/fault.c:536:1: warning: no previous prototype for 'do_DataAbort' [-Wmissing-prototypes]
     536 | do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
         | ^~~~~~~~~~~~
   arch/arm/mm/fault.c:566:1: warning: no previous prototype for 'do_PrefetchAbort' [-Wmissing-prototypes]
     566 | do_PrefetchAbort(unsigned long addr, unsigned int ifsr, struct pt_regs *regs)
         | ^~~~~~~~~~~~~~~~


vim +/copy_from_kernel_nofault_allowed +28 arch/arm/mm/fault.c

    27	
  > 28	bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
    29	{
    30		unsigned long addr = (unsigned long)unsafe_src;
    31	
    32		return addr >= TASK_SIZE && ULONG_MAX - addr >= size;
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
