Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7075661
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765465639; cv=none; b=tQFnjLJkPArL1ohRvBnu1KOrsXtygA8FgOI2rsjFF0+VsmvjmH4YcfxhqityQRANzaVETu5dt6K7OYrl0mzvjH1M1kWWOxyWOCJsFAYJtAZIsZs6dCcfyZg8qBb+1yoxB+Q6+X6ERHVMmKFhbVZfZsmrW0094SpnFP1jrwftQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765465639; c=relaxed/simple;
	bh=glgMwkCF1i7TGNr8A0gudaSnROmj4jzpQyhs0JWg5lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dB1QlYFa6jcJkHXITQ0iG4ZNmch1WfOHWepCrhNMaB6PH/1MZl7byi5NWQUhKr/6DjkJIX5zN0PXmK6iQuUJQEGo9k/nwo/whYycK6L4RauQyL0DPcwdXb9oKntJAh9W0l2PRmHKIFC71ZOuQz4JSrKu0LzG7Y60QdkJQZYeJQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFJnAHNw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFJnAHNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765465637; x=1797001637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glgMwkCF1i7TGNr8A0gudaSnROmj4jzpQyhs0JWg5lI=;
  b=AFJnAHNwZxcyqC0ksSepVDTJ4URWcIPKwOXTPNtu9vcmMPCWJM/X0Ooi
   CF8RpuaeMFk2TsDeK7cYxN7Iy/cBH9JKdtdHw7+XU5gZRfGbqzAoirM+x
   TztceDch8XCzar6fwUC2hCSybBPhx91eAO2STb344f07FesTxIphARbOr
   GgK9SfFl/jUnlSABQdeMJ4RKEfSe/zlpSqnvH242cRDunUl0FKQbhTztX
   w/NRU1PECtAzh5BRW9zMPwRTJSp4nl32c6D56piz/S0fCN0YHISU1Elqb
   Dm9YL2pyDDxB955zRsy65wNVuwGK+GJOBFAHp/StyiZg+Cb+HRnnn5QX3
   g==;
X-CSE-ConnectionGUID: AzEgil4mSpqUrFu7pyo2mQ==
X-CSE-MsgGUID: O8DijoQ/RH2IvwZZBfZqAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71295140"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71295140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 07:07:10 -0800
X-CSE-ConnectionGUID: L5VhO6NKSzCTTTv7g1BLrQ==
X-CSE-MsgGUID: tjKWmyuFRH+Q9BP5Ze8L9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196591287"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 07:07:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTiG2-000000004nx-0ALT;
	Thu, 11 Dec 2025 15:07:06 +0000
Date: Thu, 11 Dec 2025 23:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 1/1]
 include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized in
 this function
Message-ID: <202512112339.sFX6ipO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   3e3c7bca8549a532ba83b4d8e1a732e1cc234d20
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: arm-randconfig-002-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112339.sFX6ipO3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112339.sFX6ipO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112339.sFX6ipO3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-sched.c:11:
   kernel/time/tick-sched.c: In function 'tick_sched_do_timer':
>> include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized in this function [-Wuninitialized]
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:188:6: note: 'tick_cpu' was declared here
     188 |  int tick_cpu, cpu = smp_processor_id();
         |      ^~~~~~~~


vim +/tick_cpu +57 include/linux/compiler.h

a15fd609ad53a6 Linus Torvalds 2019-03-20  56  
a15fd609ad53a6 Linus Torvalds 2019-03-20 @57  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
a15fd609ad53a6 Linus Torvalds 2019-03-20  58  

:::::: The code at line 57 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
