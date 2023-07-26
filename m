Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26663CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 06:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690351818; x=1721887818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFN6JSHxzpEsw/5O+L4Dvt+F+MwrgqIotVWYzAFTTO4=;
  b=aUZaIHHmTRvo9IMNOSAcrI2q98YOFSZmDzrb59q2lQCasZO3UtIC6kC5
   sCQp5wClRe3WFmikl3NSel/HS3PtjqA3W4iaN1Mh+bQXp0bOoctkIgN9k
   Y/cCl8zjKu4pa3MlXXOAyBAyAHYAZViWNVb+8rexj7Udx/gNC3r3O4QV4
   5vuIDnci3z5O0Y31BoaC080MbkznmhGwuUUfhAcBu8QoGibiHTKB3mBaC
   A2xI50NIbGpaYzeSWLvQlNUwZF9OZ8icXjo+b0V9TOtopa7SmZkCDKyHU
   cXIZqArjvbhaM58h56KKPF7AqjRli8fu1KlmDTa0tK/DMFk9FFY4U4DeX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="367949437"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="367949437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="703604695"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="703604695"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2023 23:10:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOXiv-0000il-0z;
	Wed, 26 Jul 2023 06:10:13 +0000
Date: Wed, 26 Jul 2023 14:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 528/538]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2479:56: error: 'struct amdgpu_vm_pt'
 has no member named 'bo'
Message-ID: <202307261310.NxefefGX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   f84ffbe78b852c65d06bb9a978f3bc43966a7a6c
commit: 9dc2b8b95584b34e847b687334a49db202c6e6f1 [528/538] drm/amdgpu: fix clearing mappings for BOs that are always valid in VM
config: csky-randconfig-r013-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261310.NxefefGX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261310.NxefefGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261310.NxefefGX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: In function 'amdgpu_vm_bo_clear_mappings':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2479:56: error: 'struct amdgpu_vm_pt' has no member named 'bo'
    2479 |                 if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
         |                                                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2494:56: error: 'struct amdgpu_vm_pt' has no member named 'bo'
    2494 |                 if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
         |                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:34:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     199 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     198 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     197 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~


vim +2479 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

  2387	
  2388	/**
  2389	 * amdgpu_vm_bo_clear_mappings - remove all mappings in a specific range
  2390	 *
  2391	 * @adev: amdgpu_device pointer
  2392	 * @vm: VM structure to use
  2393	 * @saddr: start of the range
  2394	 * @size: size of the range
  2395	 *
  2396	 * Remove all mappings in a range, split them as appropriate.
  2397	 *
  2398	 * Returns:
  2399	 * 0 for success, error for failure.
  2400	 */
  2401	int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
  2402					struct amdgpu_vm *vm,
  2403					uint64_t saddr, uint64_t size)
  2404	{
  2405		struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
  2406		LIST_HEAD(removed);
  2407		uint64_t eaddr;
  2408	
  2409		eaddr = saddr + size - 1;
  2410		saddr /= AMDGPU_GPU_PAGE_SIZE;
  2411		eaddr /= AMDGPU_GPU_PAGE_SIZE;
  2412	
  2413		/* Allocate all the needed memory */
  2414		before = kzalloc(sizeof(*before), GFP_KERNEL);
  2415		if (!before)
  2416			return -ENOMEM;
  2417		INIT_LIST_HEAD(&before->list);
  2418	
  2419		after = kzalloc(sizeof(*after), GFP_KERNEL);
  2420		if (!after) {
  2421			kfree(before);
  2422			return -ENOMEM;
  2423		}
  2424		INIT_LIST_HEAD(&after->list);
  2425	
  2426		/* Now gather all removed mappings */
  2427		tmp = amdgpu_vm_it_iter_first(&vm->va, saddr, eaddr);
  2428		while (tmp) {
  2429			/* Remember mapping split at the start */
  2430			if (tmp->start < saddr) {
  2431				before->start = tmp->start;
  2432				before->last = saddr - 1;
  2433				before->offset = tmp->offset;
  2434				before->flags = tmp->flags;
  2435				before->bo_va = tmp->bo_va;
  2436				list_add(&before->list, &tmp->bo_va->invalids);
  2437			}
  2438	
  2439			/* Remember mapping split at the end */
  2440			if (tmp->last > eaddr) {
  2441				after->start = eaddr + 1;
  2442				after->last = tmp->last;
  2443				after->offset = tmp->offset;
  2444				after->offset += (after->start - tmp->start) << PAGE_SHIFT;
  2445				after->flags = tmp->flags;
  2446				after->bo_va = tmp->bo_va;
  2447				list_add(&after->list, &tmp->bo_va->invalids);
  2448			}
  2449	
  2450			list_del(&tmp->list);
  2451			list_add(&tmp->list, &removed);
  2452	
  2453			tmp = amdgpu_vm_it_iter_next(tmp, saddr, eaddr);
  2454		}
  2455	
  2456		/* And free them up */
  2457		list_for_each_entry_safe(tmp, next, &removed, list) {
  2458			amdgpu_vm_it_remove(tmp, &vm->va);
  2459			list_del(&tmp->list);
  2460	
  2461			if (tmp->start < saddr)
  2462			    tmp->start = saddr;
  2463			if (tmp->last > eaddr)
  2464			    tmp->last = eaddr;
  2465	
  2466			tmp->bo_va = NULL;
  2467			list_add(&tmp->list, &vm->freed);
  2468			trace_amdgpu_vm_bo_unmap(NULL, tmp);
  2469		}
  2470	
  2471		/* Insert partial mapping before the range */
  2472		if (!list_empty(&before->list)) {
  2473			struct amdgpu_bo *bo = before->bo_va->base.bo;
  2474	
  2475			amdgpu_vm_it_insert(before, &vm->va);
  2476			if (before->flags & AMDGPU_PTE_PRT)
  2477				amdgpu_vm_prt_get(adev);
  2478	
> 2479			if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
  2480			    !before->bo_va->base.moved)
  2481				amdgpu_vm_bo_moved(&before->bo_va->base);
  2482		} else {
  2483			kfree(before);
  2484		}
  2485	
  2486		/* Insert partial mapping after the range */
  2487		if (!list_empty(&after->list)) {
  2488			struct amdgpu_bo *bo = after->bo_va->base.bo;
  2489	
  2490			amdgpu_vm_it_insert(after, &vm->va);
  2491			if (after->flags & AMDGPU_PTE_PRT)
  2492				amdgpu_vm_prt_get(adev);
  2493	
  2494			if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
  2495			    !after->bo_va->base.moved)
  2496				amdgpu_vm_bo_moved(&after->bo_va->base);
  2497		} else {
  2498			kfree(after);
  2499		}
  2500	
  2501		return 0;
  2502	}
  2503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
