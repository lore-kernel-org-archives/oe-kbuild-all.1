Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A313E51D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979798; cv=none; b=OqfpzoX2rSqJhXjN1c7G9Dx4rrrDn4hpbYtCoe0eEEA/Yhl5q1yqUWqIcYiXt24SodBGCiTcjPHOfQkz/u2jkwQC7FvOz0uCGh+fc1RSkN2VIja9qALlnGS7x8lf5nwSFIGKKMc2tU1eNCZ660zNKLCk7aTDFrntXF4bhkcpSWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979798; c=relaxed/simple;
	bh=/3Klw+8yV97MyRX8osWDf49wRcWD6kuw/JmpmaNP4/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TLoNOj0yWxQmA3YERV7hsevlKtkh3l3J9jrACdL4ae6WEJy2uI3pSWtHcp3o3QEhCH8XJLS9RVDy0B2l1wJe0zBrfTZO3XctaQWUcw3+ECniiIKty1NK9d1rLhp3MKDKb48SCEwMBK/2AeIkZ03r6BnvyXVWwdtqVNiKE/Da9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtNbSfHm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtNbSfHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979795; x=1806515795;
  h=date:from:to:cc:subject:message-id;
  bh=/3Klw+8yV97MyRX8osWDf49wRcWD6kuw/JmpmaNP4/o=;
  b=FtNbSfHmtRt8Lvqq0+WH5iw0knNfL++lsBzHZF6Z6ovtAeuTZkXjdl6b
   KJ/zsqlJVVKjhAUA6EykLmQMVRIXbfu4sMuu1GApG0cDGZ2vCTOoH/j43
   WX4ar+AbZR+aKrdngfhLPyDjJl6r8+/sOcvQqr13XoLyn1Rw5v88oQ6In
   D+qgKWdL08NAByhMBr8t9rkrOp73AQGBgju2Xg73QoyJSYPxTcjvSxu+i
   wPLiTMKOKlxkIMuSRxKOqeJufWf3hptVReRp2AcwJOp1iWNOlcvUL2L1k
   HDHv8ex8bBMAroRR828oP4/hnTk4ngDgriJ6B1A8xToZZSaySNm43dKhI
   Q==;
X-CSE-ConnectionGUID: 9IlmzWw9RyeAndYFXFbIhA==
X-CSE-MsgGUID: ia4RiOnzRvSrAxn1S8EmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101456538"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101456538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:34 -0700
X-CSE-ConnectionGUID: L/0cxBURRg++uIKJhGoMew==
X-CSE-MsgGUID: SFS0AKCfRb2dPhK5z+EA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223556779"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000467-3l0w;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 01 Apr 2026 01:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 0/2]
 include/linux/cgroup-defs.h:588:2: error: static assertion failed due to
 requirement 'sizeof(struct cgroup_root::(unnamed at
 include/linux/cgroup-defs.h:588:2)) <= sizeof(struct cgroup_root::(unnamed at
 include/linux/cgroup-defs.h:588:2))': include/linux/...
Message-ID: <202604010155.376jL6aG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   b88544447db55fc1ebf4cdba28b8d56c98ebe095
commit: d66e9166bfa175691dd2d0ad7f65c9fec54aa520 [0/2] ANDROID: fix ABI-break in struct cgroup_root
config: x86_64-randconfig-011-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010155.376jL6aG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010155.376jL6aG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010155.376jL6aG-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:33:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2238:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:29:
>> include/linux/cgroup-defs.h:588:2: error: static assertion failed due to requirement 'sizeof(struct cgroup_root::(unnamed at include/linux/cgroup-defs.h:588:2)) <= sizeof(struct cgroup_root::(unnamed at include/linux/cgroup-defs.h:588:2))': include/linux/cgroup-defs.h:589: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     589 |                                    struct rcu_head rcu);
         |                                    ~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:2: note: expanded from macro 'ANDROID_BACKPORT_USE_ARRAY'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:43:18: note: expanded from macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:2: note: expression evaluates to '16 <= 0'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     589 |                                    struct rcu_head rcu);
         |                                    ~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:2: note: expanded from macro 'ANDROID_BACKPORT_USE_ARRAY'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:43:40: note: expanded from macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2570567928
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1266: prepare0] Error 2 shuffle=2570567928
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:252: __sub-make] Error 2 shuffle=2570567928
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:252: __sub-make] Error 2 shuffle=2570567928
   make: Target 'prepare' not remade because of errors.


vim +588 include/linux/cgroup-defs.h

   548	
   549	/*
   550	 * A cgroup_root represents the root of a cgroup hierarchy, and may be
   551	 * associated with a kernfs_root to form an active hierarchy.  This is
   552	 * internal to cgroup core.  Don't access directly from controllers.
   553	 */
   554	struct cgroup_root {
   555		struct kernfs_root *kf_root;
   556	
   557		/* The bitmask of subsystems attached to this hierarchy */
   558		unsigned int subsys_mask;
   559	
   560		/* Unique id for this hierarchy. */
   561		int hierarchy_id;
   562	
   563		/*
   564		 * The root cgroup. The containing cgroup_root will be destroyed on its
   565		 * release. cgrp->ancestors[0] will be used overflowing into the
   566		 * following field. cgrp_ancestor_storage must immediately follow.
   567		 */
   568		struct cgroup cgrp;
   569	
   570		/* must follow cgrp for cgrp->ancestors[0], see above */
   571		struct cgroup *cgrp_ancestor_storage;
   572	
   573		/* Number of cgroups in the hierarchy, used only for /proc/cgroups */
   574		atomic_t nr_cgrps;
   575	
   576		/* A list running through the active hierarchies */
   577		struct list_head root_list;
   578	
   579		/* Hierarchy-specific flags */
   580		unsigned int flags;
   581	
   582		/* The path to use for release notifications. */
   583		char release_agent_path[PATH_MAX];
   584	
   585		/* The name for this hierarchy - may be empty */
   586		char name[MAX_CGROUP_ROOT_NAMELEN];
   587	
 > 588		ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
   589					   struct rcu_head rcu);
   590	};
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
