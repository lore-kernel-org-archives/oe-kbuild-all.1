Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3981E156CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732949625; cv=none; b=fX88nKn9F2ofglsLSZ+gskr281XtuVd7un5owSfNOde2yGh2NtIcPUv9ET3eT+LSn1A1CqdRj9r8FIVu8BpwrWwG0Fx7BCbJ2agdKcREYk8Fdo3YyJDYUHrUkeEHH2hNvMTUdR8zfj88abzImLk8T1a4zy0NuawGR/pf0VtTFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732949625; c=relaxed/simple;
	bh=xgajP9dMH6lZviRBEJAPAKpBaASLPxNWn52Tnj+gMuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUvOflPXH1pO+k5UA11Uu93flUSlbV44pmZalv6uVHKGySvexuYTts29bl4IEoTBla0MDUae9JrZVKhMhLjDjYs/oNSUv6/zvZsm1JCjmMRIhCc358WoUdEVYEq7QsJgc2Dka0hju4rn/hOfxaT+vdY8Omef+vKvfp8nXZNSVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLmTXM0s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLmTXM0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732949623; x=1764485623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgajP9dMH6lZviRBEJAPAKpBaASLPxNWn52Tnj+gMuM=;
  b=QLmTXM0syHiv3CTNuXnRF8vlBuTM2+q7iVLLM0HC85Uyf0K341bwEEv7
   Rmy+AZ5hzxGXqRwZ+PCB+2Nq7rIZqMRtB2I5i2JVTduhmShxrolNDqUUE
   2xK0mODdydfFlowBpy4qOZhOj6KZJr7P16dyF9aWcWvDKp2KP/kuVoy+s
   ByKPZWFtdgtT51fRInFQ7B0qAyJ18htIelBr54uzQaYwxvdnLvADIrW/c
   Gb/VrPKUPolGxZEE5NypgzSab/pXzQr4EyutXUxU+MXBh1R/W5bopq2Ov
   /uWsSdmj1Wol/aunZgzh7tfjNifSTOBpAYaY8UKiYTsM1pRIxwJXLl1gC
   w==;
X-CSE-ConnectionGUID: iKtrgZCFRjueQZ1jmb5+6Q==
X-CSE-MsgGUID: fsWRnaDpSRK9bumuYEMBmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="20758291"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="20758291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 22:53:42 -0800
X-CSE-ConnectionGUID: 6CvPldLXTPyK7sTkupWdsg==
X-CSE-MsgGUID: AqzDEAy4Rtmgwmgmbvz2SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97677377"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Nov 2024 22:53:42 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHHMJ-00009P-0I;
	Sat, 30 Nov 2024 06:53:39 +0000
Date: Sat, 30 Nov 2024 14:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4]
 include/linux/cgroup-defs.h:588:2: error: static assertion failed due to
 requirement 'sizeof(struct cgroup_root::(unnamed at
 include/linux/cgroup-defs.h:588:2)) <= sizeof(struct cgroup_root::(unnamed
 at include/linux/cgroup-defs.h:588:2))': include/linux/...
Message-ID: <202411301456.Tpw0TC1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d66e9166bfa175691dd2d0ad7f65c9fec54aa520
commit: d66e9166bfa175691dd2d0ad7f65c9fec54aa520 [4/4] ANDROID: fix ABI-break in struct cgroup_root
config: x86_64-randconfig-122-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301456.Tpw0TC1k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301456.Tpw0TC1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301456.Tpw0TC1k-lkp@intel.com/

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
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1266: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:252: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:252: __sub-make] Error 2
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
