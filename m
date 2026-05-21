Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1313876CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388218; cv=none; b=ma7jhITb/oenss3nUXY2NHuc4AQPBczgV1PAAq2ZkI5usFpzCSwVEHpr5BEAPLMFfecpc6gZ4iNbQZfBch2Xfu70SwqU16LpEDD078AfwG6yzidNl3MD8W3qEzXHm1T5jZjISh2D9SHAO1qdPnnXWL41cbdp6W5ogtLAhfldx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388218; c=relaxed/simple;
	bh=JBeiwih864t8TPeAI58dhrjbIWrMwv+OG2lryI1i/mg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U2zIsgKWloJo0SIyGM7Y9gPt19citKJk20zk34meksUbEikB3k0uA0zJzAIZ3CzQuDtYO4rM1BtOwJqF1fGhr1SScaZ6+W+xTxnbPb4qfMY/vuO8pL8OrF9E475QccJ4alThKViegeUcok5ZPwKxRf2YzTWl1N8fK0pTY8PrS0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBArv2je; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBArv2je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779388216; x=1810924216;
  h=date:from:to:cc:subject:message-id;
  bh=JBeiwih864t8TPeAI58dhrjbIWrMwv+OG2lryI1i/mg=;
  b=aBArv2jearSuzcOUl9+mkORmVj8DkzUupfiRXO6r/CGHlaf15uftkrjL
   R/+q9aZLTk9bonvwlogz66x8oDuvFZrd56zghDdNLrufQ1rd7uOKsn20I
   z2/maK3Xzb5U9ABjryiZVsDSSzDjQYWz07cYXGdMmIz9EajqrXM5U8maX
   O432UzTKHvd+XvyW5EU7OSIdhbWsf7gGnwSe8Mg2zcpY+RUYsBp1FSdSb
   AontgweCUsziMyv+4JY7nDCAXVhpw4JzQixzGT3eccEGzHZsnRgc3Y6cr
   cyWy7lxGBEnMcB835VMjXvgVLfMuv4XKvDDCp4YhO3Xz2ZSWlpHTmqqLN
   w==;
X-CSE-ConnectionGUID: hJzRT15LSKqEfYFpRBPynQ==
X-CSE-MsgGUID: P3nIwDrFSqmbI4B1R725OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80296239"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="80296239"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 11:30:16 -0700
X-CSE-ConnectionGUID: 5rcC3aT2SF6MMUl2C1Wn+Q==
X-CSE-MsgGUID: jgCJGZG5R4KXVTE0wRVUpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="237996035"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 May 2026 11:30:16 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ89t-000000000yx-1Sjk;
	Thu, 21 May 2026 18:30:13 +0000
Date: Fri, 22 May 2026 02:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 kernel/locking/rwsem.c:1651:2: error: call to undeclared function
 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202605220242.7mJigvPC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9d40b257ba08a2ae9a2cb55b34afe1cff4721b18
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/3] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: i386-buildonly-randconfig-002-20260521 (https://download.01.org/0day-ci/archive/20260522/202605220242.7mJigvPC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220242.7mJigvPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220242.7mJigvPC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1651:2: error: call to undeclared function 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1651 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^
   kernel/locking/rwsem.c:1651:2: note: did you mean 'trace_android_vh_rwsem_write_wait_finish'?
   include/trace/hooks/dtask.h:44:1: note: 'trace_android_vh_rwsem_write_wait_finish' declared here
      44 | DECLARE_HOOK(android_vh_rwsem_write_wait_finish,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:605:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     605 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:25:1: note: expanded from here
      25 | trace_android_vh_rwsem_write_wait_finish
         | ^
   kernel/locking/rwsem.c:1662:2: error: call to undeclared function 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1662 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^
   2 errors generated.


vim +/trace_android_vh_rwsem_write_finished +1651 kernel/locking/rwsem.c

  1644	
  1645	/*
  1646	 * release a write lock
  1647	 */
  1648	void up_write(struct rw_semaphore *sem)
  1649	{
  1650		rwsem_release(&sem->dep_map, _RET_IP_);
> 1651		trace_android_vh_rwsem_write_finished(sem);
  1652		__up_write(sem);
  1653	}
  1654	EXPORT_SYMBOL(up_write);
  1655	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
