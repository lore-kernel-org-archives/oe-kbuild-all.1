Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431B813B5A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713941295; cv=none; b=ow/W4cgLCrbLpqmPUk+zNjLsmqVlPl+4hExTv4ImAq4OkV2sGZr26/SpdIPPEscAfsJ/0BrGBv+7nXPUSIr6ieK4JZFFTHZt2RkfpIK+5n3Mu9T76zoC58rLz2r0ni+VdotnvCBkBtzsamraK+zn+LImlS6rxIk2uEPLVH4My/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713941295; c=relaxed/simple;
	bh=tTpeY1zEGE7cGIX0jyKWMAQuIqoqxTi+vhBhOkcoekg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3FxrXdk/HLeO+OkYEnR+4JpEeMxY6d9VEHRNH8nE4tsnVLdh1/K8kAgjrplkVzKQy46C40KzhouK8qaGrVzCXoOuWheW10CS/1PFtQOI68XIa61b7oUihZW2U53JlVbdjcH3WrzDV2tHxo91F7HSondUdo4q3xZY0xZUJiQkOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSYpHgc/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSYpHgc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713941295; x=1745477295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTpeY1zEGE7cGIX0jyKWMAQuIqoqxTi+vhBhOkcoekg=;
  b=LSYpHgc/muYfjY6n6ENN0/t/6Hns2pUGlu5GDCGzoAAMJPk4RCKhtaP8
   kfCtXwdTxEA64A7OsGf4qxtObwWCIN52IVK8AmvuW9hBFJ+U8trVkUMXj
   xi5j/Me/XoM0udTQUbzeAHGTsFHPJitKTwtwt5jbUyv0GFYx99kFuFaCO
   W5tMeSmvQgt0kw+TJJrYNQt+iZyOxyXQIrCUH606hv6NilxswhJYx55cn
   g5VSQhOtDNM97WzqCF8YfOPZKqNnBJgqYFMZMKQTB6Z2g5XsZSwGoN+Cw
   c9KwUpPNuXapysPQFQLs0FX01D5647argpcEQZzEYH5JU9iCUtIwLTsCp
   Q==;
X-CSE-ConnectionGUID: NxEbH0cgRHiP4GZI306p5w==
X-CSE-MsgGUID: M5r+8ThCTnCgqHBR57BpuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13345885"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="13345885"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 23:48:02 -0700
X-CSE-ConnectionGUID: loK/IxD4QAGceB9S/lJYyw==
X-CSE-MsgGUID: PK/46AU7QYOxo84HJ1fxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="62071130"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 23:48:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzWQA-0000xI-06;
	Wed, 24 Apr 2024 06:47:58 +0000
Date: Wed, 24 Apr 2024 14:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 4/6]
 arch/x86/include/asm/atomic.h:23:undefined reference to
 `__tracepoint_cper_cxl_event'
Message-ID: <202404241438.jL0BDTNb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   9b1f33314e8488506dbad63dc1c896386d4803d6
commit: 2d11892dead2fcc454ceb5779c01584d1bed0c6b [4/6] ras/events: Trace CXL CPER events without CXL stack
config: x86_64-randconfig-122-20240424 (https://download.01.org/0day-ci/archive/20240424/202404241438.jL0BDTNb-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241438.jL0BDTNb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241438.jL0BDTNb-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23:(.text+0x16b783b): undefined reference to `__tracepoint_cper_cxl_event'
>> ld: arch/x86/include/asm/atomic.h:23:(.text+0x16b785c): undefined reference to `__tracepoint_cper_cxl_event'
   ld: arch/x86/include/asm/atomic.h:23:(.text+0x16b7867): undefined reference to `__tracepoint_cper_cxl_event'
   ld: vmlinux.o: in function `trace_cper_cxl_event':
>> include/ras/ras_event.h:429:(.text+0x16b78d6): undefined reference to `__tracepoint_cper_cxl_event'
>> ld: include/ras/ras_event.h:429:(.text+0x16b78f5): undefined reference to `__tracepoint_cper_cxl_event'
>> ld: include/ras/ras_event.h:429:(.text+0x16b7931): undefined reference to `__SCT__tp_func_cper_cxl_event'
   ld: include/ras/ras_event.h:429:(.text+0x16b79a9): undefined reference to `__tracepoint_cper_cxl_event'
>> ld: vmlinux.o:(.static_call_sites+0x5e84): undefined reference to `__SCK__tp_func_cper_cxl_event'


vim +23 arch/x86/include/asm/atomic.h

5abbbbf0b0cd4a Brian Gerst    2010-01-07  11  
5abbbbf0b0cd4a Brian Gerst    2010-01-07  12  /*
5abbbbf0b0cd4a Brian Gerst    2010-01-07  13   * Atomic operations that C can't guarantee us.  Useful for
5abbbbf0b0cd4a Brian Gerst    2010-01-07  14   * resource counting etc..
5abbbbf0b0cd4a Brian Gerst    2010-01-07  15   */
5abbbbf0b0cd4a Brian Gerst    2010-01-07  16  
8bf705d130396e Dmitry Vyukov  2018-01-29  17  static __always_inline int arch_atomic_read(const atomic_t *v)
5abbbbf0b0cd4a Brian Gerst    2010-01-07  18  {
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  19  	/*
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  20  	 * Note for KASAN: we deliberately don't use READ_ONCE_NOCHECK() here,
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  21  	 * it's non-inlined function that increases binary size and stack usage.
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  22  	 */
37f8173dd84936 Peter Zijlstra 2020-01-24 @23  	return __READ_ONCE((v)->counter);
5abbbbf0b0cd4a Brian Gerst    2010-01-07  24  }
5abbbbf0b0cd4a Brian Gerst    2010-01-07  25  

:::::: The code at line 23 was first introduced by commit
:::::: 37f8173dd84936ea78000ed1cad24f8b18d48ebb locking/atomics: Flip fallbacks and instrumentation

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
