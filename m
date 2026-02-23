Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886212874FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860131; cv=none; b=rsfhceDEsV2okhoIVN7OpW9b5SG8odOeck2HaM4WXpkg42bivXUCNNGZa1qk5qayyDhB8ut2gyUOZJ4JYBRHX0dWKjxJgyppReVpUa2gl1yCy0ZHezZnbp0MPjIJ95azsdLKDpe6H7510elYatlZU1r5aOIHhl0duzG7mVA3jpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860131; c=relaxed/simple;
	bh=tDs7OiTwnqp+FP3Pu7niSvMBAn7wUR+Bp481sz9tbVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C8annTgLag+V9d8isqBMiDemMQ9OaVIQvd35GTC2Y4xmvuMm2HwhnlZnDOTyRLVInTjU2q2CbH2jFrljftKr8jHQNw/kBKFX/QRsaZpc3P6Uc5HRrJq3DAx9Wcn54e/C4HxJVtEbQeToYFLmwFanGY/xSu2NL37vr2w5s8603I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiKWEHht; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiKWEHht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771860129; x=1803396129;
  h=date:from:to:cc:subject:message-id;
  bh=tDs7OiTwnqp+FP3Pu7niSvMBAn7wUR+Bp481sz9tbVg=;
  b=DiKWEHhttVwsu2EkpEDadYOXSFdFDUKEbbElYUm2lW9fxBLNv4itBhp9
   Si8oFYtfIXA7OA2RE/cNA61ErZL97cHfBPZT448qXlv5cDSWeL142jOZv
   Yzhq0/thtcC+AwUxzJuFKWPWuHG1XusGjOyiIrJYKX6QggK74AFLno9BY
   zPf/IwoRBxeCnKanoa7caAUP3lTHy0n+c/ZMhtmxm+Yll+kF3S0zurXdR
   Trk5x3vK5OG/d3ieRmdZYk4BporE/JxXsII3KbDVhaxNRcinEzyouYm04
   aU2Gwm47m8ixYAIMo4HgzZCwmsYvvJwfMO1EkMijQE6hqajlVece9HGdw
   A==;
X-CSE-ConnectionGUID: RLuC+z/yRY2+gTp5xdvf3w==
X-CSE-MsgGUID: BGEhdvdsQ/6ltFXk5JCMAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72921701"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72921701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:22:09 -0800
X-CSE-ConnectionGUID: wg/NLFSnTLmXPnh7PwZJCA==
X-CSE-MsgGUID: 4T1JMjhpScWrYz3ThXW6lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="219140545"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2026 07:22:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuXkR-000000000Qf-3slt;
	Mon, 23 Feb 2026 15:21:33 +0000
Date: Mon, 23 Feb 2026 23:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/pkvm.c:1448:9: warning: variable 'size' set but not used
Message-ID: <202602232320.wjG68wP0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c42c886c1098479b7f8665bad536aab702fe00ae
commit: c42c886c1098479b7f8665bad536aab702fe00ae [1/1] ANDROID: KVM: arm64: Dedicated hyp VA space for pKVM modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260223/202602232320.wjG68wP0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602232320.wjG68wP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602232320.wjG68wP0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c:767:5: warning: no previous prototype for function 'pkvm_enable_smc_forwarding' [-Wmissing-prototypes]
     767 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         |     ^
   arch/arm64/kvm/pkvm.c:767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     767 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         | ^
         | static 
>> arch/arm64/kvm/pkvm.c:1448:9: warning: variable 'size' set but not used [-Wunused-but-set-variable]
    1448 |         size_t size;
         |                ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/size +1448 arch/arm64/kvm/pkvm.c

c42c886c1098479 Vincent Donnefort 2026-02-18  1433  
a451f5def68d949 Will Deacon       2023-01-05  1434  int __pkvm_load_el2_module(struct module *this, unsigned long *token)
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1435  {
a451f5def68d949 Will Deacon       2023-01-05  1436  	struct pkvm_el2_module *mod = &this->arch.hyp;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1437  	struct pkvm_mod_sec_mapping secs_map[] = {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1438  		{ &mod->text, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_X },
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1439  		{ &mod->bss, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_W },
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1440  		{ &mod->rodata, KVM_PGTABLE_PROT_R },
67a6af878a0b8ee Vincent Donnefort 2023-02-10  1441  		{ &mod->event_ids, KVM_PGTABLE_PROT_R },
68116822eaad280 Vincent Donnefort 2024-10-01  1442  		{ &mod->patchable_function_entries, KVM_PGTABLE_PROT_R },
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1443  		{ &mod->data, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_W },
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1444  	};
58a9340b99aab52 Vincent Donnefort 2024-09-24  1445  	void *start, *end, *hyp_va, *mod_remap;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1446  	kvm_nvhe_reloc_t *endrel;
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1447  	int ret, i, secs_first;
58a9340b99aab52 Vincent Donnefort 2024-09-24 @1448  	size_t size;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1449  
2f93d6d9b2eba3e Vincent Donnefort 2023-02-21  1450  	/* The pKVM hyp only allows loading before it is fully initialized */
2f93d6d9b2eba3e Vincent Donnefort 2023-02-21  1451  	if (!is_protected_kvm_enabled() || is_pkvm_initialized())
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1452  		return -EOPNOTSUPP;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1453  
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1454  	for (i = 0; i < ARRAY_SIZE(secs_map); i++) {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1455  		if (!PAGE_ALIGNED(secs_map[i].sec->start)) {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1456  			kvm_err("EL2 sections are not page-aligned\n");
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1457  			return -EINVAL;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1458  		}
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1459  	}
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1460  
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1461  	if (!try_module_get(this)) {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1462  		kvm_err("Kernel module has been unloaded\n");
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1463  		return -ENODEV;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1464  	}
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1465  
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1466  	/* Missing or empty module sections are placed first */
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1467  	sort(secs_map, ARRAY_SIZE(secs_map), sizeof(secs_map[0]), __pkvm_cmp_mod_sec, NULL);
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1468  	for (secs_first = 0; secs_first < ARRAY_SIZE(secs_map); secs_first++) {
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1469  		start = secs_map[secs_first].sec->start;
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1470  		if (start)
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1471  			break;
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1472  	}
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1473  	end = secs_map[ARRAY_SIZE(secs_map) - 1].sec->end;
a451f5def68d949 Will Deacon       2023-01-05  1474  	size = end - start;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1475  
bec49a4dc10b58d Vincent Donnefort 2024-09-11  1476  	mod->sections.start = start;
bec49a4dc10b58d Vincent Donnefort 2024-09-11  1477  	mod->sections.end = end;
bec49a4dc10b58d Vincent Donnefort 2024-09-11  1478  
c42c886c1098479 Vincent Donnefort 2026-02-18  1479  	hyp_va = pkvm_el2_mod_alloc_va((unsigned long)start, (unsigned long)end);
c42c886c1098479 Vincent Donnefort 2026-02-18  1480  	if (!hyp_va) {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1481  		kvm_err("Failed to allocate hypervisor VA space for EL2 module\n");
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1482  		module_put(this);
c42c886c1098479 Vincent Donnefort 2026-02-18  1483  		return -ENOMEM;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1484  	}
bec49a4dc10b58d Vincent Donnefort 2024-09-11  1485  	mod->hyp_va = hyp_va;
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1486  
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1487  	/*
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1488  	 * The token can be used for other calls related to this module.
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1489  	 * Conveniently the only information needed is this addr so let's use it
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1490  	 * as an identifier.
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1491  	 */
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1492  	if (token)
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1493  		*token = (unsigned long)hyp_va;
d5853c90aa60a15 Vincent Donnefort 2022-11-25  1494  
786c201ecda5c20 Vincent Donnefort 2025-10-30  1495  	/* Relies on kvm_apply_hyp_module_relocations() sync_icache_aliases */
928bc54c652c8d9 Vincent Donnefort 2024-07-05  1496  	ret = pkvm_reloc_imported_symbols(mod);
928bc54c652c8d9 Vincent Donnefort 2024-07-05  1497  	if (ret)
928bc54c652c8d9 Vincent Donnefort 2024-07-05  1498  		return ret;
928bc54c652c8d9 Vincent Donnefort 2024-07-05  1499  
786c201ecda5c20 Vincent Donnefort 2025-10-30  1500  	endrel = (void *)mod->relocs + mod->nr_relocs * sizeof(*endrel);
786c201ecda5c20 Vincent Donnefort 2025-10-30  1501  	kvm_apply_hyp_module_relocations(mod, mod->relocs, endrel);
786c201ecda5c20 Vincent Donnefort 2025-10-30  1502  
9384a0909faf38f Vincent Donnefort 2025-01-24  1503  	pkvm_module_kmemleak(this, secs_map, ARRAY_SIZE(secs_map));
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1504  
130bb7e462ade76 Vincent Donnefort 2024-10-01  1505  	ret = hyp_trace_init_mod_events(mod);
67a6af878a0b8ee Vincent Donnefort 2023-02-10  1506  	if (ret)
67a6af878a0b8ee Vincent Donnefort 2023-02-10  1507  		kvm_err("Failed to init module events: %d\n", ret);
67a6af878a0b8ee Vincent Donnefort 2023-02-10  1508  
58a9340b99aab52 Vincent Donnefort 2024-09-24  1509  	mod_remap = pkvm_map_module_struct(mod);
58a9340b99aab52 Vincent Donnefort 2024-09-24  1510  	if (!mod_remap) {
58a9340b99aab52 Vincent Donnefort 2024-09-24  1511  		module_put(this);
58a9340b99aab52 Vincent Donnefort 2024-09-24  1512  		return -ENOMEM;
58a9340b99aab52 Vincent Donnefort 2024-09-24  1513  	}
58a9340b99aab52 Vincent Donnefort 2024-09-24  1514  
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1515  	ret = pkvm_map_module_sections(secs_map + secs_first, hyp_va,
1b4da8c3e8f8df3 Vincent Donnefort 2023-02-14  1516  				       ARRAY_SIZE(secs_map) - secs_first);
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1517  	if (ret) {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1518  		kvm_err("Failed to map EL2 module page: %d\n", ret);
58a9340b99aab52 Vincent Donnefort 2024-09-24  1519  		pkvm_unmap_module_struct(mod_remap);
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1520  		module_put(this);
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1521  		return ret;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1522  	}
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1523  
3e50f5fe0143806 Vincent Donnefort 2024-12-24  1524  	pkvm_el2_mod_add(mod);
3e50f5fe0143806 Vincent Donnefort 2024-12-24  1525  
58a9340b99aab52 Vincent Donnefort 2024-09-24  1526  	ret = kvm_call_hyp_nvhe(__pkvm_init_module, mod_remap);
58a9340b99aab52 Vincent Donnefort 2024-09-24  1527  	pkvm_unmap_module_struct(mod_remap);
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1528  	if (ret) {
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1529  		kvm_err("Failed to init EL2 module: %d\n", ret);
3e50f5fe0143806 Vincent Donnefort 2024-12-24  1530  		list_del(&mod->node);
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1531  		pkvm_unmap_module_sections(secs_map, hyp_va, ARRAY_SIZE(secs_map));
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1532  		module_put(this);
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1533  		return ret;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1534  	}
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1535  
8db2e5709d52605 Vincent Donnefort 2024-10-02  1536  	hyp_trace_enable_event_early();
8db2e5709d52605 Vincent Donnefort 2024-10-02  1537  
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1538  	return 0;
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1539  }
5cdb0cf245ab7fa Quentin Perret    2022-10-06  1540  EXPORT_SYMBOL(__pkvm_load_el2_module);
a871b30b2d24452 Vincent Donnefort 2022-09-27  1541  

:::::: The code at line 1448 was first introduced by commit
:::::: 58a9340b99aab521b150a8bcec37a9f4b2b8c28f ANDROID: KVM: arm64: Pass pkvm_el2_module struct to hypervisor

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
