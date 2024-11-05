Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED97383
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784130; cv=none; b=bbknnAKojUR3fgjzcauQPlPeWqf3BXTYdg0CV1FfODOFjQ0POKuit+/O7SZ1upnYUv3MP/GUh+IixjoL7uRP5ccbUXIegfz5I9nhJSQLBKvvsoCv/NFi0nWPUCXmwxjC2KHBoxwJgXn5E8SYYQ6Fe9/DGlQZiADNsYwgT5UwFuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784130; c=relaxed/simple;
	bh=BDDa3kCifwrUknkIgCG8f4v+e4npStvh2cxQg9YseIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A32Fj0atcvKXiCa5BYl0Os7nmq64vhRrmLXPUvq7guOxPG3HBm+Yr4nPzk+rDEDTH5WL8b+0zVgw4y6Z0jjsBlnpkyjbxVocJgbY4UB1BPBl6Yr32uXaiExfQHmc5C5Jmd6XkD/TZIWxvlP0FIEezQdOyXsuqDMrCm3eCG8MB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEbxuBjW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEbxuBjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730784128; x=1762320128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BDDa3kCifwrUknkIgCG8f4v+e4npStvh2cxQg9YseIg=;
  b=jEbxuBjWgT3tQosBkSRomedGNj4MTJkE9q1jlwVGbBNBQy2Ublxv7hpa
   TCbF7fpITGOUMQNoAnSUbVEUTGDNFv8OhR8rfbakBIWknVb9Mcum8g8y+
   kqixd1kh8XzMp9mdA8qXINBq3PNPzH4g2ysZU0cY89ihLLRL82/1Gmubs
   IGT5S+AX5AexK336H7Q6S/kEex/evkQyDFOssjEveJqcf+wo35Ul5M6u9
   SJb3cNVWGG6L18i/y3VbDTCU2cXbxjBBqjNtUe6IzycVgaWvdAyeN2cWl
   G4ETyk3O3yIcGV4vssRpL3t2/nlMzmv/hIIt5L4Bb2DDEH2109P5q7xIz
   A==;
X-CSE-ConnectionGUID: 5+xALTTIToWXy0Gd5k3sKg==
X-CSE-MsgGUID: XkT1sIMFTiyn/1k4UStMlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33349348"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="33349348"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:22:08 -0800
X-CSE-ConnectionGUID: oqatbXZ3Sx6ouyhrsC6DOA==
X-CSE-MsgGUID: 1IZnlymrTdKtkRJhmhsA9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84211381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 21:22:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8C0z-000lf3-0n;
	Tue, 05 Nov 2024 05:22:05 +0000
Date: Tue, 5 Nov 2024 13:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 7/11] arch/x86/kernel/cet.c:84:6: error:
 redefinition of '__do_kernel_cp_fault'
Message-ID: <202411051340.cWah8Kw0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   62e8598e1d31c62fc827b23173786c9a5a525fb0
commit: 34affed8a09765349735a66c7e14ca932dc63a60 [7/11] x86/traps: Prepare for ENDBR poison UD1 usage
config: x86_64-buildonly-randconfig-002-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051340.cWah8Kw0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051340.cWah8Kw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051340.cWah8Kw0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cet.c:84:6: error: redefinition of '__do_kernel_cp_fault'
      84 | bool __do_kernel_cp_fault(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ptrace.h:6,
                    from arch/x86/kernel/cet.c:3:
   arch/x86/include/asm/ibt.h:112:20: note: previous definition of '__do_kernel_cp_fault' with type 'bool(struct pt_regs *)' {aka '_Bool(struct pt_regs *)'}
     112 | static inline bool __do_kernel_cp_fault(struct pt_regs *regs) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/__do_kernel_cp_fault +84 arch/x86/kernel/cet.c

    83	
  > 84	bool __do_kernel_cp_fault(struct pt_regs *regs)
    85	{
    86		pr_err("Missing ENDBR: %pS\n", (void *)instruction_pointer(regs));
    87		if (!ibt_fatal) {
    88			printk(KERN_DEFAULT CUT_HERE);
    89			__warn(__FILE__, __LINE__, (void *)regs->ip, TAINT_WARN, regs, NULL);
    90			return true;
    91		}
    92		return false;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
