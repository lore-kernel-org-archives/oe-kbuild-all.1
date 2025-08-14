Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2175747F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755131701; cv=none; b=Mqk9ItFaSqrk7HWxd/Z0BOmyY+ThHTVQLecVaTrhLTIwCDeUWhVjwF0V5ToeiYYC9Rk9HpVZJpi9xiHyUFvTT0ycY6Wb3kHuY7VvAoFwmXt1B+tE2HEv3vB67OJxcwBuUa7wBHm4NqPIWVqkVC2IXr9p/K+1yNML/fqJkRJV1fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755131701; c=relaxed/simple;
	bh=IvXgO1Q9fBF6FBgiFa6gKMU+YbStjrN8sMubU2InQK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2lDG+IhJD73gjJ2WTU06DJhRurYwXbYVztqw29bDFdcLKUBJV8WaN/iB03U4nJGCi5vIP6YyQ7IhLwlHoS4l2WtTmRH9orv0GMiRbBLplroCAJumsscK4Xvn+z92aw8OXIjvrzDchrYlAjtka14carbYdjXSQHrmpPCLdaA2O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II4Aei0z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II4Aei0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755131701; x=1786667701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvXgO1Q9fBF6FBgiFa6gKMU+YbStjrN8sMubU2InQK8=;
  b=II4Aei0z7Zp7mjhSh92agCbtnJnE7x7ul/Y9GlqwVUvqC3nVB2mPokWm
   Qwo/EJpAmfAPMpecvu1UjW5FdQ9G7vhaHxG1jfifsdiVDrAkEHFVSPuE2
   hEU6PlE7cjaOXjif47fVMaDpQCNdFlCH0RXeKjlW90TuzqvfJQHlxkO1q
   RvvjNK+6Z/n5FvCzOav3dVdJJbWLjoENJsZRazRcsw1EDCgyLstQUajtu
   E5CMWFDcA3GwZb1jfnd0OluVemem/Gfv/H0NVVaGNLjsEKkyJnDDG2yDf
   GwDhx8Bc+ryDHnS33Iv3Ugy4hdUhOXLs+4Bn1EwTp8chxNF4dYwbmuKCo
   w==;
X-CSE-ConnectionGUID: 2YZmikpJQhC1/wk6kFWSew==
X-CSE-MsgGUID: owqJHZyxSXqcMZxq//cATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68521432"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68521432"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:35:00 -0700
X-CSE-ConnectionGUID: LTNiHIObTUma7mUqctFSuw==
X-CSE-MsgGUID: G30HwvKgSV2xR9hXLR4rcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203794118"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 17:34:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLvk-000ASG-0k;
	Thu, 14 Aug 2025 00:34:56 +0000
Date: Thu, 14 Aug 2025 08:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 13/19] include/linux/resume_user_mode.h:62:35:
 error: passing argument 1 of 'rseq_handle_notify_resume' from incompatible
 pointer type
Message-ID: <202508140824.WQ8wun57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   c3f9d97d82881880460dacf48da60a280f4797cd
commit: b61b05575dfff39cdef4faaa4bc4710082793173 [13/19] rseq: Optimize the signal delivery path
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250814/202508140824.WQ8wun57-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140824.WQ8wun57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140824.WQ8wun57-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/task_work.c:5:
   include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
>> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_handle_notify_resume' from incompatible pointer type [-Wincompatible-pointer-types]
      62 |         rseq_handle_notify_resume(regs);
         |                                   ^~~~
         |                                   |
         |                                   struct pt_regs *
   In file included from include/linux/resume_user_mode.h:9:
   include/linux/rseq.h:76:62: note: expected 'struct ksignal *' but argument is of type 'struct pt_regs *'
      76 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                                              ~~~~~~~~~~~~~~~~^~~~
   include/linux/resume_user_mode.h:62:9: error: too few arguments to function 'rseq_handle_notify_resume'; expected 2, have 1
      62 |         rseq_handle_notify_resume(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rseq.h:76:20: note: declared here
      76 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rseq_handle_notify_resume +62 include/linux/resume_user_mode.h

    58	
    59		mem_cgroup_handle_over_high(GFP_KERNEL);
    60		blkcg_maybe_throttle_current();
    61	
  > 62		rseq_handle_notify_resume(regs);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
