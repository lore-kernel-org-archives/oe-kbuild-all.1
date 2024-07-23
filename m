Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEB2F2A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 04:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721707578; cv=none; b=bWKUqQt6BPNcYKCUzQHKu8sAuRp9YW6wRzUh3ne4xvXOohyTgoaE5G5kyltJZRp2S1QTwFggBeL8USDxNiZPDiZYSf9qgpnDGXZRq0vl49wkrWC66CRMN42fByCOVJJZgQikfjosTSGCMz9n1LBztJ0qEyfmlVfgBsOVwNHYJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721707578; c=relaxed/simple;
	bh=RXKVckbTAvOrPn23ue6armV2DjgwSMlcjOx5SCrLP58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSK998QG9PnD4vFG0tZTJNCb1zrIQHVog/fz9qS4xCrkIw1YPtA3p7Nn3JerERFGQGZg/ZiiyizXRAbBsyUy0BOJtEI78xl9hXZZV9YYWmOxf+wwv0D2g+jEfNBFY9ndjc8Y9hpy6gBt+XdjZBWPZ93weiCzzAzWf0AqAWHdCf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grX2BV/x; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grX2BV/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721707576; x=1753243576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXKVckbTAvOrPn23ue6armV2DjgwSMlcjOx5SCrLP58=;
  b=grX2BV/xLMUCoNuQfbFrVfDGTCfiNV/CtNC4ykuL5N+e7P9DPmRp/fGJ
   Pfp7zreMM5SkQwJIZpHt3q6rVkahDIodvijaeflQP1oo5NODo92O2SNL+
   gOR1+eIK++1xhM1sNy7UGQ45VO3Bg7TaalCDuCSCqTo80yKigIT7AsMOr
   RxsZjzgxwC9x/3h3SHoVjhZ71+MpOTP3WuI2KznTs7IbCPAjguWsuUFGA
   JihlOIdzMyX00n89QT0wBMAJhxHtFOqrx3T6r42+4SNV06psw12Bys6uj
   flxsGPRAeFyKitiFGcwCQH2E1IQPq2xVOD3ZIKQiRBqCHB/Fg0bHlh882
   Q==;
X-CSE-ConnectionGUID: WtzZGYwlQeeETPwHZco4FQ==
X-CSE-MsgGUID: DVD7+OiyQmO/jwaR88lbAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19457999"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19457999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 21:06:15 -0700
X-CSE-ConnectionGUID: txxBmYXGSWC90qJqX4TViQ==
X-CSE-MsgGUID: qAC/M797SOWw5i7Zz1NWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52335645"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2024 21:06:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW6mx-000lcm-20;
	Tue, 23 Jul 2024 04:06:11 +0000
Date: Tue, 23 Jul 2024 12:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4b 15/74] include/linux/dynamic_debug.h:86:56:
 error: '/*' within block comment
Message-ID: <202407231228.2iMJC7uW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4b
head:   b1eb9061e745d7ee49291aa451e0fbdfc325f7bc
commit: 69e3e77dca408ade14290862bf4cc991166d5acd [15/74] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240723/202407231228.2iMJC7uW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231228.2iMJC7uW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231228.2iMJC7uW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/s390/include/asm/timex.h:13:
   In file included from include/linux/preempt.h:79:
   In file included from arch/s390/include/asm/preempt.h:5:
   In file included from arch/s390/include/asm/current.h:13:
   In file included from arch/s390/include/asm/lowcore.h:14:
   In file included from arch/s390/include/asm/ctlreg.h:85:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:570:
>> include/linux/dynamic_debug.h:86:56: error: '/*' within block comment [-Werror,-Wcomment]
      86 |  *   ~5000 calls to them, across all of drivers/gpu/drm/*
         |                                                        ^
   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +86 include/linux/dynamic_debug.h

    82	
    83	/*
    84	 * dyndbg-classmaps is closely modelled on DRM.debug, which has:
    85	 *   ~23 macros, each passing DRM_UT_* as 1st arg
  > 86	 *   ~5000 calls to them, across all of drivers/gpu/drm/*
    87	 *   Optimizing compilers handle this well.
    88	 *
    89	 * So dyndbg maps known classnames to limited (0..62) .classids, and
    90	 * insists classes are selected by name for adjustment.
    91	 *
    92	 * modules either DEFINE classnames, or USE names defined elsewhere
    93	 * (in another module).  This supports classnames defined over subsystems.
    94	 */
    95	/**
    96	 * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
    97	 * @_var:   name of the classmap, exported for other modules coordinated use.
    98	 * @_type:  enum ddebug_class_map_type: DISJOINT - independent, LEVEL - v2>v1
    99	 * @_base:  reserve N classids starting at _base, to split 0..62 classid space
   100	 * @classes: names of the N classes.
   101	 *
   102	 * This tells dyndbg what classids the module is using, by mapping
   103	 * names onto them.  This qualifies "class NAME" >controls on the
   104	 * defining module, ignoring unknown names.
   105	 *
   106	 * The @classes also name the bits 0.. in any CLASSMAP_PARAM referring
   107	 * to the classmap.
   108	 */
   109	#define __DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
   110		const char *_var##_classnames[] = { __VA_ARGS__ };		\
   111		struct ddebug_class_map __aligned(8) __used			\
   112			__section("__dyndbg_classes") _var = {			\
   113			.mod = THIS_MODULE,					\
   114			.mod_name = KBUILD_MODNAME,				\
   115			.base = _base,						\
   116			.map_type = _maptype,					\
   117			.length = ARRAY_SIZE(_var##_classnames),		\
   118			.class_names = _var##_classnames,			\
   119		}
   120	#define DYNDBG_CLASSMAP_DEFINE(_var, ...)		\
   121		__DYNDBG_CLASSMAP_DEFINE(_var, __VA_ARGS__);	\
   122		EXPORT_SYMBOL(_var)
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
