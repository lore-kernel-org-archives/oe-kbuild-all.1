Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37C27FD5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760689411; cv=none; b=bPC5uhaiCFn+BBiyp4wqhRpd9ooRw5AXeMmLefxoUxLG6j9lBjdBtp8278UDCrdwqm12Yy9hGoJzI+/dv9PsGoh2uJA4se9Qu92QYh1KDX9AiJ7J+26TvglIEuGyr9hsra6yI59eyJmbN4o0koOHJQjJ4Vlq2s0o0W0y43Xf3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760689411; c=relaxed/simple;
	bh=x/+ZgNJs8ZbZ1h/BrADrk6qU1Xod8caPvkoaUnD7KKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/5+djjPPpe5UZSgFYVl5VISkoSr2KZBPw6jmBUSz98W/YX+D3wxy6MrXZ/4Sj2MRzowKpIIvFU9ZEcGizhYEf+NVRrejN2kpzY/C/ScX8MJFRDYEktDanQ+krWq8RXe3SsP53bIydRIykvTRQiHTm0YzkXZqWMh7CFuu4lON5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zh9oD24v; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zh9oD24v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760689409; x=1792225409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/+ZgNJs8ZbZ1h/BrADrk6qU1Xod8caPvkoaUnD7KKk=;
  b=Zh9oD24vABgp4ssc6EQb5b8a7DZ7B1a/HqfCGcjJqmgbvJ2ILDrCg5VE
   worlfkxTXjUM9eyp6E8rzxcdJpuUdqfb5h0oX2HZ4e5Skyn8I+jkGtpVh
   3ihD4SkQwGIPxg3dwZAOK/2RQOQkm2a6CaRTt7av583s4W/iVphRwfqvl
   A0qDSAlUFOYVzj93AfFJdWb5xBd2dXoIZWnoYxegTsVBk3WF0wgVxfkD2
   jW+BXjZ2i/g5oeURNpHZTjYtxicvN+mmMy9FIWF+B1gVe2z/LDwBJSByh
   Wi7The042ZHGy0wZGIT42g0K+b7ZJmk+f/cRO2RyksMAXY+V7iWPweK/5
   Q==;
X-CSE-ConnectionGUID: c2MkHESGSymsxoMPq9rgVA==
X-CSE-MsgGUID: ZNSg0UZHRWm/B3oc9EpZ0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50463582"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="50463582"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 01:23:28 -0700
X-CSE-ConnectionGUID: VXgLVNF7Td6gu68Sdk0cbw==
X-CSE-MsgGUID: Z7CXvUzZRCyAaxoLeRyrNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182231202"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Oct 2025 01:23:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9fkC-0005kh-1L;
	Fri, 17 Oct 2025 08:23:24 +0000
Date: Fri, 17 Oct 2025 16:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-6.17 27/38]
 include/linux/dynamic_debug.h:209:52: error: expected ')' before '(' token
Message-ID: <202510171606.QvurgfUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-6.17
head:   36a2d67a6a00aa0b4e498e871326b3224207e569
commit: a1cb7cf5327448a6a51394e613a4bd7dd4985f3b [27/38] no-side-h-check
config: parisc-randconfig-002-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171606.QvurgfUJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171606.QvurgfUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171606.QvurgfUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:623,
                    from include/linux/kernel.h:31,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/test_dynamic_debug.c:30:
>> include/linux/dynamic_debug.h:209:52: error: expected ')' before '(' token
     __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base)); \
                                                       ^
   include/linux/dynamic_debug.h:188:30: note: in definition of macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     __no_side_effects(_clnames, _base)    \
                                 ^~~~~
   lib/test_dynamic_debug.c:108:1: note: in expansion of macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
    DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:209:52: error: expected ')' before '(' token
     __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base)); \
                                                       ^
   include/linux/dynamic_debug.h:188:30: note: in definition of macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     __no_side_effects(_clnames, _base)    \
                                 ^~~~~
   lib/test_dynamic_debug.c:121:1: note: in expansion of macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
    DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +209 include/linux/dynamic_debug.h

b9400852c0801a Jim Cromie  2022-09-04  133  
7ce93729091dff Jason Baron 2023-03-10  134  /*
7ce93729091dff Jason Baron 2023-03-10  135   * pr_debug() and friends are globally enabled or modules have selectively
7ce93729091dff Jason Baron 2023-03-10  136   * enabled them.
7ce93729091dff Jason Baron 2023-03-10  137   */
7ce93729091dff Jason Baron 2023-03-10  138  #if defined(CONFIG_DYNAMIC_DEBUG) || \
7ce93729091dff Jason Baron 2023-03-10  139  	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
a2d375eda771a6 Jim Cromie  2020-08-31  140  
d28e3ef3e2d17d Jim Cromie  2022-12-21  141  /*
d28e3ef3e2d17d Jim Cromie  2022-12-21  142   * dyndbg classmaps aims at the common kernel debug-print design pattern is:
d28e3ef3e2d17d Jim Cromie  2022-12-21  143   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  144   *  1. run-time control via sysfs node (api/abi)
d28e3ef3e2d17d Jim Cromie  2022-12-21  145   *  2. each bit 0..N controls a single "kind" of debug-message
d28e3ef3e2d17d Jim Cromie  2022-12-21  146   *  3. a message can have only 1 "kind", not several properties.
d28e3ef3e2d17d Jim Cromie  2022-12-21  147   *  4. "kind" is a compile-time constant: 0..N or BIT() thereof
d28e3ef3e2d17d Jim Cromie  2022-12-21  148   *  5. macro impls - give compile-time resolution or fail.
d28e3ef3e2d17d Jim Cromie  2022-12-21  149   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  150   * dyndbg classmaps design axioms/constraints:
d28e3ef3e2d17d Jim Cromie  2022-12-21  151   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  152   *  . optimizing compilers use 1-5 above "magically" so preserve them
d28e3ef3e2d17d Jim Cromie  2022-12-21  153   *  . classmaps.class_id is the "kind", the category.
d28e3ef3e2d17d Jim Cromie  2022-12-21  154   *  . classmap users are modules
d28e3ef3e2d17d Jim Cromie  2022-12-21  155   *  . every user wants 0..N
d28e3ef3e2d17d Jim Cromie  2022-12-21  156   *  . 0..N exposes as ABI
d28e3ef3e2d17d Jim Cromie  2022-12-21  157   *  . assigning non-conflicting ranges across everything is madness
d28e3ef3e2d17d Jim Cromie  2022-12-21  158   *  . no 1 use-case wants N > 32, 16 is more usable
d28e3ef3e2d17d Jim Cromie  2022-12-21  159   *  . N <= 64 in *all* cases
d28e3ef3e2d17d Jim Cromie  2022-12-21  160   *  . modules/subsystems make "kind" decisions
d28e3ef3e2d17d Jim Cromie  2022-12-21  161   *  . "kind" is often an enum: DRM has DRM_UT_CORE..DRM_UT_DRMRES
d28e3ef3e2d17d Jim Cromie  2022-12-21  162   *  . some "kinds" are BIT(N) & sysfs_val
d28e3ef3e2d17d Jim Cromie  2022-12-21  163   *  . making modules change their numbering is bogus, avoid if possible
d28e3ef3e2d17d Jim Cromie  2022-12-21  164   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  165   * We can solve for all these at once:
d28e3ef3e2d17d Jim Cromie  2022-12-21  166   *  A: map class-names to .class_id ranges at compile-time
d28e3ef3e2d17d Jim Cromie  2022-12-21  167   *  B: allow only "class NAME" changes to class'd callsites at run-time
d28e3ef3e2d17d Jim Cromie  2022-12-21  168   *  C: users must manage 0..62 hardcoded .class_id range limit.
d28e3ef3e2d17d Jim Cromie  2022-12-21  169   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  170   * By mapping class-names at >control to class-ids underneath, and
d28e3ef3e2d17d Jim Cromie  2022-12-21  171   * responding only to class-names DEFINEd or USEd by the module, we
d28e3ef3e2d17d Jim Cromie  2022-12-21  172   * can private-ize the class-id, and adjust class'd pr_debugs only by
d28e3ef3e2d17d Jim Cromie  2022-12-21  173   * their names.
d28e3ef3e2d17d Jim Cromie  2022-12-21  174   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  175   * This give us:
d28e3ef3e2d17d Jim Cromie  2022-12-21  176   *  D: class_ids without classnames are unreachable
d28e3ef3e2d17d Jim Cromie  2022-12-21  177   *  E: user modules opt-in by DEFINEing a classmap and/or USEing another
d28e3ef3e2d17d Jim Cromie  2022-12-21  178   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  179   * Multi-classmap modules/groups are supported, if the classmaps share
d28e3ef3e2d17d Jim Cromie  2022-12-21  180   * the class_id space [0..62] without overlap/conflict.
d28e3ef3e2d17d Jim Cromie  2022-12-21  181   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  182   * NOTE: Due to the integer class_id, this api cannot disallow these:
d28e3ef3e2d17d Jim Cromie  2022-12-21  183   * __pr_debug_cls(0, "fake CORE msg");  works only if a classmap maps 0.
d28e3ef3e2d17d Jim Cromie  2022-12-21  184   * __pr_debug_cls(22, "no such class"); compiles but is not reachable
d28e3ef3e2d17d Jim Cromie  2022-12-21  185   */
d28e3ef3e2d17d Jim Cromie  2022-12-21  186  
b9500e25165c5a Jim Cromie  2024-09-18  187  #define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
a1cb7cf5327448 Jim Cromie  2025-10-16  188  	__no_side_effects(_clnames, _base)				\
b9500e25165c5a Jim Cromie  2024-09-18  189  	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
b9500e25165c5a Jim Cromie  2024-09-18  190  		      "_base must be in 0..62");			\
b9500e25165c5a Jim Cromie  2024-09-18  191  	static_assert(ARRAY_SIZE(_clnames) > 0,				\
b9500e25165c5a Jim Cromie  2024-09-18  192  		      "classnames array size must be > 0");		\
b9500e25165c5a Jim Cromie  2024-09-18  193  	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
b9500e25165c5a Jim Cromie  2024-09-18  194  		      "_base + classnames.length exceeds range")
b9500e25165c5a Jim Cromie  2024-09-18  195  
4d716090995948 Jim Cromie  2025-09-11  196  /**
d28e3ef3e2d17d Jim Cromie  2022-12-21  197   * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
d28e3ef3e2d17d Jim Cromie  2022-12-21  198   * @_var:   name of the classmap, exported for other modules coordinated use.
d28e3ef3e2d17d Jim Cromie  2022-12-21  199   * @_mapty: enum ddebug_class_map_type: 0:DISJOINT - independent, 1:LEVEL - v2>v1
d28e3ef3e2d17d Jim Cromie  2022-12-21  200   * @_base:  reserve N classids starting at _base, to split 0..62 classid space
d28e3ef3e2d17d Jim Cromie  2022-12-21  201   * @classes: names of the N classes.
d28e3ef3e2d17d Jim Cromie  2022-12-21  202   *
d28e3ef3e2d17d Jim Cromie  2022-12-21  203   * This tells dyndbg what class_ids the module is using: _base..+N, by
d28e3ef3e2d17d Jim Cromie  2022-12-21  204   * mapping names onto them.  This qualifies "class NAME" >controls on
d28e3ef3e2d17d Jim Cromie  2022-12-21  205   * the defining module, ignoring unknown names.
d28e3ef3e2d17d Jim Cromie  2022-12-21  206   */
d28e3ef3e2d17d Jim Cromie  2022-12-21  207  #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
d28e3ef3e2d17d Jim Cromie  2022-12-21  208  	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
b9500e25165c5a Jim Cromie  2024-09-18 @209  	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
d28e3ef3e2d17d Jim Cromie  2022-12-21  210  	extern struct _ddebug_class_map _var;				\
d28e3ef3e2d17d Jim Cromie  2022-12-21  211  	struct _ddebug_class_map __aligned(8) __used			\
d28e3ef3e2d17d Jim Cromie  2022-12-21  212  		__section("__dyndbg_class_maps") _var = {		\
d28e3ef3e2d17d Jim Cromie  2022-12-21  213  		.mod = THIS_MODULE,					\
d28e3ef3e2d17d Jim Cromie  2022-12-21  214  		.mod_name = KBUILD_MODNAME,				\
d28e3ef3e2d17d Jim Cromie  2022-12-21  215  		.base = (_base),					\
d28e3ef3e2d17d Jim Cromie  2022-12-21  216  		.map_type = (_mapty),					\
d28e3ef3e2d17d Jim Cromie  2022-12-21  217  		.length = ARRAY_SIZE(_var##_classnames),		\
d28e3ef3e2d17d Jim Cromie  2022-12-21  218  		.class_names = _var##_classnames,			\
d28e3ef3e2d17d Jim Cromie  2022-12-21  219  	};								\
d28e3ef3e2d17d Jim Cromie  2022-12-21  220  	EXPORT_SYMBOL(_var)
d28e3ef3e2d17d Jim Cromie  2022-12-21  221  

:::::: The code at line 209 was first introduced by commit
:::::: b9500e25165c5ae766ee8b2b496f9f983e90eafb dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
