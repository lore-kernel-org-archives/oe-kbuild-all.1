Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF64E73CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611594; cv=none; b=f4yMzjK6Gu5/S2MhzXmPF1i0k0p351ZryNT1zkLFLfD8Jy4mKRERW4ZZ0+FFdafM4ABZiNECag4h29WqxU76F/YkNfgkPNNKKH4ITd3YfH+3MRwLcn/d0wYEzhMBR2bcV1/LhMlBnNzr/Lne7ohwcb4qPw4h1t8WNYGOuFyAr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611594; c=relaxed/simple;
	bh=XkzCNXjO0wE/wxzigH3MwtVKB/yvjMtBjzYHnyNLYAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gDqVVxXwkizQyE5C7ResMVwjnM5OM4VgF2tEXChWsk+cMl+M2HZQAhPZ4K0EdTtiYn1VOlt+c4U7VXQQHZSlli4IHaK0G6vPMQv4p/Ss3ZY/i0zYSM5FZ7JyDVrIR5r639EP4TC40UnpsaRFMUp5mXUy+dCg246q1e5Aq3OrZxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxhH5etD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxhH5etD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790611588; x=1822147588;
  h=date:from:to:cc:subject:message-id;
  bh=XkzCNXjO0wE/wxzigH3MwtVKB/yvjMtBjzYHnyNLYAU=;
  b=KxhH5etDLNEzynrSyCHHTF305dEHMxQOt9W9cDgFvD0KEIdXihxjuO69
   2dYaXgV45RUj5HiNGrm9PRnMW8BC0Dq2f5DjyZLxqG8sZYOMgy/8stuus
   1ZMGkFwIFQMSXNhHdILSQPpVrOimieA6FBCmnZfL73F9c6pIVxIx4gyiF
   baeHWt15H9TNXIwU8kZhYrGnmJqSjmVJLPna8+Q4H9ohN3PHWFnLeeGSa
   xToMm5rJoCHKaxHtg4ulnW3l3d1PqhVC3/rGxiskSTY+v5haBwA+QHT5k
   fN+2MwhOIBZrCRcgRuD+93ObVIQZmxJk0yeJPeXmtcA4gBig4oJJ7LBq7
   w==;
X-CSE-ConnectionGUID: JZinqusVSuCkeQSFfyncog==
X-CSE-MsgGUID: T+wJjeeNT56Mqpy/99EyHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90442081"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90442081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 09:06:25 -0700
X-CSE-ConnectionGUID: loOPxq5MTLKuUDJeBOMZ7A==
X-CSE-MsgGUID: MgfY9LQjQFOLIdzsBx9Y4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278285485"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2026 09:06:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBDrx-00000000OBP-36tr;
	Mon, 28 Sep 2026 16:06:21 +0000
Date: Tue, 29 Sep 2026 00:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 2/2]
 include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized
Message-ID: <202609282355.vr6vUo32-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   96be303f915dceac57b49fb3825e6f1cb1f9ae35
commit: a94ba5ab288780f141d741107751b4866bc24be3 [2/2] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: arm64-randconfig-1002-20260928 (https://download.01.org/0day-ci/archive/20260928/202609282355.vr6vUo32-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609282355.vr6vUo32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609282355.vr6vUo32-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-sched.c:11:
   kernel/time/tick-sched.c: In function 'tick_sched_do_timer':
>> include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized [-Wuninitialized]
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/time/tick-sched.c:212:9: note: in expansion of macro 'if'
     212 |         if (tick_cpu == cpu) {
         |         ^~
   kernel/time/tick-sched.c:188:13: note: 'tick_cpu' was declared here
     188 |         int tick_cpu, cpu = smp_processor_id();
         |             ^~~~~~~~


vim +/tick_cpu +57 include/linux/compiler.h

a15fd609ad53a63 Linus Torvalds 2019-03-20  56  
a15fd609ad53a63 Linus Torvalds 2019-03-20 @57  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
a15fd609ad53a63 Linus Torvalds 2019-03-20  58  

:::::: The code at line 57 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
