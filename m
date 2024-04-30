Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7A8BF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 04:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714452133; cv=none; b=S98wKPZZfXMBXC9SOwYrUDO0fvalkn0xV2zn5Xx5Y9rvUgu7290B0m+LKsXbcGZUBARxcl+rEDFAzUGvRIq7vqn4rgVoOE0xHGoAua1u4emv4mk9n/Qp9wUGCrZCLTqdBbjFLlyFEtxA3Ul/i2ebJCx0p8loDXKDUgn7YZzUO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714452133; c=relaxed/simple;
	bh=5lZxS+jsu+J8aIexqp1Gug9/myrGs7GGdBwg2lm87FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G/l5123ZAf2zqn+cPceFPrZY0mPotxPus7e0bKVs5kRLt5FRB/pohzF5mmi/hthl0JFPa2jKZwmcUKTeBRZxizhZOGSOr4jmRKej9sXgyCOdzoTcJ2dUsAEw5zj+Xz4KT8LurnwsTb+5MMLa5UJsXJ0WsSMOGPzjE+S7+djB72s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km7CJ8GZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km7CJ8GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714452131; x=1745988131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5lZxS+jsu+J8aIexqp1Gug9/myrGs7GGdBwg2lm87FI=;
  b=Km7CJ8GZT9ApFpcHBieaBF2sMLGnkOCkC8Vjge3KwKBLQWL8bUxUS/9w
   do6zuhilUxAXfiEUuYfy1wZmBpldBlw5S+XhroZq5colB26rUSALCVE6U
   MlsJ5Xs94TPzmT2OtfEtD7f9QFnbh2W8l8YB4uSsNpCX8D/XlJHvucdsP
   Pl+YKr5A6F/ShndV2OXFfnchOlcHmlY2TzHCmN9RzHGf2A+JsFLu9nEVJ
   HMR05JwRoNV3WOQujR/7HSIiEBoHNKzzCPMrB0LxRwmi6VXzg8kUYo0Vk
   Mzbzr+sVrrGoSAGn6nm49+VbTm58dTguzqR6HFULcN9Ub70dT9PJeocsy
   g==;
X-CSE-ConnectionGUID: uRsN2CjBTSmquz0GgsFwog==
X-CSE-MsgGUID: XJx+oBreT6uUpMl2SaRRqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="32642692"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="32642692"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 21:42:11 -0700
X-CSE-ConnectionGUID: ZGMf3A/WTlanj/ODZZyTGQ==
X-CSE-MsgGUID: lNSHqcGbSCmVp2GfxIkkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31031699"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2024 21:42:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1fJf-0007jk-1T;
	Tue, 30 Apr 2024 04:42:07 +0000
Date: Tue, 30 Apr 2024 12:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4 29/51] include/linux/dynamic_debug.h:149:18:
 error: 'counted_by' only applies to C99 flexible array members
Message-ID: <202404301225.iW4Ubqr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4
head:   604c400edd06faf460a3bbbdd030d31d954cfa60
commit: 3fff32e8e9eed3fb002a4c40fa24ece10ec52e44 [29/51] dyndbg: add __counted_by annotations
config: i386-buildonly-randconfig-002-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301225.iW4Ubqr5-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301225.iW4Ubqr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301225.iW4Ubqr5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:30:
>> include/linux/dynamic_debug.h:149:18: error: 'counted_by' only applies to C99 flexible array members
     149 |         struct _ddebug *descs __counted_by(num_descs);
         |                         ^~~~~
   include/linux/dynamic_debug.h:150:27: error: 'counted_by' only applies to C99 flexible array members
     150 |         struct ddebug_class_map *classes __counted_by(num_classes);
         |                                  ^~~~~~~
   include/linux/dynamic_debug.h:151:28: error: 'counted_by' only applies to C99 flexible array members
     151 |         struct ddebug_class_user *class_users __counted_by(num_class_users);
         |                                   ^~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:


vim +/counted_by +149 include/linux/dynamic_debug.h

   128	
   129	/**
   130	 * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
   131	 * @_var: name of the exported classmap var
   132	 *
   133	 * This registers a module's use of another module's classmap defn, so
   134	 * dyndbg can authorize "class DRM_CORE ..." >control commands upon
   135	 * this module.
   136	 */
   137	#define DYNDBG_CLASSMAP_USE(_var)					\
   138		DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
   139	#define DYNDBG_CLASSMAP_USE_(_var, _uname)				\
   140		extern struct ddebug_class_map _var;				\
   141		static struct ddebug_class_user __aligned(8) __used		\
   142		__section("__dyndbg_class_users") _uname = {			\
   143			.user_mod_name = KBUILD_MODNAME,			\
   144			.map = &(_var),						\
   145		}
   146	
   147	/* encapsulate linker provided built-in (or module) dyndbg data */
   148	struct _ddebug_info {
 > 149		struct _ddebug *descs __counted_by(num_descs);
   150		struct ddebug_class_map *classes __counted_by(num_classes);
   151		struct ddebug_class_user *class_users __counted_by(num_class_users);
   152		unsigned int num_descs;
   153		unsigned int num_classes;
   154		unsigned int num_class_users;
   155	};
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
