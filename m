Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289D7262E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 00:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294557; cv=none; b=ZVPesHcOX4vLsm6FOfI662ZrWNLrv6ut7IqxYVFfSBhoygOlIPhzzpzhdnHJZp3ZmWkzcGbjYom7WBQqI/Ai2JuyNJ7P5mCNM5SflezyJj6TIzlN1mdp44OaxUCJn0674Etw0jffmwA6ZXm8/kEgbOX1bklOnVV2wduTNwKtNag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294557; c=relaxed/simple;
	bh=38GML2SM83gnoHmdRMrinidTicqeZbmUhpnYcY0xQ5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3grPo0prIlC2bmo9OKk1dQF1eKIW0Pi8cQWdfilklbJmlZNkx2gfuoNsw4+ZgDoDNSDIb/FUDAVfAeYxXy1pNmyznDrRECKkm5X8Ns99gDo9kZiQrl4sENHeR/HXODW0aS3pXRP/5DPOWh/q1n1rxByIF59CJ1pTK/6k3O1+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq7tU1LU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq7tU1LU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790294554; x=1821830554;
  h=date:from:to:cc:subject:message-id;
  bh=38GML2SM83gnoHmdRMrinidTicqeZbmUhpnYcY0xQ5Q=;
  b=mq7tU1LUeFk662aIdou4D2lwL02Pyl064aVPOgHYLRmFC6nXqfoCVDlN
   2AZHVJ6NpGxHJg0FBGa4/dp/chn87/CkzUgYh+OWJGQ1A900KzMYp+RPx
   LTJP9E4nWMxPO9LF5iKmO36ynMSoChH4gZ3m8PyC0Fw3zGcZ2AWawD8Pd
   lsgb9N0RNfih0yC8jb6Lesu3nicjbgr7649gOxqfantLCRYUrCk3WnPUp
   vh/5r576RJ7rRUlvYoNLVvhrKxDymNIhfttPpATdqzQaw7fnZ4E3wwFFL
   +SPNCcx6CrUhtnu/Wowt6JUgvdkUTwJMVILMknjJGUfJWxOlO3fYOIvE5
   w==;
X-CSE-ConnectionGUID: QkSFJ1pnSYGujR/JmoRwJQ==
X-CSE-MsgGUID: g+3KFjEjQ36vmHc8XBy/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93800011"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93800011"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:02:34 -0700
X-CSE-ConnectionGUID: FNhe7lUGQ16x00M+nt3R1A==
X-CSE-MsgGUID: OxzvkPlVQAiQcgCg91TGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277344306"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2026 17:02:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9tOY-00000000Jps-0NYA;
	Fri, 25 Sep 2026 00:02:30 +0000
Date: Fri, 25 Sep 2026 08:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 2/2]
 arch/arm64/kvm/pkvm.c:1448:16: warning: variable 'size' set but not used
Message-ID: <202609250751.qIJ1Fsjw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   20ed81c930ecc79af10bfca7c8de6d163fe051b7
commit: c42c886c1098479b7f8665bad536aab702fe00ae [2/2] ANDROID: KVM: arm64: Dedicated hyp VA space for pKVM modules
config: arm64-randconfig-1000-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250751.qIJ1Fsjw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250751.qIJ1Fsjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250751.qIJ1Fsjw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c:767:5: warning: no previous prototype for 'pkvm_enable_smc_forwarding' [-Wmissing-prototypes]
     767 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/pkvm.c: In function '__pkvm_load_el2_module':
>> arch/arm64/kvm/pkvm.c:1448:16: warning: variable 'size' set but not used [-Wunused-but-set-variable]
    1448 |         size_t size;
         |                ^~~~


vim +/size +1448 arch/arm64/kvm/pkvm.c

c42c886c109847 Vincent Donnefort 2026-02-18  1433  
a451f5def68d94 Will Deacon       2023-01-05  1434  int __pkvm_load_el2_module(struct module *this, unsigned long *token)
5cdb0cf245ab7f Quentin Perret    2022-10-06  1435  {
a451f5def68d94 Will Deacon       2023-01-05  1436  	struct pkvm_el2_module *mod = &this->arch.hyp;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1437  	struct pkvm_mod_sec_mapping secs_map[] = {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1438  		{ &mod->text, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_X },
5cdb0cf245ab7f Quentin Perret    2022-10-06  1439  		{ &mod->bss, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_W },
5cdb0cf245ab7f Quentin Perret    2022-10-06  1440  		{ &mod->rodata, KVM_PGTABLE_PROT_R },
67a6af878a0b8e Vincent Donnefort 2023-02-10  1441  		{ &mod->event_ids, KVM_PGTABLE_PROT_R },
68116822eaad28 Vincent Donnefort 2024-10-01  1442  		{ &mod->patchable_function_entries, KVM_PGTABLE_PROT_R },
5cdb0cf245ab7f Quentin Perret    2022-10-06  1443  		{ &mod->data, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_W },
5cdb0cf245ab7f Quentin Perret    2022-10-06  1444  	};
58a9340b99aab5 Vincent Donnefort 2024-09-24  1445  	void *start, *end, *hyp_va, *mod_remap;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1446  	kvm_nvhe_reloc_t *endrel;
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1447  	int ret, i, secs_first;
58a9340b99aab5 Vincent Donnefort 2024-09-24 @1448  	size_t size;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1449  
2f93d6d9b2eba3 Vincent Donnefort 2023-02-21  1450  	/* The pKVM hyp only allows loading before it is fully initialized */
2f93d6d9b2eba3 Vincent Donnefort 2023-02-21  1451  	if (!is_protected_kvm_enabled() || is_pkvm_initialized())
5cdb0cf245ab7f Quentin Perret    2022-10-06  1452  		return -EOPNOTSUPP;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1453  
5cdb0cf245ab7f Quentin Perret    2022-10-06  1454  	for (i = 0; i < ARRAY_SIZE(secs_map); i++) {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1455  		if (!PAGE_ALIGNED(secs_map[i].sec->start)) {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1456  			kvm_err("EL2 sections are not page-aligned\n");
5cdb0cf245ab7f Quentin Perret    2022-10-06  1457  			return -EINVAL;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1458  		}
5cdb0cf245ab7f Quentin Perret    2022-10-06  1459  	}
5cdb0cf245ab7f Quentin Perret    2022-10-06  1460  
5cdb0cf245ab7f Quentin Perret    2022-10-06  1461  	if (!try_module_get(this)) {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1462  		kvm_err("Kernel module has been unloaded\n");
5cdb0cf245ab7f Quentin Perret    2022-10-06  1463  		return -ENODEV;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1464  	}
5cdb0cf245ab7f Quentin Perret    2022-10-06  1465  
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1466  	/* Missing or empty module sections are placed first */
5cdb0cf245ab7f Quentin Perret    2022-10-06  1467  	sort(secs_map, ARRAY_SIZE(secs_map), sizeof(secs_map[0]), __pkvm_cmp_mod_sec, NULL);
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1468  	for (secs_first = 0; secs_first < ARRAY_SIZE(secs_map); secs_first++) {
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1469  		start = secs_map[secs_first].sec->start;
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1470  		if (start)
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1471  			break;
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1472  	}
5cdb0cf245ab7f Quentin Perret    2022-10-06  1473  	end = secs_map[ARRAY_SIZE(secs_map) - 1].sec->end;
a451f5def68d94 Will Deacon       2023-01-05  1474  	size = end - start;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1475  
bec49a4dc10b58 Vincent Donnefort 2024-09-11  1476  	mod->sections.start = start;
bec49a4dc10b58 Vincent Donnefort 2024-09-11  1477  	mod->sections.end = end;
bec49a4dc10b58 Vincent Donnefort 2024-09-11  1478  
c42c886c109847 Vincent Donnefort 2026-02-18  1479  	hyp_va = pkvm_el2_mod_alloc_va((unsigned long)start, (unsigned long)end);
c42c886c109847 Vincent Donnefort 2026-02-18  1480  	if (!hyp_va) {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1481  		kvm_err("Failed to allocate hypervisor VA space for EL2 module\n");
5cdb0cf245ab7f Quentin Perret    2022-10-06  1482  		module_put(this);
c42c886c109847 Vincent Donnefort 2026-02-18  1483  		return -ENOMEM;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1484  	}
bec49a4dc10b58 Vincent Donnefort 2024-09-11  1485  	mod->hyp_va = hyp_va;
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1486  
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1487  	/*
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1488  	 * The token can be used for other calls related to this module.
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1489  	 * Conveniently the only information needed is this addr so let's use it
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1490  	 * as an identifier.
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1491  	 */
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1492  	if (token)
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1493  		*token = (unsigned long)hyp_va;
d5853c90aa60a1 Vincent Donnefort 2022-11-25  1494  
786c201ecda5c2 Vincent Donnefort 2025-10-30  1495  	/* Relies on kvm_apply_hyp_module_relocations() sync_icache_aliases */
928bc54c652c8d Vincent Donnefort 2024-07-05  1496  	ret = pkvm_reloc_imported_symbols(mod);
928bc54c652c8d Vincent Donnefort 2024-07-05  1497  	if (ret)
928bc54c652c8d Vincent Donnefort 2024-07-05  1498  		return ret;
928bc54c652c8d Vincent Donnefort 2024-07-05  1499  
786c201ecda5c2 Vincent Donnefort 2025-10-30  1500  	endrel = (void *)mod->relocs + mod->nr_relocs * sizeof(*endrel);
786c201ecda5c2 Vincent Donnefort 2025-10-30  1501  	kvm_apply_hyp_module_relocations(mod, mod->relocs, endrel);
786c201ecda5c2 Vincent Donnefort 2025-10-30  1502  
9384a0909faf38 Vincent Donnefort 2025-01-24  1503  	pkvm_module_kmemleak(this, secs_map, ARRAY_SIZE(secs_map));
5cdb0cf245ab7f Quentin Perret    2022-10-06  1504  
130bb7e462ade7 Vincent Donnefort 2024-10-01  1505  	ret = hyp_trace_init_mod_events(mod);
67a6af878a0b8e Vincent Donnefort 2023-02-10  1506  	if (ret)
67a6af878a0b8e Vincent Donnefort 2023-02-10  1507  		kvm_err("Failed to init module events: %d\n", ret);
67a6af878a0b8e Vincent Donnefort 2023-02-10  1508  
58a9340b99aab5 Vincent Donnefort 2024-09-24  1509  	mod_remap = pkvm_map_module_struct(mod);
58a9340b99aab5 Vincent Donnefort 2024-09-24  1510  	if (!mod_remap) {
58a9340b99aab5 Vincent Donnefort 2024-09-24  1511  		module_put(this);
58a9340b99aab5 Vincent Donnefort 2024-09-24  1512  		return -ENOMEM;
58a9340b99aab5 Vincent Donnefort 2024-09-24  1513  	}
58a9340b99aab5 Vincent Donnefort 2024-09-24  1514  
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1515  	ret = pkvm_map_module_sections(secs_map + secs_first, hyp_va,
1b4da8c3e8f8df Vincent Donnefort 2023-02-14  1516  				       ARRAY_SIZE(secs_map) - secs_first);
5cdb0cf245ab7f Quentin Perret    2022-10-06  1517  	if (ret) {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1518  		kvm_err("Failed to map EL2 module page: %d\n", ret);
58a9340b99aab5 Vincent Donnefort 2024-09-24  1519  		pkvm_unmap_module_struct(mod_remap);
5cdb0cf245ab7f Quentin Perret    2022-10-06  1520  		module_put(this);
5cdb0cf245ab7f Quentin Perret    2022-10-06  1521  		return ret;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1522  	}
5cdb0cf245ab7f Quentin Perret    2022-10-06  1523  
3e50f5fe014380 Vincent Donnefort 2024-12-24  1524  	pkvm_el2_mod_add(mod);
3e50f5fe014380 Vincent Donnefort 2024-12-24  1525  
58a9340b99aab5 Vincent Donnefort 2024-09-24  1526  	ret = kvm_call_hyp_nvhe(__pkvm_init_module, mod_remap);
58a9340b99aab5 Vincent Donnefort 2024-09-24  1527  	pkvm_unmap_module_struct(mod_remap);
5cdb0cf245ab7f Quentin Perret    2022-10-06  1528  	if (ret) {
5cdb0cf245ab7f Quentin Perret    2022-10-06  1529  		kvm_err("Failed to init EL2 module: %d\n", ret);
3e50f5fe014380 Vincent Donnefort 2024-12-24  1530  		list_del(&mod->node);
5cdb0cf245ab7f Quentin Perret    2022-10-06  1531  		pkvm_unmap_module_sections(secs_map, hyp_va, ARRAY_SIZE(secs_map));
5cdb0cf245ab7f Quentin Perret    2022-10-06  1532  		module_put(this);
5cdb0cf245ab7f Quentin Perret    2022-10-06  1533  		return ret;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1534  	}
5cdb0cf245ab7f Quentin Perret    2022-10-06  1535  
8db2e5709d5260 Vincent Donnefort 2024-10-02  1536  	hyp_trace_enable_event_early();
8db2e5709d5260 Vincent Donnefort 2024-10-02  1537  
5cdb0cf245ab7f Quentin Perret    2022-10-06  1538  	return 0;
5cdb0cf245ab7f Quentin Perret    2022-10-06  1539  }
5cdb0cf245ab7f Quentin Perret    2022-10-06  1540  EXPORT_SYMBOL(__pkvm_load_el2_module);
a871b30b2d2445 Vincent Donnefort 2022-09-27  1541  

:::::: The code at line 1448 was first introduced by commit
:::::: 58a9340b99aab521b150a8bcec37a9f4b2b8c28f ANDROID: KVM: arm64: Pass pkvm_el2_module struct to hypervisor

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
