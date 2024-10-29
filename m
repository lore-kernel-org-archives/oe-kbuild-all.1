Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3B20B1F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 23:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730243680; cv=none; b=WRwe3Ubnteuv2E+eizfjvhum510gppqT8tz71RelQ4diOBOaobQyv0JVJzXrByWUGA26rJjOR1Imrd6NWC/8JQx4nTTq6an2AEcazXA4nem9ryP2AVpWiVS/MwQn9eZM4Ea84HG+RSBLN+/pDk3SoA+NlPAA9sCip4iH93HR30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730243680; c=relaxed/simple;
	bh=Zakso6BUGEM+pzf8CXOfuXFvyoKUP7EJLMbFNA57TJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pfyzD3FtvYmjJAus0fJyZJ13u8SN3q0gbyAT7NYT9Doe3TzQ3NuqQvO35UMLaV5WaYLj3JWwyRWqEWZaQpa2hWck1MaJAOuEU7hVX6dJ/xmoMPKCEAChIVZaO84CcpiqAcTazOZEs+6bw1RjD6H9OHqsL6CSJy6TSYUdsouEEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqejwcrI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqejwcrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730243676; x=1761779676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zakso6BUGEM+pzf8CXOfuXFvyoKUP7EJLMbFNA57TJI=;
  b=HqejwcrIlbb9cmQfHx0BhehrVfmbu4P5SbyVW4Sa1i9qLyuKTCZ91drk
   4TxLWFjhhyD7BC4bm4gMJPb/2KSuB2I0QtLeVSY8156YN3ONmGL7qIxp8
   rV7ZH0w2Mhtj8jwI0bt+jwdcjii7qTZT2/XDx1gL9CySWQp82Boa52frb
   GoXD38FztyOq4CziUHSyIuJb8x8CKOZ3Qz5eAe8M5Vcj4qbAW92BV/QmR
   rWbPxNa0bgwzOIVmbutpQEpZyIVN+vt8e4Nx/TNdrrPS7pPGN885phAo2
   5CIVB6qMvbKZtf7zeESKvh3P29HjM2MEQV9IkR+CXhrclc+fsD8SLEu3M
   A==;
X-CSE-ConnectionGUID: xAouVRUTS8+/zS1ZnCOUmw==
X-CSE-MsgGUID: bt3/mLyjSwyamY5Mi1GW0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41284911"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="41284911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 16:14:36 -0700
X-CSE-ConnectionGUID: vWvwgVDeSUm4g28eacohCQ==
X-CSE-MsgGUID: Ay+8Pd+fRMKXJ4mUB72QTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82192378"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 16:14:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5vQ0-000eGC-2M;
	Tue, 29 Oct 2024 23:14:32 +0000
Date: Wed, 30 Oct 2024 07:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 20/68]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1242:5: warning: no
 previous prototype for function 'smmu_block_dev'
Message-ID: <202410300723.WuQDv0pD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   0db30a10b0076364f5db3533414a8aea94f662d6
commit: 6d9442e74c8cae0a2327d9fa93fa966d775f129e [20/68] ANDROID: drivers/arm-smmu-v3-kvm: Add block_dev
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300723.WuQDv0pD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300723.WuQDv0pD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300723.WuQDv0pD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:770:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     770 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     770 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:803:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     803 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:803:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     803 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:878:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     878 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     878 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1162:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
    1162 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1162 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1181:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
    1181 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1181 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1194:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
    1194 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1194 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1242:5: warning: no previous prototype for function 'smmu_block_dev' [-Wmissing-prototypes]
    1242 | int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1242:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1242 | int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1276:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
    1276 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1276 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1288:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
    1288 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1288 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1301:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
    1301 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1301 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1313:5: warning: no previous prototype for function 'smmu_map_pages' [-Wmissing-prototypes]
    1313 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1313:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1313 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1470:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
    1470 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1470 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         | ^
         | static 
   17 warnings generated.


vim +/smmu_block_dev +1242 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

  1236	
  1237	/*
  1238	 * This will lose the domain information we relying on host attaching to a blocked
  1239	 * domain which is empty, which it will re-attach again after VM dies. (when VIFO detachs
  1240	 * the device)
  1241	 */
> 1242	int smmu_block_dev(struct kvm_hyp_iommu *iommu, u32 sid, bool is_host2guest)
  1243	{
  1244		struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
  1245		u64 *dst;
  1246		int i = 0, nr_entries, cd_sz;
  1247		u64 *cd_table;
  1248		u64 val;
  1249		int ret = 0;
  1250	
  1251		kvm_iommu_lock(iommu);
  1252		dst = smmu_get_ste_ptr(smmu, sid);
  1253		if (!dst)
  1254			goto out_ret;
  1255	
  1256		val = le64_to_cpu(dst[0]);
  1257		cd_table = (u64 *)(FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, val) << 6);
  1258		nr_entries = 1 << FIELD_GET(STRTAB_STE_0_S1CDMAX, val);
  1259		cd_sz = (1 << nr_entries) * (CTXDESC_CD_DWORDS << 3);
  1260	
  1261		/* Good drivers doesn't leak memory. */
  1262		if (cd_table)
  1263			kvm_iommu_reclaim_pages(hyp_phys_to_virt((u64)cd_table), get_order(cd_sz));
  1264	
  1265		/* zap zippity zop. */
  1266		for (i = 0; i < STRTAB_STE_DWORDS; i++)
  1267			dst[i] = 0;
  1268	
  1269		ret = smmu_sync_ste(smmu, dst, sid);
  1270	
  1271	out_ret:
  1272		kvm_iommu_unlock(iommu);
  1273		return ret;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
