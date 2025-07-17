Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601682AD16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752730658; cv=none; b=TfcrHN4i7TUGyHP6bWjCrzmXCKMm/JaiZOHMYja+gFJIaHFhqmINCbCHcg3Vz1DAVkRlzo3q8Qi+iX6u0/H+oIdljOOo2NXBjEPM6Yt9DgXXN94TXDYuI0usphtxwpZ7q9VPHsi8vYt/z3oVLaONKwa5oOC4QIRKb10S8uEFXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752730658; c=relaxed/simple;
	bh=3HZB1tFONFfGfd//Ly393EuozjEx3IcB6zq4jIdl0MI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ke1mCpPMdFNM1PHby6pqC/ODbsniNHS+cO23QVtyFhc19lroGui9elC+bRtJX1wfEZpMR9+n4BUKkC4dzBU6X0di8trvc6xlqrlMDCTUDMsaMXGwo+JKdA+yVq8lbw0GGawDZbIV0VCIfiNR8isGqELqXZIjkfj8DT7AYPntjbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgFm6njQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgFm6njQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752730657; x=1784266657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3HZB1tFONFfGfd//Ly393EuozjEx3IcB6zq4jIdl0MI=;
  b=JgFm6njQkyoeyLWX+pg1m5uLtCifGcwPMUfN5rIcTjMziikOoEywecIy
   lh7gIByAqxBteGTyLJj8jl+6eeN7vPd8SPRT6S/rKd6qwhKC9vtkujHge
   zljg/AiBbPATn97F7UcZYrgHX3qTI6A58JXd4sBvs3rpL5UPiVhxtsGzf
   SmfYSb2sSB+QLdEJ74l3kbkZnxSVJzosLXBe8KNpIp7CHJ136DsTxcbuP
   cyKFrr8HWDDefdoU4Z7sYKHTVPE0gU+GYSdRRh7f62EcrAmjDsns+wS4N
   2UFT7ZP8llnql2Eyz69ov5KE0fDId9JWaQ3/Dyyh88hOKF+0GGtpI9VfK
   g==;
X-CSE-ConnectionGUID: dZRnQ9zqTjqnr2fQE3sUUA==
X-CSE-MsgGUID: 2a0Jb1YbQJmroKM3UYIeEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42621767"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="42621767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 22:37:30 -0700
X-CSE-ConnectionGUID: eWx6UaIzSjiXNlqjYc+nuw==
X-CSE-MsgGUID: KWvZB2SXQVKVYXhZLkCuWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="158240434"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jul 2025 22:37:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucHJ9-000DBL-1O;
	Thu, 17 Jul 2025 05:37:27 +0000
Date: Thu, 17 Jul 2025 13:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] include/linux/compiler.h:57:31:
 warning: 'tick_cpu' is used uninitialized
Message-ID: <202507171356.OpLKkyAT-lkp@intel.com>
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
head:   3bd1e69c2cea5e57974f02a61c48e4e33c6b2345
commit: a94ba5ab288780f141d741107751b4866bc24be3 [0/2] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: x86_64-buildonly-randconfig-004-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171356.OpLKkyAT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171356.OpLKkyAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171356.OpLKkyAT-lkp@intel.com/

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
