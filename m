Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76970195
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714435315; cv=none; b=qPRG4e99xjX244jjTkdbxkWLr2zALSahEQrRpWJCxi/S++iLaDiiYk0wCob8UNKlADtvRyhsyvOkv18CsG+UUig2QZUZu2frkGMAPgEcMVzXpp00xecWAOepwsHJp3zH4Fen5ZITTI1kg3UvqEPKSq/oRC6MJEp5abtULnsbwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714435315; c=relaxed/simple;
	bh=seAOCUgY1mY4wPnFcCDsVjjkZ5xgCiglp4GCC+6Flko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRXDfqvD6MpgDdQI8FZV59bfpaWhWEywAiejHsLnHGClu1xMZtALXZkOCMZQnAxbYo7bVbvCz2g835x24NqKxHNva/Z6gkCnsu2mQ8OXr240mCk9/zSPW1ZkVZkf4R5iZdTZ6Tfuheg5NLsw2LzjVqhycrcH7CxPWK3BIKpXN1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKkUZ+KL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKkUZ+KL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714435314; x=1745971314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seAOCUgY1mY4wPnFcCDsVjjkZ5xgCiglp4GCC+6Flko=;
  b=iKkUZ+KL6guaTzihwVSY5VHF4doJx8y1qaC3D6PuQWGaBDcpFuJSqURH
   S1YcKeuhe8Da67ZfPhE92XbI3dnms7aDzCh8PM2veBQSjafixEQgjuF4I
   HVcZBu+9eBnTjJKU3aYqA4GVgR2OW5JYjeuSCSA+EFI3YMFzAyQOgDS7F
   e5/3WO0owGNuy0LrWuKFwPTpLzrn0pW8ipDhOK3xXnytrbDYLKmgKJAcO
   PSU8Rv0dcx98YOGJQvZ/VLNHLpBVpIqW1l/BadAqcODy9JMIfFNwJz061
   cggQ9EgIGFhF+qr3vT+h7skcPG7sjiHASYxxtY5gqkstDxO7J3xL2G6wl
   Q==;
X-CSE-ConnectionGUID: WAI6sSozRPCqMBXJJligCQ==
X-CSE-MsgGUID: YGJN/PIzSeyaBOYjfuY1AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9950928"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="9950928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:01:42 -0700
X-CSE-ConnectionGUID: Uk7eDBizRIS3W6I5EyAw3A==
X-CSE-MsgGUID: D216KeWrRV+ruLBZCZBWkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30743824"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2024 17:01:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1awE-0007XY-1f;
	Tue, 30 Apr 2024 00:01:38 +0000
Date: Tue, 30 Apr 2024 08:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4 29/51] include/linux/dynamic_debug.h:149:37:
 error: use of undeclared identifier 'num_descs'
Message-ID: <202404300711.jrd863kI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4
head:   f1c64c4dbbe66a7e523d8b2d545e4727ba2103ba
commit: 3fff32e8e9eed3fb002a4c40fa24ece10ec52e44 [29/51] dyndbg: add __counted_by annotations
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240430/202404300711.jrd863kI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300711.jrd863kI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300711.jrd863kI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:30:
>> include/linux/dynamic_debug.h:149:37: error: use of undeclared identifier 'num_descs'
     149 |         struct _ddebug *descs __counted_by(num_descs);
         |                                            ^
>> include/linux/dynamic_debug.h:150:48: error: use of undeclared identifier 'num_classes'
     150 |         struct ddebug_class_map *classes __counted_by(num_classes);
         |                                                       ^
>> include/linux/dynamic_debug.h:151:53: error: use of undeclared identifier 'num_class_users'
     151 |         struct ddebug_class_user *class_users __counted_by(num_class_users);
         |                                                            ^
   1 warning and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/num_descs +149 include/linux/dynamic_debug.h

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
 > 150		struct ddebug_class_map *classes __counted_by(num_classes);
 > 151		struct ddebug_class_user *class_users __counted_by(num_class_users);
   152		unsigned int num_descs;
   153		unsigned int num_classes;
   154		unsigned int num_class_users;
   155	};
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
