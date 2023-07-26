Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAF41FCC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690351199; x=1721887199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJv0tHKHnsjqPxPALYXwmaPEytNPjp69SjJcOP4lWD8=;
  b=VVsURdbNsJZMr7Vzman2p6WftvrCWnHkdLfk5sFBioh5M6WIi3cQgfZg
   RicY8j4yj9220x53/quS8/SRpQBngkHl6I7v6DVmmrboQ9f+VBJEX3aWO
   i2w0RbscghllZw5LQHA7icbFfmIbOMNs2x/GmtWJkJBc0ePkPhK/IZsrB
   edbWe/I19SgIheRRb4BU8WMFwt71qQULUJZEZNfGRAU6XH4QkOHpwSSGF
   9nfZhcxyWC6jsj2fkEpgxSLa9B+EoxN8ortK4VpQ4VQXR9C4eb4MEAewX
   zjltHPYQjlj7fBhzaLDzaYFh+mxaegKGNmGM2HaEpxiPA0t1ZXKubkGc+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370600265"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370600265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 22:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720319906"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="720319906"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 22:59:58 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOXYr-0000iF-2B;
	Wed, 26 Jul 2023 05:59:57 +0000
Date: Wed, 26 Jul 2023 13:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 238/245]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2324:34: error: 'struct
 ttm_buffer_object' has no member named 'base'
Message-ID: <202307261322.Qv0mNpLh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   572f87fe6f7f7edc800ef0b629f9f12d57363af8
commit: 67a85fce010a7e6dcdcd2a2f32a165c1fa660e32 [238/245] drm/amdgpu: fix clearing mappings for BOs that are always valid in VM
config: arc-randconfig-r023-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261322.Qv0mNpLh-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261322.Qv0mNpLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261322.Qv0mNpLh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1164:6: warning: no previous prototype for 'amdgpu_vm_get_entry' [-Wmissing-prototypes]
    1164 | void amdgpu_vm_get_entry(struct amdgpu_pte_update_params *p, uint64_t addr,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: In function 'amdgpu_vm_bo_clear_mappings':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2324:34: error: 'struct ttm_buffer_object' has no member named 'base'
    2324 |                 if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
         |                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2324:56: error: 'struct amdgpu_vm_pt' has no member named 'bo'
    2324 |                 if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
         |                                                        ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2326:25: error: implicit declaration of function 'amdgpu_vm_bo_moved'; did you mean 'amdgpu_vm_bo_size'? [-Werror=implicit-function-declaration]
    2326 |                         amdgpu_vm_bo_moved(&before->bo_va->base);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         amdgpu_vm_bo_size
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2339:34: error: 'struct ttm_buffer_object' has no member named 'base'
    2339 |                 if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
         |                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2339:56: error: 'struct amdgpu_vm_pt' has no member named 'bo'
    2339 |                 if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
         |                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:51,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:33:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h: At top level:
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
   cc1: some warnings being treated as errors


vim +2324 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

  2232	
  2233	/**
  2234	 * amdgpu_vm_bo_clear_mappings - remove all mappings in a specific range
  2235	 *
  2236	 * @adev: amdgpu_device pointer
  2237	 * @vm: VM structure to use
  2238	 * @saddr: start of the range
  2239	 * @size: size of the range
  2240	 *
  2241	 * Remove all mappings in a range, split them as appropriate.
  2242	 *
  2243	 * Returns:
  2244	 * 0 for success, error for failure.
  2245	 */
  2246	int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
  2247					struct amdgpu_vm *vm,
  2248					uint64_t saddr, uint64_t size)
  2249	{
  2250		struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
  2251		LIST_HEAD(removed);
  2252		uint64_t eaddr;
  2253	
  2254		eaddr = saddr + size - 1;
  2255		saddr /= AMDGPU_GPU_PAGE_SIZE;
  2256		eaddr /= AMDGPU_GPU_PAGE_SIZE;
  2257	
  2258		/* Allocate all the needed memory */
  2259		before = kzalloc(sizeof(*before), GFP_KERNEL);
  2260		if (!before)
  2261			return -ENOMEM;
  2262		INIT_LIST_HEAD(&before->list);
  2263	
  2264		after = kzalloc(sizeof(*after), GFP_KERNEL);
  2265		if (!after) {
  2266			kfree(before);
  2267			return -ENOMEM;
  2268		}
  2269		INIT_LIST_HEAD(&after->list);
  2270	
  2271		/* Now gather all removed mappings */
  2272		tmp = amdgpu_vm_it_iter_first(&vm->va, saddr, eaddr);
  2273		while (tmp) {
  2274			/* Remember mapping split at the start */
  2275			if (tmp->start < saddr) {
  2276				before->start = tmp->start;
  2277				before->last = saddr - 1;
  2278				before->offset = tmp->offset;
  2279				before->flags = tmp->flags;
  2280				before->bo_va = tmp->bo_va;
  2281				list_add(&before->list, &tmp->bo_va->invalids);
  2282			}
  2283	
  2284			/* Remember mapping split at the end */
  2285			if (tmp->last > eaddr) {
  2286				after->start = eaddr + 1;
  2287				after->last = tmp->last;
  2288				after->offset = tmp->offset;
  2289				after->offset += (after->start - tmp->start) << PAGE_SHIFT;
  2290				after->flags = tmp->flags;
  2291				after->bo_va = tmp->bo_va;
  2292				list_add(&after->list, &tmp->bo_va->invalids);
  2293			}
  2294	
  2295			list_del(&tmp->list);
  2296			list_add(&tmp->list, &removed);
  2297	
  2298			tmp = amdgpu_vm_it_iter_next(tmp, saddr, eaddr);
  2299		}
  2300	
  2301		/* And free them up */
  2302		list_for_each_entry_safe(tmp, next, &removed, list) {
  2303			amdgpu_vm_it_remove(tmp, &vm->va);
  2304			list_del(&tmp->list);
  2305	
  2306			if (tmp->start < saddr)
  2307			    tmp->start = saddr;
  2308			if (tmp->last > eaddr)
  2309			    tmp->last = eaddr;
  2310	
  2311			tmp->bo_va = NULL;
  2312			list_add(&tmp->list, &vm->freed);
  2313			trace_amdgpu_vm_bo_unmap(NULL, tmp);
  2314		}
  2315	
  2316		/* Insert partial mapping before the range */
  2317		if (!list_empty(&before->list)) {
  2318			struct amdgpu_bo *bo = before->bo_va->base.bo;
  2319	
  2320			amdgpu_vm_it_insert(before, &vm->va);
  2321			if (before->flags & AMDGPU_PTE_PRT)
  2322				amdgpu_vm_prt_get(adev);
  2323	
> 2324			if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
  2325			    !before->bo_va->base.moved)
> 2326				amdgpu_vm_bo_moved(&before->bo_va->base);
  2327		} else {
  2328			kfree(before);
  2329		}
  2330	
  2331		/* Insert partial mapping after the range */
  2332		if (!list_empty(&after->list)) {
  2333			struct amdgpu_bo *bo = after->bo_va->base.bo;
  2334	
  2335			amdgpu_vm_it_insert(after, &vm->va);
  2336			if (after->flags & AMDGPU_PTE_PRT)
  2337				amdgpu_vm_prt_get(adev);
  2338	
  2339			if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
  2340			    !after->bo_va->base.moved)
  2341				amdgpu_vm_bo_moved(&after->bo_va->base);
  2342		} else {
  2343			kfree(after);
  2344		}
  2345	
  2346		return 0;
  2347	}
  2348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
