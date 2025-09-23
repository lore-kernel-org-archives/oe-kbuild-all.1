Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E32E30CDBF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 05:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758605592; cv=none; b=PVzcMFJlbYn5pppyy6e+2Lc8Iy9LlAPdiJsGUmjF9SMisx6RX32FUqe/C+Ug53AGyK+XuCZRYL7Hk3FYJeFk5zQgi2CkFhkukl7eHbQk8l4azjnc9sQkcvidT/sZvJaxT2UVXVEdo1zrxONTVRB0rzo2RNU6b7ptSo+VbiAd30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758605592; c=relaxed/simple;
	bh=aLTjwzCVK/lGl4WzD/MLN22RDjFdW0a8qUDjmfmb3uI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1BV5ArHYMjkcOth+Xz1QELe4Gs4BTBS6RD7EmAa7lQhRONEPx1VGx4T3M3SHyR9p9dDCMha+as4+FWdu9hgAgnztRXPIeoPBK+7rklOVMbYm2JHn47+NJuykxyXHRyHOcGRU83FOYyLYqXD6qzD+wvs0sk4pSSuDZI3CLN1zGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddr/RVP8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddr/RVP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758605589; x=1790141589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLTjwzCVK/lGl4WzD/MLN22RDjFdW0a8qUDjmfmb3uI=;
  b=ddr/RVP8CsV1ds+91jlWrSnm5JpUwoL9mIDNO9azSIa4FofZ2KTL3Cg3
   dbdIhYo9mmsiyJkFs3/supDsoSm+iM3bUn3lqdi+yIXafOt3U9QxFEfym
   zipkahFvFOcBa8ouVnZrrJyImxK7o6dJKS+RSnQvo3yZFoeLv4gCVQesn
   H9t8T+LFm2YwbZbTJ5sOMrINc2KLssEPFSSh1ruL1ID6MnKbj/fYvd59P
   BDGugCX2pY/mFiLR1C4EZfr4/zcodqRbuIOAKFuYUq8IT+RuhOSPlyYGR
   dDHQBRoyaVl2eYCyGv6BK2AyX+t5qa5Bu2j1D5omj/FP/PxB/li8d2LZT
   w==;
X-CSE-ConnectionGUID: TZWuxFimTFC3ZZ3hdgOJNA==
X-CSE-MsgGUID: nfvDLuimREWIqOxOsaODqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59917763"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="59917763"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 22:33:09 -0700
X-CSE-ConnectionGUID: HfJ77/qiR3u6b/nKxDOUtA==
X-CSE-MsgGUID: xYFfrVgJTZiQ86fuSe4wYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181836595"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Sep 2025 22:33:07 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0ve9-0002mX-2l;
	Tue, 23 Sep 2025 05:33:02 +0000
Date: Tue, 23 Sep 2025 13:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] mm/mem_sampling.c:35:18: warning:
 unused variable 'mem_sampling_min_value'
Message-ID: <202509231319.810I86nl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be758a5796c3d280deb877699c41fd0cd04e1deb
commit: 390982f28c5796a1e590381044630b768e6b9696 [2909/2909] mm/mem_sampling: Add sysctl control for NUMA balancing integration
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231319.810I86nl-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231319.810I86nl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231319.810I86nl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_sampling.c:68:6: warning: no previous prototype for function 'mem_sampling_record_cb_register' [-Wmissing-prototypes]
   void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
        ^
   mm/mem_sampling.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
   ^
   static 
   mm/mem_sampling.c:85:6: warning: no previous prototype for function 'mem_sampling_record_cb_unregister' [-Wmissing-prototypes]
   void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
        ^
   mm/mem_sampling.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
   ^
   static 
>> mm/mem_sampling.c:35:18: warning: unused variable 'mem_sampling_min_value' [-Wunused-const-variable]
   static const int mem_sampling_min_value = MEM_SAMPLING_MIN_VALUE;
                    ^
>> mm/mem_sampling.c:36:18: warning: unused variable 'mem_sampling_max_value' [-Wunused-const-variable]
   static const int mem_sampling_max_value = MEM_SAMPLING_MAX_VALUE;
                    ^
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING
   Depends on [n]: ARM_SPE_PMU [=n]
   Selected by [y]:
   - MEM_SAMPLING [=y] && ARM64 [=y]


vim +/mem_sampling_min_value +35 mm/mem_sampling.c

    34	
  > 35	static const int mem_sampling_min_value = MEM_SAMPLING_MIN_VALUE;
  > 36	static const int mem_sampling_max_value = MEM_SAMPLING_MAX_VALUE;
    37	
    38	/* keep track of who use the SPE */
    39	DEFINE_PER_CPU(enum arm_spe_user_e, arm_spe_user);
    40	EXPORT_PER_CPU_SYMBOL_GPL(arm_spe_user);
    41	
    42	enum mem_sampling_saved_state_e {
    43		MEM_SAMPLING_STATE_ENABLE,
    44		MEM_SAMPLING_STATE_DISABLE,
    45		MEM_SAMPLING_STATE_EMPTY,
    46	};
    47	enum mem_sampling_saved_state_e mem_sampling_saved_state = MEM_SAMPLING_STATE_EMPTY;
    48	
    49	/*
    50	 * Callbacks should be registered using mem_sampling_record_cb_register()
    51	 * by NUMA, DAMON and etc during their initialisation.
    52	 * Callbacks will be invoked on new hardware pmu records caputured.
    53	 */
    54	typedef void (*mem_sampling_record_cb_type)(struct mem_sampling_record *record);
    55	
    56	struct mem_sampling_record_cb_list_entry {
    57		struct list_head list;
    58		mem_sampling_record_cb_type cb;
    59	};
    60	LIST_HEAD(mem_sampling_record_cb_list);
    61	
    62	struct mem_sampling_numa_access_work {
    63		struct callback_head work;
    64		u64 vaddr, paddr;
    65		int cpu;
    66	};
    67	
    68	void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
    69	{
    70		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    71	
    72		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    73			if (cb_entry->cb == cb)
    74				return;
    75		}
    76	
    77		cb_entry = kmalloc(sizeof(struct mem_sampling_record_cb_list_entry), GFP_KERNEL);
    78		if (!cb_entry)
    79			return;
    80	
    81		cb_entry->cb = cb;
    82		list_add(&(cb_entry->list), &mem_sampling_record_cb_list);
    83	}
    84	
  > 85	void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
    86	{
    87		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    88	
    89		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    90			if (cb_entry->cb == cb) {
    91				list_del(&cb_entry->list);
    92				kfree(cb_entry);
    93				return;
    94			}
    95		}
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
