Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485BB2CCBE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715407373; cv=none; b=QhO6fL9j15enr6driB9GnpeFK3RR5jiP4SB6U1MetvFQagNAtmxvZcctwKLWjcXfHivr7lCafRWo5/M2bihiO55CjDx/7yZYneK2ety43lIvvxf7cAHfC9FRtYfzaE1/VWoR/lz19dJKrOmguanSKg51kM7zOnJCMjBvwyi3HaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715407373; c=relaxed/simple;
	bh=4vL7RbyOXf9fAbj4nVVYvb4W578g0cYttPbpB1l/6ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKgl0WmOynggd/wQPpNgzvXfE62qKPVAPPDi88f2VEMEt8r2vSuu4HMyKo88bc8Fu4dvHLNc+Ajyp1VMVwNh9U77mmFDYJr89Ar90NXd1maATm3iNr1LeTnN3+goOA2dkudQXTZkmQeez+9EQf954QfDzCZT/qay/0xvLiHtmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/WM7CND; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/WM7CND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715407371; x=1746943371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vL7RbyOXf9fAbj4nVVYvb4W578g0cYttPbpB1l/6ts=;
  b=N/WM7CNDiFPV9TQ8NxUMWSvdZOvngzN4V7qR8Mj/Xu2piolRFN87cPsM
   h6w2OJHWpuoKFcODpyueQ/v0FeyvGQ9Y/Ky4pP0kuWqZGdbJ4Rn9nM4yo
   nW9XqRmH4uMSTNIP0bRhFkz1Pf5lT/vdnfpI0szMe9kCxXI60+Spj3REP
   B+fBzKD+fukGSreFUrzDCxMQN+qOleuHPjFssnGV+lQONSQhJ5NgSVOXZ
   Spt+jMkn8V/JIIY/4MOvxWK7h403zhwv30Zwr/Mg+SAyS5RZIG5VEuI/H
   SqDgSu0FotsBUUjzu+3/Zrj3JJzTn+3QO4BwUaxRnz9imKyo8tCc0RnAs
   g==;
X-CSE-ConnectionGUID: ucaxd4DBQIaGCWs5h+Ujvg==
X-CSE-MsgGUID: 5kiqA6t+R36s0NYLPyvS+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22815103"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="22815103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 23:02:51 -0700
X-CSE-ConnectionGUID: lNeA1R1oR7e0j6v93Cm0Kg==
X-CSE-MsgGUID: N2KBqp3VRsK1d1ivsSAzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="61007823"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2024 23:02:49 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5fok-00070f-2g;
	Sat, 11 May 2024 06:02:46 +0000
Date: Sat, 11 May 2024 14:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, laokz <laokz@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7640/9508] kernel/livepatch/core.c:216:13:
 warning: no previous prototype for 'arch_klp_skip_resolve'
Message-ID: <202405111327.wFY69R0L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0238904492b29dfc7715e7783eff8011b916ddac
commit: b8f3220637be1736c165c289c634f27841ac4e01 [7640/9508] livepatch: add arch hook before doing klp_resolve_symbols
config: x86_64-randconfig-013-20240511 (https://download.01.org/0day-ci/archive/20240511/202405111327.wFY69R0L-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111327.wFY69R0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111327.wFY69R0L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:97:12: warning: no previous prototype for 'arch_klp_init_func' [-Wmissing-prototypes]
      97 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:216:13: warning: no previous prototype for 'arch_klp_skip_resolve' [-Wmissing-prototypes]
     216 | bool __weak arch_klp_skip_resolve(unsigned int type)
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:1767:12: warning: no previous prototype for 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1767 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2022:14: warning: no previous prototype for 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    2022 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2027:13: warning: no previous prototype for 'arch_klp_mem_free' [-Wmissing-prototypes]
    2027 | void __weak arch_klp_mem_free(void *mem)
         |             ^~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2063:13: warning: no previous prototype for 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2063 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/arch_klp_skip_resolve +216 kernel/livepatch/core.c

    96	
  > 97	int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
    98	{
    99		return 0;
   100	}
   101	#endif /* CONFIG_LIVEPATCH_FTRACE */
   102	
   103	static bool klp_initialized(void)
   104	{
   105		return !!klp_root_kobj;
   106	}
   107	
   108	#ifdef CONFIG_LIVEPATCH_FTRACE
   109	static struct klp_func *klp_find_func(struct klp_object *obj,
   110					      struct klp_func *old_func)
   111	{
   112		struct klp_func *func;
   113	
   114		klp_for_each_func(obj, func) {
   115			if ((strcmp(old_func->old_name, func->old_name) == 0) &&
   116			    (old_func->old_sympos == func->old_sympos)) {
   117				return func;
   118			}
   119		}
   120	
   121		return NULL;
   122	}
   123	
   124	static struct klp_object *klp_find_object(struct klp_patch *patch,
   125						  struct klp_object *old_obj)
   126	{
   127		struct klp_object *obj;
   128	
   129		klp_for_each_object(patch, obj) {
   130			if (klp_is_module(old_obj)) {
   131				if (klp_is_module(obj) &&
   132				    strcmp(old_obj->name, obj->name) == 0) {
   133					return obj;
   134				}
   135			} else if (!klp_is_module(obj)) {
   136				return obj;
   137			}
   138		}
   139	
   140		return NULL;
   141	}
   142	#endif /* CONFIG_LIVEPATCH_FTRACE */
   143	
   144	struct klp_find_arg {
   145		const char *name;
   146		unsigned long addr;
   147		unsigned long count;
   148		unsigned long pos;
   149	};
   150	
   151	static int klp_match_callback(void *data, unsigned long addr)
   152	{
   153		struct klp_find_arg *args = data;
   154	
   155		args->addr = addr;
   156		args->count++;
   157	
   158		/*
   159		 * Finish the search when the symbol is found for the desired position
   160		 * or the position is not defined for a non-unique symbol.
   161		 */
   162		if ((args->pos && (args->count == args->pos)) ||
   163		    (!args->pos && (args->count > 1)))
   164			return 1;
   165	
   166		return 0;
   167	}
   168	
   169	static int klp_find_callback(void *data, const char *name, unsigned long addr)
   170	{
   171		struct klp_find_arg *args = data;
   172	
   173		if (strcmp(args->name, name))
   174			return 0;
   175	
   176		return klp_match_callback(data, addr);
   177	}
   178	
   179	static int klp_find_object_symbol(const char *objname, const char *name,
   180					  unsigned long sympos, unsigned long *addr)
   181	{
   182		struct klp_find_arg args = {
   183			.name = name,
   184			.addr = 0,
   185			.count = 0,
   186			.pos = sympos,
   187		};
   188	
   189		if (objname)
   190			module_kallsyms_on_each_symbol(objname, klp_find_callback, &args);
   191		else
   192			kallsyms_on_each_match_symbol(klp_match_callback, name, &args);
   193	
   194		/*
   195		 * Ensure an address was found. If sympos is 0, ensure symbol is unique;
   196		 * otherwise ensure the symbol position count matches sympos.
   197		 */
   198		if (args.addr == 0)
   199			pr_err("symbol '%s' not found in symbol table\n", name);
   200		else if (args.count > 1 && sympos == 0) {
   201			pr_err("unresolvable ambiguity for symbol '%s' in object '%s'\n",
   202			       name, objname);
   203		} else if (sympos != args.count && sympos > 0) {
   204			pr_err("symbol position %lu for symbol '%s' in object '%s' not found\n",
   205			       sympos, name, objname ? objname : "vmlinux");
   206		} else {
   207			*addr = args.addr;
   208			return 0;
   209		}
   210	
   211		*addr = 0;
   212		return -EINVAL;
   213	}
   214	
   215	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
 > 216	bool __weak arch_klp_skip_resolve(unsigned int type)
   217	{
   218		return false;
   219	}
   220	#endif
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
