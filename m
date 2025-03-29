Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8BDA50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 00:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206934; cv=none; b=Vtm8DKVii9ivfTm+R1zHkI61+yS6lhp849XZqrFUpj5dQNEbS9CBZvvsMy1XgxwKK4PsU9Bp8CL1AoUHr1OPdDXjv0qUx6fqLnzo5F0JgUaK6o07okkhbH6J/VQwE97hZB/WY/GjkpJY8bVae0jZMUlWKO9GNtQc1+xuBpry1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206934; c=relaxed/simple;
	bh=ut99obhxgQZAbES0/Voq44WUBeRT+ZfiEt9Z98JP8C8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIfpp+1zbFck1RRNVUTX4+4Avh5gLiKtf46ZeOxAW6E6VvFgWC8NeU4zWsXoGaEDymIFba6Jmqgq7nlroi6t4OMK5y7nNFl1I0hcvw8Luh2HoiOu5ocs934Kwm86v+9k5YSSG0n5VaIG/h4Vi8TRrSs9rux+E7WqIMtGcqEaFGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmCutkm7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmCutkm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743206932; x=1774742932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ut99obhxgQZAbES0/Voq44WUBeRT+ZfiEt9Z98JP8C8=;
  b=AmCutkm7BqrT3YLffEUKQhmYf8Q/UjiUvdBz1o2TjtxYXFZN7/78qwXf
   lqyKk3zZk1FWoUQykDWmlqJX5UadK3j5rGhPcicC3BAYdrj9Bgi5uVG1r
   GtqxAPvSe/W/N4W95qmBGaThIQtL4FS1IpRsl01Bn8bVK6ahUgFOZAYOW
   xF7c17+Q1Nx1FmBZPb/tda8WR4z/6qRZXDRAtPBPNU0avqAjc/hYxwtUO
   cBbEghRhL+8yvm7Koz5fZgFDtZdOEk+uNixuvKQZ10AbNqq3Piv+8jZ0N
   eB0hDHZBClq4MKNvW/Yq8VNukgY8bYCsDAREU1Cz5AOIIk+rMidS/vT7b
   g==;
X-CSE-ConnectionGUID: WTtVrwCWSp6Y1o/33vhOoA==
X-CSE-MsgGUID: e5Nqr6xQQV+gyakBka8Nkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="61974283"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="61974283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:08:51 -0700
X-CSE-ConnectionGUID: MSWwHw46SjiH6RcmwlNx7Q==
X-CSE-MsgGUID: xg1e/Dq7QSqomCDIe9pvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="126035407"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2025 17:08:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJkm-0007mo-1x;
	Sat, 29 Mar 2025 00:08:48 +0000
Date: Sat, 29 Mar 2025 08:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] include/linux/compiler.h:57:31:
 warning: 'tick_cpu' is used uninitialized
Message-ID: <202503290706.mhRBMwu2-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b62ea68f41a901d5f07f48bd6f1d3a117d801411
commit: a94ba5ab288780f141d741107751b4866bc24be3 [0/2] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: i386-buildonly-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290706.mhRBMwu2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290706.mhRBMwu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290706.mhRBMwu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-sched.c:11:
   include/linux/compiler.h: In function 'tick_sched_do_timer':
>> include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized [-Wuninitialized]
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:188:13: note: 'tick_cpu' was declared here
     188 |         int tick_cpu, cpu = smp_processor_id();
         |             ^~~~~~~~


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
