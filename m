Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44434313D49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616811; cv=none; b=qrGydVjD8mXkVjgnmOjlWzzEN7xp4OA6NCCxxSGg7aYqrxe37M6BL9QAp25hC0k4m74N5ul8fiWXz/gEIWV5JWFaM08e0JIsuKc95uBQYy4jFQffdMyFNwQYvvMxBjRxooz+EeGQ4WCXukSSvB/OLSnVO3Lo+VFSKinvrtb3tYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616811; c=relaxed/simple;
	bh=9BtEYvegqoaiU/+44D8X412/ZQOEpPEqmh/kntSzoO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESnEdQr0/ooZDK9/ndLOTg7PKp4LkgIwriKKUBDVgSYklaONoSLTQWdi5H5nl4qvXrZawyfZ8HiAEkTca8W8LFdU8jsuJmY7v23gIRXH0Sjx08PPoYkcTLJtRarV+iEdlKElFDfmGANoV7D9BlhuaGjXVSIjEhOL4Jj1HfZDEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAyI8QSu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAyI8QSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758616809; x=1790152809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BtEYvegqoaiU/+44D8X412/ZQOEpPEqmh/kntSzoO4=;
  b=IAyI8QSuERPpxzM5dpwGByyW8esh2/3SDcajGfQCmMcB0OO6RvegW6dX
   LQ3w4kRC0IM3cuaiSJ3oWb9McbweuALWbIQ/gWDVv9BLuIEh6NJdfYimi
   tUAYEukaAfnZMXDc+MaHDTaDPOqm4nXqso8EMXCSMl+sYpSZgZ74L2s/K
   Cq3SMmD3hqR+7nRxiNdXG8Az1gfnAz2VKZhFgyIa86DRU3BoN24jDg+XW
   v5RDds/j6ZBnJsvrsXYcMS+fEHmvY4f4GCGRkiUSIPWHckXLl/xK5Ew4v
   nvI9xYBOyQxhbpQ6q+V3yh2ndgm7SE7Bx9jN2EEgnyRxwlhDGwFxdzs7O
   w==;
X-CSE-ConnectionGUID: Q+tt0OgFTle/PoWR2k/btw==
X-CSE-MsgGUID: oWJA9CkKSnCB1/1PvfG2xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60815896"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60815896"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:40:08 -0700
X-CSE-ConnectionGUID: 5lKOXbQGQPmRY/PT57vx+A==
X-CSE-MsgGUID: 4+kcN4wUT0qxrx1XN3CvNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181097054"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2025 01:40:08 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0yZB-0002vJ-2q;
	Tue, 23 Sep 2025 08:40:05 +0000
Date: Tue, 23 Sep 2025 16:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] mm/swap_slots.c:95:6: warning:
 no previous prototype for function 'is_swap_slot_cache_enabled'
Message-ID: <202509231646.VbUiIG8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f06b723c6fa4f8cf9750f131eaf8991b291f16bd
commit: e064059673798b931f95f724c7e377fa8cd15df7 [1/1] ANDROID: create and export is_swap_slot_cache_enabled
config: x86_64-buildonly-randconfig-004-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231646.VbUiIG8R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231646.VbUiIG8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231646.VbUiIG8R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_slots.c:95:6: warning: no previous prototype for function 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
      95 | bool is_swap_slot_cache_enabled(void)
         |      ^
   mm/swap_slots.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | bool is_swap_slot_cache_enabled(void)
         | ^
         | static 
   mm/swap_slots.c:101:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
     101 | bool check_cache_active(void)
         |      ^
   mm/swap_slots.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | bool check_cache_active(void)
         | ^
         | static 
   2 warnings generated.


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
