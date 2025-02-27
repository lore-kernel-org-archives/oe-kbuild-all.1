Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52D270022
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 04:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740632054; cv=none; b=UxXKB87E8yIWD/9A1x5GWdKh5FW57H7WWYyOkTkdDXa1t0ajDJtkoXKw/AbHtN7fTnLHf+Rodluotna/04wa1EgAJTZy48CicPs6SK09QSmgxqhiDe3lPqR3zqWddwkn62hM3J0vxE5c01LfCo4/iLfXo/m2GLcSuh4m2jcR68M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740632054; c=relaxed/simple;
	bh=S2BPPqv+o3uTbnY0Dhf9gCBWi7OF3I4y1O0/a+aMCkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W29nRIWXj9nhOHHWeY9WUA6FsyeSYlljmcIK5enpZriijfLI5cJ350imwljUFPTYBWBHULClzht94WEpxMZ9y0KEQIdcwyUp0HLPUhBsU/tDHNAP/AOHuMOF75G67jiNaUhuMblFIP1P9WaoI/TfG6yHD3vyR0kAfSSX/lZ5gHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKqnsAak; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKqnsAak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740632053; x=1772168053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2BPPqv+o3uTbnY0Dhf9gCBWi7OF3I4y1O0/a+aMCkg=;
  b=fKqnsAakb0WqIVMrPCjBC5CT8EVfvt7K8kIZAH3BCCZ5jCQa90BXpgPg
   dYtWOxGhtEwFCjvXTKRZVuNIxaybU3bH/yCpkPydM1qYwgbcxd6LNvtQm
   LmELnlVT1gnMFe6ZMTFgEtRdLkxrE3+IYVOjPGyNrSt7F1vGo5JMw/CYJ
   ynxwsKNHq1dpUbdaSaZMCFP8kVrwYwbFu9yWACCEhR/KUZj5fJmVEY4cg
   BPPR6a1QGu/fZcazCLFrzGU+FtqGa6H/tH1dTvhegzJnOavpsSXLrLIsh
   Oq4L/1VHakLAyrQD3cu+tuLXELOvXCHLAdeYk/FAKdSrvM+mxx5cnApiA
   w==;
X-CSE-ConnectionGUID: hxJGqKJGTFKrVGGm8Ia1SQ==
X-CSE-MsgGUID: KK4RwCTzTiyqPItukQRZcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41527838"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41527838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:54:12 -0800
X-CSE-ConnectionGUID: 5vy6p94/QNCdZCfUc+j82Q==
X-CSE-MsgGUID: DoN8DnSqQ2mSgSoP2D1d1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117085438"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2025 20:54:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnVuS-000Cri-2l;
	Thu, 27 Feb 2025 04:54:08 +0000
Date: Thu, 27 Feb 2025 12:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 19/34]
 include/linux/local_lock_internal.h:33:20: error: 'current' undeclared
Message-ID: <202502271253.yDrpVgRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   6f7536d804ab3f4e62f60ec5f55c8c87fe22951b
commit: c0a895ba79efc3ee3fb7aa05fa2e3921a59c2dd9 [19/34] locking/local_lock: Support Clang's capability analysis
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250227/202502271253.yDrpVgRY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271253.yDrpVgRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271253.yDrpVgRY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/local_lock.h:5,
                    from lib/test_capability-analysis.c:9:
   include/linux/local_lock_internal.h: In function 'local_lock_acquire':
>> include/linux/local_lock_internal.h:33:20: error: 'current' undeclared (first use in this function)
      33 |         l->owner = current;
         |                    ^~~~~~~
   include/linux/local_lock_internal.h:33:20: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/bit_spinlock.h:5,
                    from lib/test_capability-analysis.c:7:
   include/linux/local_lock_internal.h: In function 'local_lock_release':
   include/linux/local_lock_internal.h:38:41: error: 'current' undeclared (first use in this function)
      38 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |                                         ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/local_lock_internal.h:38:9: note: in expansion of macro 'DEBUG_LOCKS_WARN_ON'
      38 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |         ^~~~~~~~~~~~~~~~~~~


vim +/current +33 include/linux/local_lock_internal.h

91710728d1725d Thomas Gleixner 2020-05-27  19  
91710728d1725d Thomas Gleixner 2020-05-27  20  #ifdef CONFIG_DEBUG_LOCK_ALLOC
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  21  # define LOCAL_LOCK_DEBUG_INIT(lockname)		\
91710728d1725d Thomas Gleixner 2020-05-27  22  	.dep_map = {					\
91710728d1725d Thomas Gleixner 2020-05-27  23  		.name = #lockname,			\
91710728d1725d Thomas Gleixner 2020-05-27  24  		.wait_type_inner = LD_WAIT_CONFIG,	\
dfd5e3f5fe27bd Peter Zijlstra  2020-12-09  25  		.lock_type = LD_LOCK_PERCPU,		\
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  26  	},						\
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  27  	.owner = NULL,
91710728d1725d Thomas Gleixner 2020-05-27  28  
91710728d1725d Thomas Gleixner 2020-05-27  29  static inline void local_lock_acquire(local_lock_t *l)
91710728d1725d Thomas Gleixner 2020-05-27  30  {
91710728d1725d Thomas Gleixner 2020-05-27  31  	lock_map_acquire(&l->dep_map);
91710728d1725d Thomas Gleixner 2020-05-27  32  	DEBUG_LOCKS_WARN_ON(l->owner);
91710728d1725d Thomas Gleixner 2020-05-27 @33  	l->owner = current;
91710728d1725d Thomas Gleixner 2020-05-27  34  }
91710728d1725d Thomas Gleixner 2020-05-27  35  

:::::: The code at line 33 was first introduced by commit
:::::: 91710728d1725de51d06b40674abf6e860d592c7 locking: Introduce local_lock()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
