Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA73370ADC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189799; cv=none; b=gK06Pw/xxw9yIRlmFJJ+wVqo65C6v7LX49aV+Kg+YXT2WFHtCnVYb+avwfy+1VighJticYwMoor2kRguSlTD5eJggdnLNX72e4oCeZt5Vjv/bp7h7SbgeBSUMRjejfuAIMC+bRA9qOsNYGk3qMK7ZZ/dB6NBtOuUOGCS6rceHAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189799; c=relaxed/simple;
	bh=+ylG8hAgsPBF/I3RMd1+0SodLJm3IbC+NqkErktpowg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NhkuWWarZmABohQx24om1VLPbuBlIV4gheLcp7Cg+5P5/MJUS6ET+yYbWz0KBHiTwFnsuq5BkXqr14mM0QmHIAucBGhZBMVhjh9Fwu9jWo0JubXQdlcQoX3A+ASnA673Mp2HVroj6uQpjZ5HdT8bbw8ebAWSFjTcDPZjVoLoIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlauE7aj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlauE7aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779189797; x=1810725797;
  h=date:from:to:cc:subject:message-id;
  bh=+ylG8hAgsPBF/I3RMd1+0SodLJm3IbC+NqkErktpowg=;
  b=YlauE7ajBPyTbmnlJHOPqsD3oFYRV69TbqSCis5msVXSb4FvGjnGqqDE
   R2WSTdlY2ckPej4CfA1/sevlpyoGS0XO9d6Z98zUEX7/9BAHp8fFy/sq1
   PMCOZiLENEp6/10h9obvMmZJWHU+wlD6bZxf6Vg3f15xbpSYwPdkb7WDS
   IjfMVf+5fCG6hGXNHi9LKfrN2noQJpg1lYr3DXF7xrFqeqC2g4h8A2zCu
   Dd8f8R1gjKEK++Y0MnGZuAxV09Ky5QiA3ffd7rh8yozuNdSHeFBSVZYhf
   pnE1xrYOJgnsf79DgQIuaaNeemxBqeDe4QfTZS3+cs4zkeJJaRdTYAvqY
   Q==;
X-CSE-ConnectionGUID: j59THlUDSE2XG0CPnrR2CA==
X-CSE-MsgGUID: vzmAiLaSS0C+tqD77/M3cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97498532"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97498532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:23:17 -0700
X-CSE-ConnectionGUID: Wkhx7hROQ1Kqi2oj02blRw==
X-CSE-MsgGUID: KOAN791VRpu/Tou3F/KIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243731994"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 04:23:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPIXZ-00000000AAw-0Rev;
	Tue, 19 May 2026 11:23:13 +0000
Date: Tue, 19 May 2026 13:23:04 +0200
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
Subject: include/linux/lockdep.h:252:54: error: passing argument 1 of
 'lock_is_held' from pointer to non-enclosed address space
Message-ID: <202605191311.BNSLlyBH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/Introducing-pw_lock-and-per-cpu-queue-flush-work/20260519-112741
head:   34ec9156e282639ce48f63546ded35bf6eafbb3a
commit: 34ec9156e282639ce48f63546ded35bf6eafbb3a slub: apply new pw_queue_on() interface
date:   8 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260519/202605191311.BNSLlyBH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191311.BNSLlyBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191311.BNSLlyBH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/slub.c:15:
   mm/slub.c: In function 'sheaf_try_flush_main':
>> include/linux/lockdep.h:252:54: error: passing argument 1 of 'lock_is_held' from pointer to non-enclosed address space
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:14: note: in expansion of macro 'lockdep_assert'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |              ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:29: note: in expansion of macro 'lockdep_is_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                             ^~~~~~~~~~~~~~~
   include/linux/pwlocks.h:58:9: note: in expansion of macro 'lockdep_assert_held'
      58 |         lockdep_assert_held(lock)
         |         ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:2901:17: note: in expansion of macro 'pw_lockdep_assert_held'
    2901 |                 pw_lockdep_assert_held(&s->cpu_sheaves->lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8:
   include/linux/lockdep.h:247:58: note: expected 'const struct lockdep_map *' but argument is of type '__seg_gs struct lockdep_map *'
     247 | static inline int lock_is_held(const struct lockdep_map *lock)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   mm/slub.c: In function '__pcs_replace_empty_main':
>> include/linux/lockdep.h:252:54: error: passing argument 1 of 'lock_is_held' from pointer to non-enclosed address space
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:14: note: in expansion of macro 'lockdep_assert'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |              ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:29: note: in expansion of macro 'lockdep_is_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                             ^~~~~~~~~~~~~~~
   include/linux/pwlocks.h:58:9: note: in expansion of macro 'lockdep_assert_held'
      58 |         lockdep_assert_held(lock)
         |         ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4601:9: note: in expansion of macro 'pw_lockdep_assert_held'
    4601 |         pw_lockdep_assert_held(&s->cpu_sheaves->lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:247:58: note: expected 'const struct lockdep_map *' but argument is of type '__seg_gs struct lockdep_map *'
     247 | static inline int lock_is_held(const struct lockdep_map *lock)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   mm/slub.c: In function '__pcs_install_empty_sheaf':
>> include/linux/lockdep.h:252:54: error: passing argument 1 of 'lock_is_held' from pointer to non-enclosed address space
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:14: note: in expansion of macro 'lockdep_assert'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |              ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:29: note: in expansion of macro 'lockdep_is_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                             ^~~~~~~~~~~~~~~
   include/linux/pwlocks.h:58:9: note: in expansion of macro 'lockdep_assert_held'
      58 |         lockdep_assert_held(lock)
         |         ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:5639:9: note: in expansion of macro 'pw_lockdep_assert_held'
    5639 |         pw_lockdep_assert_held(&s->cpu_sheaves->lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:247:58: note: expected 'const struct lockdep_map *' but argument is of type '__seg_gs struct lockdep_map *'
     247 | static inline int lock_is_held(const struct lockdep_map *lock)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   mm/slub.c: In function '__pcs_replace_full_main':
>> include/linux/lockdep.h:252:54: error: passing argument 1 of 'lock_is_held' from pointer to non-enclosed address space
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:14: note: in expansion of macro 'lockdep_assert'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |              ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:29: note: in expansion of macro 'lockdep_is_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                             ^~~~~~~~~~~~~~~
   include/linux/pwlocks.h:58:9: note: in expansion of macro 'lockdep_assert_held'
      58 |         lockdep_assert_held(lock)
         |         ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:5690:9: note: in expansion of macro 'pw_lockdep_assert_held'
    5690 |         pw_lockdep_assert_held(&s->cpu_sheaves->lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:247:58: note: expected 'const struct lockdep_map *' but argument is of type '__seg_gs struct lockdep_map *'
     247 | static inline int lock_is_held(const struct lockdep_map *lock)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/lock_is_held +252 include/linux/lockdep.h

f607c668577481 Peter Zijlstra 2009-07-20  251  
f8319483f57f1c Peter Zijlstra 2016-11-30 @252  #define lockdep_is_held(lock)		lock_is_held(&(lock)->dep_map)
f8319483f57f1c Peter Zijlstra 2016-11-30  253  #define lockdep_is_held_type(lock, r)	lock_is_held_type(&(lock)->dep_map, (r))
f607c668577481 Peter Zijlstra 2009-07-20  254  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
