Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241FD529
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 02:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807935; cv=none; b=i/wm8lxUe+q31J1nspEJucGlEh3xAEfzJX+kXAa+2MnLWiL1whOAljE9UzX+zf2k1YCCV41aHnx417SKTvaSCgX7evgm+h2I5Eg7ed2ZPnl8l9at+Lnao7Zo1u0k1IrMS7v0ke1l3bth66WlratUoPpMMHw9GtzLLKEOtRUtYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807935; c=relaxed/simple;
	bh=sxDt0FfeALrgHKnlbbVV+xxRMifnw8OxS4n/820Fo+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiL9sd7/P56mFUqFk3YfbJlUeasYJPblSe5EKc52vEj8RlnzSU8aW7K9ER+lZ1SbiXhgbo/otuPILAPBjAfR54ZcFATEgMbzkbnz9f+T/se7rHHr1SEL1uIlmhpNX1ltyjb4nVz5khAOyS8KqzrRQhOd3bYLn8QEJVb3TuQ5DMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eukCqtE9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eukCqtE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738807933; x=1770343933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxDt0FfeALrgHKnlbbVV+xxRMifnw8OxS4n/820Fo+M=;
  b=eukCqtE9gWeaOlpI/P4IhyNGIhAVLbWf55xxIc47+deZqI//PeBSKRal
   C96kdVIeIbWgiGXe0RLeXP/R3Y0nXkypQU0XDfqHQ+BoBX5Lb8KEtNWwW
   gSqXXpkofMPdAhB3oCcUagXLPkko7jtASQp9HWv20Y+gBHUTv1pIlvFlV
   HA0lkKP0Bdp1fvmFu05QStORltYOQ8ot9YxxL5FXhu0U5LQ4sn54bekUt
   O7rtqFHtOYPYarDlmpbSapFYCQC2bQ1pB9pno8xs90xAElr5VBvMt/CE+
   UxGG5n6+VOWnPNgWwvaQ2bavFaW6wruVrzLl0RaNB+gTgVVsoSHntiKp+
   Q==;
X-CSE-ConnectionGUID: o7TvNRK6TYmDjuaHcnr9jw==
X-CSE-MsgGUID: 0K79xl58REqDU5Z6XCsaEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50017693"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="50017693"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:12:12 -0800
X-CSE-ConnectionGUID: ulsl4jEiRJGxKzgVZ0G5lg==
X-CSE-MsgGUID: esOtSqcHTMyHtB8mY7ZJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="116112537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 18:12:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfrNB-000wLp-1Q;
	Thu, 06 Feb 2025 02:12:09 +0000
Date: Thu, 6 Feb 2025 10:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 17/21]
 include/linux/local_lock_internal.h:32:20: error: 'current' undeclared
Message-ID: <202502061038.6CCfKHm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   a0d770da40bf833f1f658fc84741c8f3fee2a385
commit: e283c1f3a2ae347061eb98f4a3b46af0ed80eded [17/21] locking/local_lock: Support Clang's capability analysis
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502061038.6CCfKHm4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061038.6CCfKHm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061038.6CCfKHm4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/local_lock.h:5,
                    from lib/test_capability-analysis.c:8:
   include/linux/local_lock_internal.h: In function 'local_lock_acquire':
>> include/linux/local_lock_internal.h:32:20: error: 'current' undeclared (first use in this function)
      32 |         l->owner = current;
         |                    ^~~~~~~
   include/linux/local_lock_internal.h:32:20: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/bit_spinlock.h:5,
                    from lib/test_capability-analysis.c:7:
   include/linux/local_lock_internal.h: In function 'local_lock_release':
   include/linux/local_lock_internal.h:37:41: error: 'current' undeclared (first use in this function)
      37 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |                                         ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/local_lock_internal.h:37:9: note: in expansion of macro 'DEBUG_LOCKS_WARN_ON'
      37 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |         ^~~~~~~~~~~~~~~~~~~


vim +/current +32 include/linux/local_lock_internal.h

91710728d1725d Thomas Gleixner 2020-05-27  18  
91710728d1725d Thomas Gleixner 2020-05-27  19  #ifdef CONFIG_DEBUG_LOCK_ALLOC
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  20  # define LOCAL_LOCK_DEBUG_INIT(lockname)		\
91710728d1725d Thomas Gleixner 2020-05-27  21  	.dep_map = {					\
91710728d1725d Thomas Gleixner 2020-05-27  22  		.name = #lockname,			\
91710728d1725d Thomas Gleixner 2020-05-27  23  		.wait_type_inner = LD_WAIT_CONFIG,	\
dfd5e3f5fe27bd Peter Zijlstra  2020-12-09  24  		.lock_type = LD_LOCK_PERCPU,		\
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  25  	},						\
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  26  	.owner = NULL,
91710728d1725d Thomas Gleixner 2020-05-27  27  
91710728d1725d Thomas Gleixner 2020-05-27  28  static inline void local_lock_acquire(local_lock_t *l)
91710728d1725d Thomas Gleixner 2020-05-27  29  {
91710728d1725d Thomas Gleixner 2020-05-27  30  	lock_map_acquire(&l->dep_map);
91710728d1725d Thomas Gleixner 2020-05-27  31  	DEBUG_LOCKS_WARN_ON(l->owner);
91710728d1725d Thomas Gleixner 2020-05-27 @32  	l->owner = current;
91710728d1725d Thomas Gleixner 2020-05-27  33  }
91710728d1725d Thomas Gleixner 2020-05-27  34  

:::::: The code at line 32 was first introduced by commit
:::::: 91710728d1725de51d06b40674abf6e860d592c7 locking: Introduce local_lock()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
